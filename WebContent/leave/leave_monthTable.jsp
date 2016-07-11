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
<title><%=ptname %>-离职员工报表</title>
	<jsp:include page="../import.jsp" />
</head>
<body>
<jsp:include page="../head.jsp" />
<form method="post" name="" action="">
<input type="hidden" name="methods" id="methods">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请选择开始日期和结束日期查看离职员工报表。</div>
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
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;"><input id="subbtn"  type="button" class="btn btn-default" value="查询" onclick="subcompanyreg()" style="position: relative;top: 0%"  ></td>	
		</tr>
		</table>
		</div>
		</div>
		</fieldset>
		<br/>
		
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">离职员工报表</legend>
		<div>
		<table  class="table table-hover" border="1" style="line-height: 32px;" align="center"  width="800"  cellpadding="1" cellspacing="1">
		<tr>
<th>序号</th><th>部门名称</th><th>岗位名称</th><th>姓名</th><th>性别</th><th>离职日期</th><th>离职原因</th><th>操作</th>
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
<td align="center" ><a href="UserServlet.action?flag=upd1&uid=${user.userid}"><input id="button"  type="button" class="btn btn-default" value="修改"  style="position: relative;top: 0%"  ></a>||<a href="UserServlet.action?flag=del&uid=${user.userid}" class="active">删除</a></td>
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
<jsp:include page="../foot.jsp"></jsp:include>
</center>
</body>
</html>



