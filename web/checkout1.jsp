<%-- 
    Document   : orders-list
    Created on : Jul 26, 2016, 7:29:47 PM
    Author     : DELL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*"%>
<% 
    response.setHeader("Cache-Control", "no-cache");
    response.setHeader("Cache-Control", "no-store");
    response.setDateHeader("Expires", 0);
    response.setHeader("Pragma", "no-cache");
    
    String m=(String)session.getAttribute("email");
        if(m==null)
        {
            session.setAttribute("msg0", "Please login first.");
            //RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            //rd.forward(request, response);
            response.sendRedirect("login.jsp?action=checkout");
        }
       

        %>
        
        <%!
        
        String price1="";
        
        %>
        
<%
    String act=(String)session.getAttribute("email");
    String oid=(String)session.getAttribute("oid");
    String[] arr={"oid","Name","Phone Number","Delivery Address","Delivery Time","Payment Type"};
    int[] no=new int[20];
    String items="";
    char ch2;
    String[][] str=new String[20][100];
    String[][] ar=new String[20][100];
    
     int y=1,z=4,p=2,e=3;
    for(int b=1;b<=6;b++)
    {
       out.println(ar[b][1]=arr[b-1]);
    }
  
      out.println("<br>");
      out.println("<br>");
    try{
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlinefood", "root", "root");
    Statement st=con.createStatement();
    ResultSet rs=null;
    
      rs=st.executeQuery("select * from orderdata where eid='"+act+"' order by ordertime desc");
    while(rs.next())
    {
       out.println( ar[1][p]=rs.getString(4));
        out.println(p++);
    }
    
     out.println("<br>");
     out.println("==================================");
     out.println("<br>");
    
    for(int t=2;t<=p;t++)
    {
    rs=st.executeQuery("select * from userdetails where oid='"+ar[1][t]+"'");
    if(rs.next())
    {
       out.println( ar[4][t]=rs.getString(3));
       out.println(ar[5][t]=rs.getString(4));
       out.println( ar[6][t]=rs.getString(5));
    }
   }
    out.println("<br>");
     out.println("==================================");
     out.println("<br>");
     
     rs=st.executeQuery("select * from register where eid='"+act+"'");
     if(rs.next())
    {
        for(int b=2;b<=p;b++)
        {
         out.println(ar[2][b]=rs.getString(1)+" "+rs.getString(2));
         out.println(ar[3][b]=rs.getString(6));
         }
    }
     out.println("<br>");
     out.println("==================================");
     out.println("<br>");
      rs=st.executeQuery("select * from register where eid='"+act+"'");
      while(rs.next())
    {
        //str[y][1]="";
        out.println(str[y][1]=rs.getString(4));
        out.println(str[y][2]=rs.getString(3));
        out.println(str[y][2]=rs.getString(3));
        
       out.println( y++);
    }
    
      out.println("<br>");
     out.println("==================================");
     out.println("<br>");
     
     
     int l=1;
    int[][] price=new int[50][50];
    int total=0;
   
    for(int a=1;a<y;a++)
    {
        out.println("aa"+a);
        out.println(str[a][2]);
     total=0;   
    rs=st.executeQuery("select * from orderdata where eid='"+str[a][2]+"'");
    if(rs.next())
    {
        out.println(items=rs.getString(2));
    }
    out.println("<br>");
     out.println("==================================");
     out.println("<br>");
    char[] ch;
    out.println(ch=items.toCharArray());
    out.println(l=ch.length);
    out.println(no[a]=l);
    
     
     out.println("<br>");
     out.println("==================================");
     out.println("<br>");
     
     for(int k=0;k<l;k++)
    {
        out.println(ch2=ch[k]);
        rs=st.executeQuery("select * from items where id='"+ch2+"'");
        if(rs.next())
        {
            out.println(str[a][k+4]=rs.getString(2));
            out.println(price[a][k+1]=rs.getInt(3));
    
            
        }
                out.println(total+=price[a][k+1]);
    }
     out.println("<br>");
     out.println("==================================");
     out.println("<br>");
      out.println(str[a][3]=""+total);
    }
    }catch(Exception e11)
    {
        out.println(e11);
    }
    
   
    
   %>