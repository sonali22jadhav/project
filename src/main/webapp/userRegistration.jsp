```jsp
<%@ page import="java.sql.*"%>
<%
    String userName = request.getParameter("userName");
    String password = request.getParameter("password");
    String firstName = request.getParameter("firstName");
    String lastName = request.getParameter("lastName");
    String email = request.getParameter("email");

    // Read database configuration from Docker environment variables
    String dbUrl = System.getenv("DB_URL");
    String dbUser = System.getenv("DB_USER");
    String dbPassword = System.getenv("DB_PASSWORD");

    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
        dbUrl,
        dbUser,
        dbPassword
    );

    String sql = "INSERT INTO users " +
                 "(first_name, last_name, email, username, password, regdate) " +
                 "VALUES (?, ?, ?, ?, ?, CURDATE())";

    PreparedStatement ps = con.prepareStatement(sql);

    ps.setString(1, firstName);
    ps.setString(2, lastName);
    ps.setString(3, email);
    ps.setString(4, userName);
    ps.setString(5, password);

    int i = ps.executeUpdate();

    if (i > 0) {
        response.sendRedirect("welcome.jsp");
    } else {
        response.sendRedirect("index.jsp");
    }

    ps.close();
    con.close();
%>
```
