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
<title><%=ptname %>-员工离职</title>
<link rel='Shortcut Icon' href='<%=path %>/favicon.ico' />
<link rel='Bookmark' href='<%=path %>/favicon.ico' />
<link rel='stylesheet' type='text/css' href='<%=path %>/css/normal.css' />
<script  type='text/javascript'   src='<%=path %>/js/normalutil.js'></script>
<link rel='stylesheet' type='text/css' href='<%=path %>/css/login.css' />
<link type='text/css' rel='stylesheet' href='<%=path %>/css/formstyle.css' />
<script  type='text/javascript'   src='<%=path %>/js/formjs.js'></script>
<script type='text/javascript'>formStylePath.setImagePath('<%=path %>/images/');</script>
<script  type='text/javascript'   src='<%=path %>/js/syspanel.js'></script>
<script type='text/javascript'>panelStylePath.setImagePath('<%=path%>/images/grid_images/');</script>
<script  type='text/javascript'   src='<%=path %>/js/pcasunzip.js'></script>
 <script language="javascript" type="text/javascript" src="<%=path %>/js/My97DatePicker/WdatePicker.js"></script>
  <link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<style type="text/css">
	th,td{
		font-size: 13px;
	}
	.regbtn{
		width:142px;
		height:32px;
		border:0px;
		margin:0px;
		cursor:pointer;
		background: url("<%=path%>/images/regimages/reg_finish_btn.gif") no-repeat;
		color: #4d2f00;
		line-height: 32px;
		font-size: 14px;
		font-weight: bold;
		font-family: 宋体;
	}
	.regbtn_hover{
		width:142px;
		height:32px;
		border:0px;
		margin:0px;
		cursor:pointer;
		background: url("<%=path%>/images/regimages/reg_finish_btn_.gif") no-repeat;
		color: #4d2f00;
		line-height: 32px;
		font-size: 14px;
		font-weight: bold;
		font-family: 宋体;
	}
	.emp_info {
		padding: 10px;
	}
	.emp_info_th {
		font-weight: bold;
	}
	.newBtn {
	color: #fff;
	background-color: #286090;
	width: 84px;
	height: 31px;
	font: 13px "宋体";
	border: 0;
	margin: 5px 0;
	text-align: center;
	vertical-align: middle;
	line-height: 30px;
	border-radius: 6px;
	display: inline-block;
	text-decoration: none;
	-webkit-box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
	box-shadow: inset 0 3px 5px rgba(0, 0, 0, .125);
}

.newBtn:hover {
	background: url(<%=path%>/images/login_btn_.png) no-repeat;
	width: 84px;
	height: 31px;
	line-height: 31px;
	font: 13px "宋体";
	color: #1656CD;
	border: 0;
	margin: 5px 0;
	cursor: pointer;
	border: 0;
	margin: 5px 0;
	cursor: pointer;
	text-decoration: none;
	text-align: center;
	vertical-align: middle;
	line-height: 30px;
}
</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center" height="70">
<tr height="70">
<td width="110">
<img src="<%=path %>/images/dlnu1.png" border="0" height="45"/>
</td>
<td align="left" ><font face="幼圆" style="font-size:22px;"  color="#666666" ><strong><%=ptname %></strong></font></td>
<td align="right" style="color:#999999;padding-right: 15px;">
	<a href="index.jsp" class="newBtn" role="button"style="font-size:12px" >注销用户</a>&nbsp;&nbsp;
	
<a href="index.jsp" class="newBtn" role="button" style="font-size:12px">返回主页</a>&nbsp;&nbsp;
</td>
</tr>
</table>
<form method="post" action="../LeaveServlet.action?flag=add">
<input type="hidden" name="methods" id="methods">
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
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写</div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">离职信息(*号位必填项)</legend>
		<div>
		<table class="table" style="line-height: 32px;" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工号</td>
		<td style="padding-left: 10px;">
			<input type="text" style="width: 46px;" id="employee_id" name="id" value="${param.employee_id}" readonly>
				<span class="emp_info emp_info_th">姓名</span><span class="emp_info">${emp.name}</span>
				<span class="emp_info emp_info_th">部门</span><span class="emp_info">${typeUtil.getItemName(emp.department_id)}</span>
				<span class="emp_info emp_info_th">岗位</span><span class="emp_info">${typeUtil.getItemName(emp.job_id)}</span>
		</td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>
		</td>
		<tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>离职日期</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<input class="Wdate" type="text" name="leave_time" onClick="WdatePicker()"></td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>离职类型</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT name="leave_reason_id" id="leave_reason_id">
			<c:forEach items="${typeUtil.leaveReasonGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>离职去向</td>
		<td style="padding-left: 10px;"><input type="text" style="width: 465px;" name="destination"></td>
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
			<input id="subbtn"  type="submit" value="确定" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
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



