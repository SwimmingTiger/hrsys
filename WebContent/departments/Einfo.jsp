<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.type.entity.*" %>
<%
String path = request.getContextPath();

String ptname = "人事管理平台";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("typeUtil", TypeUtil.getInstance());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname %>岗位下员工信息</title>
	<jsp:include page="../import.jsp" />
</head>
<body>
<jsp:include page="../head.jsp" />
<form action="JobServlet?flag=add" method="post">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">欢迎进入人事管理平台</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写</div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">部门下员工信息</legend>
		<p style="font-size:16px;">当前部门：${department.name}<a href="departmentsServlet.action?flag=allDepartments">（点击返回部门管理页面）</a></p>
		
		<table class="table" style="position:relative;">
          <tr>
            <th style="text-align:center; width: 100px">员工号</th>
            <th style="text-align:center;width: 150px">姓名</th>
            <th style="text-align:center;width: 100px">性别</th>
            <th style="text-align:center;width: 180px">入职日期</th>
            <th style="text-align:center;width: 150px">部门</th>
            <th style="text-align:center;width: 150px">人员来源</th>
          </tr>
          
        <c:forEach items="${allEmp}" var="emp">
		<tr>
		<td style="text-align:center;">${emp.id}</td>
		<td style="text-align:center;">${emp.name}</td>
		<td style="text-align:center;">${typeUtil.getItemName(emp.sex_id)}</td>
		<td style="text-align:center;">${emp.join_date}</td>
		<td style="text-align:center;">${typeUtil.getDepartmentName(emp.department_id)}</td>
		<td style="text-align:center;">${typeUtil.getItemName(emp.hr_type_id)}</td>
		</c:forEach>
		</tr>
      </table>
		</fieldset>

		</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_right.jpg"></td>
</tr>
<tr height="16">
<td width="9" background="<%=path %>/images/regimages/reg_bottom1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_bottom2.jpg"></td>
<td width="13" background="<%=path %>/images/regimages/reg_bottom3.jpg"></td>
</tr>
</table>
</form>              


<center>
<jsp:include page="../foot.jsp"></jsp:include>
</center>


</body>
</html>