<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("username");   
    String pwd = request.getParameter("password");
    String email = request.getParameter("email");
    String account_type = request.getParameter("account_type");
    
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/Buy","root", "501186Aa");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from User where username='" + userid + "'");
    if (rs.next()) {
        out.println("Username already exists <a href='createAccount.jsp'>try again</a>");
    } else {
    	
    	int i=st.executeUpdate("insert into User(username,password,email, account_type)values('"+userid+"','"+pwd+"','"+email+"','"+account_type+"')");
    	
    	session.setAttribute("user", userid); // the username will be stored in the session
        out.println("Account created successfully");
        out.println("<form action='login.jsp'><input type='submit' value='Login'/></form>");
    }
%>