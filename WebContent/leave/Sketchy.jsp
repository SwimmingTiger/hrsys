<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.type.entity.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title><%=ptname %>-员工离职</title>
	<jsp:include page="../import.jsp" />
<style type="text/css">
	.infor_th
	{
	text-align:center;
	}
</style>
</head>
<body>
<jsp:include page="../head.jsp" />
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请填写相关信息或者访问<a href="" target="_blank" class="regtit">链接</a>获取更多信息。</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体"><font color="red"></font></div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">离职人员信息</legend>
		<div>
		<form method="post" action="LeaveServlet.action?flag=findlike">
		<div style="text-align: center">
			<p>
				<input type="text" placeholder="姓名或员工号" name="employee" value="${param.employee}">
				<select name="department" style="width:120px">
					<option value="">所有部门</option>
   					<c:forEach items="${typeUtil.leaveDepartmentGroup}" var="item">
						<option value="${item.name}" <c:if test="${item.name == param.department}">selected="selected"</c:if>>${item.name}</option>
					</c:forEach>
				</select>
				<select name="job" style="width:120px">
					<option value="">所有岗位</option>
   					<c:forEach items="${typeUtil.leaveJobGroup}" var="item">
						<option value="${item.name}" <c:if test="${item.name == param.job}">selected="selected"</c:if>>${item.name}</option>
					</c:forEach>
				</select>
				<select name="leave_reason_id" style="width:120px">
					<option value="0">所有离职类型</option>
   					<c:forEach items="${typeUtil.leaveReasonGroup}" var="item">
						<option value="${item.id}" <c:if test="${item.id == param.leave_reason_id}">selected="selected"</c:if>>${item.name}</option>
					</c:forEach>
				</select>
				<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 100px;height: 17px;" name="leave_time1" placeholder="开始时间">
				<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 100px;height: 17px;" name="leave_time2" placeholder="结束时间">
			</p>
			<p>
				<input id="subbtn"  type="submit" value="查询" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
			</p>
		</div>
		<!--table  align="center">
		<tr>
		<td style="padding-left: 10px;"><input type="text" style="width: 465px; height:30px" name=""></td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>
		<td><input id="subbtn"  type="submit" value="查询" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</td></tr></table-->
		</form>
		<br>
		<table  class="table"   style="line-height: 32px;" width="800" align="center" cellpadding="1" cellspacing="1">
		<tr>
<th class="infor_th">员工编号</th><th class="infor_th"  style=width:70px;>姓名</th><th class="infor_th">部门名称</th><th class="infor_th">岗位名称</th><th class="infor_th">离职类型</th><th class="infor_th">离职时间</th><th class="infor_th">离职去向</th><th width="120px" class="infor_th">操作</th>
</tr>
<c:forEach items="${sketchy}" var="leave">
<tr>
<c:if test="${param.edit_id != leave.id}">
<td align="center">${leave.employee_id}</td>
<td align="center">${leave.name}</td>
<td align="center">${leave.department}</td>
<td align="center">${leave.job}</td>
<td align="center">${typeUtil.getItemName(leave.leave_reason_id)}</td>
<td align="center">${leave.leave_time}</td>
<td align="center">${leave.destination}</td>
<td align="center">
	<a href="LeaveServlet.action?flag=sketchy&edit_id=${leave.id}">修改</a>
	||
	<a href="LeaveServlet.action?flag=detail&record_id=${leave.id}" class="active">查看详细信息</a>
</td>
</c:if>
<c:if test="${param.edit_id == leave.id}">
<form method="post" action="LeaveServlet.action?flag=upd">
<input type="hidden" name="id" value="${leave.id}">
<td align="center">${leave.employee_id}</td>
<td align="center">${leave.name}</td>
<td align="center">${leave.department}</td>
<td align="center">${leave.job}</td>
<td align="center">
	<select name="leave_reason_id" style="width:120px">
   		<c:forEach items="${typeUtil.leaveReasonGroup}" var="item">
			<option value="${item.id}" <c:if test="${item.id == leave.leave_reason_id}">selected="selected"</c:if>>${item.name}</option>
		</c:forEach>
	</select>
</td>
<td align="center"><input name="leave_time" type="text" value="${leave.leave_time}" style="width:80px"></td>
<td align="center"><input name="destination" type="text" value="${leave.destination}"></td>
<td align="center"><input type="submit" value="保存"> || <a href="LeaveServlet.action?flag=sketchy">取消</a></td>
</form>
</c:if>
</tr>
</c:forEach>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<!--fieldset>
		<legend  style="font-family: '宋体';color:#D0410A "></legend>
		<div style="overflow: hidden;">
		
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div>
		
		<div style="height: 80px;text-align: center;vertical-align: middle;">
		<input id="subbtn"  type="submit" value="确定" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</div>
		</div>
		</fieldset-->
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


<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>