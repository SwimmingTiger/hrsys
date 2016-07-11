<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.typeutil.entity.*" %>
<%
String path = request.getContextPath();

String ptname = "员工管理平台";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("typeUtil", TypeUtil.getInstance());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname %>-员工列表</title>
	<jsp:include page="../import.jsp" />
</head>
<body>
<jsp:include page="../head.jsp" />
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">对正式员工的信息进行维护</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体"><font color="red"></font></div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">正式员工信息</legend>
			<form method="post" action="EmployeeServlet?flag=search_all">
				<div style="text-align: center">
					<p>
						<input type="text" placeholder="姓名或员工号" name="employee" value="${param.employee}">
						<select name="department_id" style="width:120px">
							<option value="">所有部门</option>
							<c:forEach items="${typeUtil.departments}" var="item">
								<option value="${item.id}" <c:if test="${item.id == param.department_id}">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
						</select>
						<select name="job_id" style="width:120px">
							<option value="">所有岗位</option>
							<c:forEach items="${typeUtil.jobs}" var="item">
								<option value="${item.id}" <c:if test="${item.id == param.job_id}">selected="selected"</c:if>>${item.name}</option>
							</c:forEach>
						</select>
						<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 100px;height: 17px;" name="join_date1" placeholder="入职日期起始" value="${param.join_date1}">
						<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 100px;height: 17px;" name="join_date2" placeholder="入职日期结束" value="${param.join_date2}">

						<input id="subbtn"  type="submit" value="查询" onclick="subcompanyreg()" style="position: relative;top: 30%;transform:scale(0.8);" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
					</p>
				</div>
				<!--table  align="center">
                <tr>
                <td style="padding-left: 10px;"><input type="text" style="width: 465px; height:30px" name=""></td>
                <td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>
                <td><input id="subbtn"  type="submit" value="查询" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
                </td></tr></table-->
			</form>
		<div>
		<table border="1" style="line-height: 32px;" width="700" align="center" cellpadding="1" cellspacing="1">
		<tr>
<th>员工编号</th><th>姓名</th><th>部门</th><th>岗位</th><th>操作</th>
</tr>
<c:forEach items="${emp_list}" var="emp">
<tr>
<td>${emp.id}</td>
<td>${emp.name}</td>
	<td align="center">${typeUtil.getDepartmentName(emp.department_id)}</td>
	<td align="center">${typeUtil.getJobName(emp.job_id)}</td>
		<td align="center">
			<a href="leave/LeaveAdd.jsp?employee_id=${emp.id}">离职</a>
		</td>
</tr>
</c:forEach>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div style="text-align: center; height: 50px">
			<input id="returnbtn"  type="button" value="返回" onclick="location='employee/entry.jsp'" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
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