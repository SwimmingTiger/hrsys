<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>

<%
String path = request.getContextPath();

String ptname = "员工管理平台";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname %>-新聘员工报表</title>
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
 <script language="javascript" type="text/javascript" src="<%=path %>/My97DatePicker/WdatePicker.js"></script>
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
		background: url("<%=path%>/images/regimages/reg_finish_btn_.gif")  no-repeat;
		color: #4d2f00;
		line-height: 32px;
		font-size: 14px;
		font-weight: bold;
		font-family: 宋体;
	}
	
	
</style>
</head>
<body>
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center" height="70">
<tr height="70">
<td width="110">
<img src="<%=path %>
" border="0" height="45"/>
</td>
<td align="left" ><font face="幼圆" style="font-size:22px;"  color="#666666" ><strong><%=ptname %></strong></font></td>
<td align="right" style="color:#999999;padding-right: 15px;">
<a href="<%=path %>" class="" target="_blank">链接</a>&nbsp;&nbsp;
</td>
</tr>
</table>
<form method="post" name="" action="">
<input type="hidden" name="methods" id="methods">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请选择开始日期和结束日期查看新聘员工报表。</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体"><font color="red"></font></div>
		
		
		<fieldset>
		<legend  style="font-family: '宋体';color:#007bbb ">选择日期</legend>
		<div style="overflow: hidden;">
		<div>
		<table border="0" style="line-height: 50px;" align="center" cellpadding="0" cellspacing="0">
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>开始日期</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<input class="Wdate" type="text" onClick="WdatePicker()"></td>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>结束日期</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<input class="Wdate" type="text" onClick="WdatePicker()"></td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;"><input id="subbtn"  type="button" class="btn btn-default" value="查询" onclick="subcompanyreg()" style="position: relative;top: 0%" class="regbtn1" ></td>	
		</tr>
		</table>
		</div>
		</div>
		</fieldset>
		<br/>
		
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">新聘员工报表</legend>
		<div>
		<table border="1" style="line-height: 32px;" align="center"  width="800"  cellpadding="1" cellspacing="1">
		<tr>
<th>序号</th><th>部门名称</th><th>岗位名称</th><th>姓名</th><th>性别</th><th>入职日期</th><th>学历</th><th>操作</th>
</tr>
<c:forEach items="${alluser}" var="user">
<tr>
<td>${user.userid}</td>
<td>${user.uname}</td>
<td>${user.uage}</td>
<td>${user.uinfo}</td>
<td>${user.uname}</td>
<td>${user.uage}</td>
<td>${user.uinfo}</td>
<td align="center" ><a href="UserServlet.action?flag=upd1&uid=${user.userid}">修改</a>||<a href="UserServlet.action?flag=del&uid=${user.userid}" class="active">删除</a></td>
</tr>
</c:forEach>
		</table>
		</div>
		</fieldset>
		<br/>
		
		
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div>
		
		<div style="height: 80px;text-align: center;vertical-align: middle;">
		<input id="subbtn"  type="button" value="确定" onclick="subcompanyreg()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
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
<table>
<tr>
<td style="color:#0;font-size: 12px;" align="center">版权所有: 大连民族大学(c)2016</td>
</tr>
<tr>
<td style="color:#0;font-size: 12px;" align="center">网址：<a href="">aaa</a></td>
</tr>

</table>
</center>

</body>
</html>



