import java.sql.*;

public class test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //1,加载驱动
        Class.forName("com.mysql.cj.jdbc.Driver");

        //2、用户信息和URL
        String url="jdbc:mysql://localhost:3307/student?useUnicode=true&characterEncoding=utf8&serverTimezone=Asia/Shanghai";
        String username="root";
        String password="1234567890";

        //3、连接成功，数据库对象  Connection代表数据库
        Connection connection = DriverManager.getConnection(url, username, password);

        //4、执行SQL对象  statement 执行sql对象
        Statement statement = connection.createStatement();

        //5、执行SQL对象 去 执行SQL，可能存在结果，查看返回结果
        String sql="SELECT * FROM student";
        ResultSet resultSet = statement.executeQuery(sql);//返回结果集,结果封装了我们全部查询的结果

        while (resultSet.next()){
            System.out.println("id="+resultSet.getObject("id"));
            System.out.println("name="+resultSet.getObject("name"));
            System.out.println("sex="+resultSet.getObject("sex"));
            System.out.println("age="+resultSet.getObject("age"));
            System.out.println("grade="+resultSet.getObject("grade"));
            System.out.println("score="+resultSet.getObject("score"));
            System.out.println("--------------");
        }

        //6、释放连接

        resultSet.close();
        statement.close();
        connection.close();
    }

}