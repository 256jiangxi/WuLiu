<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*"%>
<jsp:useBean id="connection" scope="page" class="com.wy.JDBConnection"/>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="CSS/style.css">
<title>
enterprise page
</title>
</head>
<%
ResultSet rs=null;
String sql,login;
int code;
%>
<body bgcolor="#ffffff">
<jsp:include page="/top.jsp"/>
<%
login=(String)session.getAttribute("login");
if(login==null)
{
%>
<script language="javascript">
alert("����δ��¼�����������ϸ��Ϣ������");
</script>
<%
response.sendRedirect("login.jsp");
}
%>
<table width="786" border="1" align="center" cellpadding="0" cellspacing="0"bordercolor="#FFFFFF" bordercolordark="#333333" bordercolorlight="#FFFFFF">
<%
String userName=(String)session.getAttribute("name");
sql="select *  from tb_Enterprise where ID="+request.getParameter("id");
rs=connection.executeQuery(sql);
while(rs.next())
{
	code=rs.getInt("ID");
%>
    <tr>
    <td width="786" height="40" colspan="4">
      <p align="center"><font size="6">��ҵ��Ϣչʾ</font></td>
  </tr>
<form name="form1" method="post" action="enterprise_changeConfig.jsp">
  <tr>
    <td width="115" height="36">��ҵ���ͣ�</td>
    <td width="265" height="36"><input type="text" name="style" size="20"  value="<%=rs.getString("EnterpriseSort")%>"></td>
    <td width="125" height="36">��ҵ���ƣ�</td>
    <td width="253" height="36"><input type="text" name="name" size="20" value="<%=rs.getString("EnterpriseName")%>"></td>
  </tr>
  <tr>
    <td width="115" height="35">��Ӫ��Χ</td>
    <td width="265" height="35"><input type="text" name="operation" size="20" value="<%=rs.getString("Operation")%>"></td>
    <td width="125" height="35">��������</td>
    <td width="253" height="35"><input type="text" name="area" size="20"value="<%=rs.getString("WorkArea")%>"></td>
  </tr>
  <tr>
    <td width="115" height="38">��ҵ��ַ</td>
    <td width="265" height="38"><input type="text" name="address" size="20"value="<%=rs.getString("Address")%>"></td>
    <td width="125" height="38">��ϵ�绰��</td>
    <td width="253" height="38"><input type="text" name="phone" size="20"value="<%=rs.getString("Phone")%>"></td>
  </tr>
  <tr>
    <td width="115" height="34">��ϵ�ˣ�</td>
    <td width="265" height="34"><input type="text" name="linkman" size="20"value="<%=rs.getString("LinkMan")%>"></td>
    <td width="125" height="34">�ֻ��ţ�</td>
    <td width="253" height="34"><input type="text" name="hand" size="20"value="<%=rs.getString("HandSet")%>"></td>
  </tr>
  <tr>
    <td width="115" height="35">����ţ�</td>
    <td width="265" height="35"><input type="text" name="fax" size="20"value="<%=rs.getString("Fax")%>"></td>
    <td width="125" height="35">�ʼ���ַ</td>
    <td width="253" height="35"><input type="text" name="email" size="20"value="<%=rs.getString("Email")%>"></td>
  </tr>
  <tr>
    <td width="115" height="34">��ҵ��ַ��</td>
    <td width="265" height="34"><input type="text" name="web" size="20"value="<%=rs.getString("Http")%>"></td>
    <td width="125" height="34">���ͽ��ܣ�</td>
    <td width="253" height="34"><input type="text" name="intr" size="20"value="<%=rs.getString("Intro")%>"></td>
  </tr>
<tr>
    <td width="115" height="34">����ʱ�䣺</td>
    <td width="265" height="34"><%=rs.getString("IssueDate")%></td>
    <td width="125" height="34">�����ˣ�</td>
<%
String username=rs.getString("UserName");
%>
   <td width="253" height="34"><%=username%><input type="hidden" name="code" size="10"value="<%=code%>"></td>
  </tr>
<%
if(username.equals(userName))
{
%>
  <tr>
    <td width="786" height="45" colspan="4" align="center">                 
      <p><input type="submit" value="�޸�" name="B1"><input type="reset" value="��д" name="B2">&nbsp;&nbsp;
     <a href="enterprise_delet.jsp?id=<%=code%>"> ɾ��</a>      
</td>
  </tr>
  
<%
}
%>
</form>
<%
}
%>
</table>
</body>
</html>