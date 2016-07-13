<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.type.entity.*" %>
<%@ page import="dlnu.hrsys.employee.entity.Employee" %>
<%@ page import="dlnu.hrsys.employee.impl.EmployeeDaoImpl" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();

String ptname = "人事管理平台";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("typeUtil", TypeUtil.getInstance());

	Employee emp = (new EmployeeDaoImpl()).findEmployeeById(Integer.valueOf(request.getParameter("employee_id")));
	request.setAttribute("emp", emp);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname %>-员工调转</title>
	<jsp:include page="../import.jsp" />
<style type="text/css">
	.emp_info {
		padding: 10px;
	}
	.emp_info_th {
		font-weight: bold;
	}
</style>
<script type="text/javascript">
	function mycheck(){
		//判断离职时间是否为空
		if(form.leave_time.value == ""){
			alert("离职时间不能为空！");
			form.leave_time.focus();
			return false;
		}
	}
</script>
</head>
<body>
<jsp:include page="../head.jsp" />
<form method="post" action="../MovementServlet.action?flag=add" name="form">
<input type="hidden" name="methods" id="methods">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">部门/岗位调转</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写</div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">部门/岗位调转信息</legend>
		<div>
		<table class="table" style="line-height: 32px;" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工号</td>
		<td style="padding-left: 10px;">
			<input type="text" style="width: 46px;" id="employee_id" name="employee_id" value="${param.employee_id}" readonly>
				<span class="emp_info emp_info_th">姓名</span><span class="emp_info">${emp.name}</span>
				<span class="emp_info emp_info_th">当前部门</span><span class="emp_info">${typeUtil.getDepartmentName(emp.department_id)}</span>
				<span class="emp_info emp_info_th">当前岗位</span><span class="emp_info">${typeUtil.getJobName(emp.job_id)}</span>
		</td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>
		</td>
		<tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>部门调转</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
			<SELECT name="department_id" id="department_id">
				<option value="0">不调转</option>
			<c:forEach items="${typeUtil.departments}" var="item">
			<option value="${item.id}">${item.name}</option>
			</c:forEach>
			</SELECT>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>部门调转类型</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
			<SELECT name="movement_department_type" id="movement_department_type">
				<option value="0">不调转</option>
				<c:forEach items="${typeUtil.departmentMovementGroup}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</SELECT>
		</div>
       </td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>岗位调转</td>
		<td style="padding-left: 10px;">
			<SELECT name="job_id" id="job_id">
				<option value="0">不调转</option>
				<c:forEach items="${typeUtil.jobs}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</SELECT>
		</td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>	
		</tr>
			<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>岗位调转类型</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
			<SELECT name="movement_job_type" id="movement_job_type">
				<option value="0">不调转</option>
				<c:forEach items="${typeUtil.jobMovementGroup}" var="item">
					<option value="${item.id}">${item.name}</option>
				</c:forEach>
			</SELECT>
		</div>
       </td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>调转原因</td>
		<td style="padding-left: 10px;"><input type="text" name="movement_reason"></td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>	
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>调转时间</td>
		<td style="padding-left: 10px;"><input type="text" class="Wdate" name="movement_time" onClick="WdatePicker()"></td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>	
		</tr>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend  style="font-family: '宋体';color:#D0410A "></legend>
		<div style="overflow: hidden;">
		
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div>
		
		<div style="height: 80px;text-align: center;vertical-align: middle;">
			<input id="subbtn"  type="submit" value="确定" onclick="return mycheck()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
			<input id="returnbtn"  type="button" value="返回" onclick="history.back()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</div>
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