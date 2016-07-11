<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.typeutil.entity.*" %>
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
<title><%=ptname %>-试用期管理</title>
	<jsp:include page="../import.jsp" />
<style type="text/css">
#info_table th {
	text-align: center;
}
</style>
</head>
<body>
<jsp:include page="../head.jsp" />
<table id="info_table" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">对员工的试用期信息进行维护</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体"><font color="red"></font></div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">试用期信息</legend>
		<div>
		<table class="table"  style="line-height: 32px;" width="700" align="center" cellpadding="1" cellspacing="1">
		<tr>
<th>员工编号</th><th>姓名</th><th>部门</th><th>岗位</th><th>员工状态</th><th>操作</th>
</tr>
<c:forEach items="${emp_linshi}" var="emp">
<form action="/hrsys/EmployeeServlet?flag=update&id=${emp.id}" method="post">
<tr>
<td align="center">${emp.id}</td>
<td align="center">${emp.name}</td>
	<td align="center">${typeUtil.getDepartmentName(emp.department_id)}</td>
	<td align="center">${typeUtil.getJobName(emp.job_id)}</td>
<td align="center"><SELECT name="probation_status" id="probation_status">
				 <option value="3" selected>转正</option>
				 <option value="4">延期</option>
				 <option value="5">不予录用</option>
		</SELECT></td>
		<td align="center">
		<input	type="submit" value="确定" >
		</td>
</tr></form>
</c:forEach>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div style="text-align: center; height: 50px">
			<input id="returnbtn"  type="button" value="返回" onclick="history.back()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</div>
		</fieldset>
		<br/>
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