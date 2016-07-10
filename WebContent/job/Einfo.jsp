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
<script  type='text/javascript'   src='<%=path %>/dwr/engine.js'></script>
<script  type='text/javascript'   src='<%=path %>/dwr/util.js'></script>
<script  type='text/javascript'   src='<%=path %>/dwr/interface/dwrCommonService.js'></script>
<script type="text/javascript" src="<%=path %>/dwr/interface/dwrSysProcessService.js"></script>
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
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-1.10.2.js"></script>
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
		<legend style="font-family: '宋体';color:#007BBB ">岗位下员工信息</legend>
		<p style="font-size:16px;">当前岗位：${job.name}<a href="searchjob.jsp">（点击返回岗位管理页面）</a></p>
		
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
		<td style="text-align:center;"></td>
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