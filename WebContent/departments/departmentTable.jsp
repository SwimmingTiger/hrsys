<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.type.entity.*" %>

<%
String path = request.getContextPath();

String ptname = "部门管理平台";

String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

request.setAttribute("typeUtil", TypeUtil.getInstance());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname %>-编号</title>
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
 <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
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
<input type="hidden" name="methods" id="methods">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请填写相关申请信息或者访问<a href="" target="_blank" class="regtit">链接</a>获取更多信息。</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写</div>
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">类型</legend>
		<div>
		<table border="0" style="line-height: 20px;" align="center"width="1000px" cellpadding="1" cellspacing="1">
		
	<div style="height: 40px; vertical-align: middle;">
	<form method="post" id="search_form"  action="departmentsServlet.action?flag=seek">
		
		名称:<input type="text" style="width: 100px;" id="" name="name" value="${param.name}">
		
		类型:<SELECT name="type" id="">
				 <option value="0">全部</option>
				 <!--option value="1" selected>编号</option>
				 <option value="2">部门名称</option>
				 <option value="3">类型</option-->
			<c:forEach items="${typeUtil.departmentGroup}" var="item">
				<option value="${item.id}" <c:if test="${item.id == param.type}">selected="selected"</c:if>>${item.name}</option>
			</c:forEach>
				
		</SELECT>
		<input id="inquiry"  type="submit" value="查询" onclick="subcompanyreg()" style="position: relative;top: 3%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		<input id="add"  type="button" value="增加" onclick="location='<%=path%>/departments/addDepartmentPage.jsp'" style="position: relative;top: 3%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</form>
		</div>
       </td>
		</tr>
		
<th>编号</th><th>部门名称</th><th>类型</th><th>电话</th><th>传真</th><th>描述</th><th>入职日期</th><th>操作</th>
</tr>

<c:forEach items="${alldepartments}" var="department">
<tr>
<c:if test="${param.edit_id != department.id}">
<input type="hidden" name="id" value="${department.id}">
<td align="center">${department.id}</td>
<td align="center">${department.name}</td>
<td align="center">${typeUtil.getItemName(department.typeId)}</td>
<td align="center">${department.phone}</td>
<td align="center">${department.fax}</td>
<td align="center">${department.desc}</td>
<td align="center">${department.foundDate}</td>
<td align="center">
	<a href="departmentsServlet.action?flag=allDepartments&edit_id=${department.id}">修改</a>
	||
	<a href="departmentsServlet.action?flag=del&uid=${department.id}" class="active">删除</a>
</td>
</c:if>
<c:if test="${param.edit_id == department.id}">
<form method="post" id="edit_form" action="departmentsServlet.action?flag=upd">
<input type="hidden" name="id" value="${department.id}">
<td align="center">${department.id}</td>
<td align="center"><input type="text" name="name" style="width: 100px;" value="${department.name}"></td>
<td align="center">
	<select name="typeId">
   		<c:forEach items="${typeUtil.departmentGroup}" var="item">
			<option value="${item.id}" <c:if test="${item.id == department.typeId}">selected="selected"</c:if>>${item.name}</option>
		</c:forEach>
	</select>
</td>
<td align="center"><input type="text" name="phone" style="width: 100px;" value="${department.phone}"></td>
<td align="center"><input type="text" name="fax" style="width: 100px;" value="${department.fax}"></td>
<td align="center"><input type="text" name="desc" style="width: 100px;" value="${department.desc}"></td>
<td align="center"><input type="text" name="foundDate" style="width: 100px;" value="${department.foundDate}"></td>
<td align="center">
	<input type="submit" value="保存">
	||
	<a href="departmentsServlet.action?flag=allDepartments">取消</a>
</td>
</form>
</c:if>
</tr>
</c:forEach>

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



