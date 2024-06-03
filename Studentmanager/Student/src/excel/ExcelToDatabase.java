package excel;

import java.io.IOException;
import java.io.InputStream;
import java.io.Serial;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.sun.media.sound.InvalidFormatException;
import org.apache.poi.ss.usermodel.*;

@WebServlet("/ExcelToDatabase")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2 MB
        maxFileSize = 1024 * 1024 * 10,      // 10 MB
        maxRequestSize = 1024 * 1024 * 50    // 50 MB
)
public class ExcelToDatabase extends HttpServlet {
    @Serial
    private static final long serialVersionUID = 1L;

    @Override
    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new ServletException("JDBC Driver not found.", e);
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/student?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai", "root", "1234567890")) {
            if (connection != null && !connection.isClosed()) {
                System.out.println("Database connection successful!");

                Part filePart = request.getPart("excelFile");
                try (InputStream fileContent = filePart.getInputStream()) {

                    Workbook workbook = WorkbookFactory.create(fileContent);
                    Sheet sheet = workbook.getSheetAt(0);

                    for (int i = 1; i <= sheet.getLastRowNum(); i++) {
                        Row row = sheet.getRow(i);
                        int Id = (int) row.getCell(0).getNumericCellValue();
                        String name = row.getCell(1).getStringCellValue();
                        String sex = row.getCell(2).getStringCellValue();
                        int age = (int) row.getCell(3).getNumericCellValue();
                        String grade = row.getCell(4).getStringCellValue();
                        int score = (int) row.getCell(5).getNumericCellValue();

                        String sql = "INSERT INTO student (Id, name, sex, age, grade, score) VALUES (?, ?, ?, ?, ?, ?)";
                        try (PreparedStatement statement = connection.prepareStatement(sql)) {
                            statement.setInt(1, Id);
                            statement.setString(2, name);
                            statement.setString(3, sex);
                            statement.setInt(4, age);
                            statement.setString(5, grade);
                            statement.setInt(6, score);
                            statement.executeUpdate();
                        }
                    }

                    response.sendRedirect("uploadSuccess.jsp");

                } catch (SQLException | InvalidFormatException e) {
                    e.printStackTrace();
                    response.sendRedirect("uploadError.jsp");
                }

            } else {
                System.out.println("Failed to make database connection!");
                response.sendRedirect("databaseError.jsp");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("databaseError.jsp");
        }
    }
}
