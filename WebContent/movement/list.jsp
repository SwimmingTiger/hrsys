<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.typeutil.entity.*" %>
<%@ page import="dlnu.hrsys.employee.dao.EmployeeDao" %>
<%@ page import="dlnu.hrsys.employee.impl.EmployeeDaoImpl" %>
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
<title><%=ptname %>-部门/岗位调动记录</title>
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
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">查看员工的部门/岗位调动记录</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体"><font color="red"></font></div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">部门/岗位调动记录</legend>
		<div>
		<table class="table"  style="line-height: 32px;" width="700" align="center" cellpadding="1" cellspacing="1">
		<tr>
<th>员工号</th><th>姓名</th><th>原部门</th><th>原岗位</th><th>调转类型</th><th>新部门</th><th>新岗位</th><th>调转原因</th><th>调转时间</th>
</tr>
<c:forEach items="${movementList}" var="movement">

<tr>
	<td align="center">${movement.employee_id}</td>
	<td align="center">${typeUtil.getEmployeeName(movement.employee_id)}</td>
	<td align="center">${movement.front_movement_department}</td>
	<td align="center">${movement.front_movement_job}</td>
	<td align="center">
		<c:if test="${movement.movement_department_type != 0}">${typeUtil.getItemName(movement.movement_department_type)}</c:if>
		<c:if test="${movement.movement_job_type != 0}">${typeUtil.getItemName(movement.movement_job_type)}</c:if>
	</td>
	<td align="center">${movement.movement_department}</td>
	<td align="center">${movement.movement_job}</td>
	<td align="center">${movement.movement_reason}</td>
	<td align="center">${movement.movement_time}</td>
</tr>
</c:forEach>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div style="text-align: center; height: 50px">
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