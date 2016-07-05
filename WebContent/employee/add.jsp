<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.type.entity.*" %>
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
<title><%=ptname %>-员工入职</title>
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
 <script language="javascript" type="text/javascript" src="js/My97DatePicker/WdatePicker.js"></script>
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
<img src="<%=path %>/images/dlnu1.png" border="0" height="45"/>
</td>

<td align="left" ><font face="幼圆" style="font-size:22px;"  color="#666666" ><strong><%=ptname %></strong></font>
</td>

<td align="right" style="color:#999999;padding-right: 15px;">
<a href="<%=path %>" class="" target="_blank">链接</a>&nbsp;&nbsp;
</td>

</tr>
</table>

<form method="post" name="" action="<%=path%>/EmployeeServlet?flag=add">
<input type="hidden" name="methods" id="methods">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">

<tr height="57">

<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg">
</td>

<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">

<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请填写相关申请信息或者访问<a href="" target="_blank" class="regtit">链接</a>获取更多信息。
</div>

</td>

<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg">
</td>

</tr>

<tr>

<td width="9" background="<%=path %>/images/regimages/reg_left.jpg">
</td>

<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写
		</div>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">入职信息(*号位必填项)</legend>
		
		<div>
		<table border="0" style="line-height: 32px;"width="860px"align="center" cellpadding="0" cellspacing="0">
		
		
		<tr>
		
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>员工号
		</td>
		
		<td align="left">
		<input type="text" style="width: 150px;height: 17px;" id="id" name="id" value="">
		</td>
		
		<td style="width: 150px;padding-right: 12px;"align="right"><em>*</em>姓名
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="name" name="name" value="">
		</td>
		
		</tr>
		
		
		<tr>
		
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>性别
		</td>	
		
		<td nowrap="nowrap"  style="padding-left: 0px;width: 20px;" class="al">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="sex_id" name="sex_id">
			<c:forEach items="${typeUtil.sexGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT>
		</div>
       </td>
       
       <td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>出生日期
       </td>
       
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 150px;height: 17px;" id="birth_date" name="birth_date">
		</td>
		
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>身份证号
		</td>
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="id_card" name="id_card" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>部门
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="department_id" name="department_id" value="">
		</td>
		
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>岗位
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="job_id" name="job_id" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>入职日期
		</td>
		
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 150px;height: 17px;" id="hire_date" name="hire_date">
		</td>
		
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>参加工作日期
		</td>
		
		<td nowrap="nowrap" style="padding-left: 0px;">
		<input class="Wdate" type="text" onClick="WdatePicker()" style="width: 150px;height: 17px;" id="join_date" name="join_date">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>用工形式
		</td>
		
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="hire_type_id" name="hire_type_id">
			<c:forEach items="${typeUtil.hireTypeGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>人员来源
		</td>
		
		<td nowrap="nowrap" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="hr_type_id" name="hr_type_id">
			<c:forEach items="${typeUtil.hrTypeGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
       <td style="width: 150px;padding-right: 10px;" align="right">政治面貌
       </td>
       
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="politics_status_id" name="politics_status_id">
			<c:forEach items="${typeUtil.politicsStatusGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">民族
		</td>
		
		<td nowrap="nowrap" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="nationality_id" name="nationality_id">
			<c:forEach items="${typeUtil.nationalityGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
       <td style="width: 150px;padding-right: 10px;" align="right">籍贯</td>
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="native_place" name="native_place" value="">
		</td>
		
		</tr>
		
		
		<tr>
		
		<td style="width: 150px;padding-right: 10px;" align="right">联系电话
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="phone" name="phone" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right">电子邮件
		</td>
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="email" name="email" value="">
		</td>	
			
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">身高
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="height_cm" name="height_cm" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right">血型
		</td>
		
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="blood_type_id" name="blood_type_id">
			<c:forEach items="${typeUtil.bloodTypeGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">婚姻状况
		</td>
		
		<td nowrap="nowrap" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="marital_status_id" name="marital_status_id">
			<c:forEach items="${typeUtil.maritalStatusGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
       <td style="width: 150px;padding-right: 10px;" align="right">出生地
       </td>
       
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="birth_place" name="birth_place" value="">
		</td>
		
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">户口所在地
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="domicile_place" name="domicile_place" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right">最高学历
		</td>
		
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="education_status_id" name="education_status_id">
			<c:forEach items="${typeUtil.educationStatusGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
       
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">最高学位
		</td>
		
		<td nowrap="nowrap" style="padding-left: 0px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT id="degree_id" name="degree_id">
			<c:forEach items="${typeUtil.degreeGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT>
		
		</div>
       </td>
       
       <td style="width: 150px;padding-right: 10px;" align="right">毕业院校
       </td>
       
		<td>
		<input type="text" style="width: 150px;height: 17px;" id="graduate_school" name="graduate_school" value="">
		</td>
		
		</tr>
		
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">所学专业
		</td>
		
		<td>
		<input type="text" style="width: 150px;height: 17px;" name="major_name" id="major_name" value="">
		</td>
		
		<td style="width: 150px;padding-right: 10px;" align="right">毕业日期
		</td>
		
		<td nowrap="nowrap" colspan="2" style="padding-left: 0px;">
		<input class="Wdate" type="text" onClick="WdatePicker()"style="width: 150px;height: 17px;" id="graduate_date" name="graduate_date">
		</td>
		
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



