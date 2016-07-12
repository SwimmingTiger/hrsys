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
<jsp:include page="../import.jsp" />
</head>
<body>
<jsp:include page="../head.jsp" />
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr height="57">
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg"  style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">对公司的部门信息进行维护</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB ">部门列表</legend>
		<div>
		<table border="0" style="line-height: 32px;" width="900" align="center" cellpadding="0" cellspacing="0">
		
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
		
<th>编号</th><th>部门名称</th><th>类型</th><th>电话</th><th>传真</th><th>描述</th><th>成立日期</th><th>操作</th>
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
	<a href="departmentsServlet.action?flag=allDepartments&edit_id=${department.id}&parent_id=${param.parent_id}">修改</a>
	||
	<a href="departmentsServlet.action?flag=del&uid=${department.id}&parent_id=${param.parent_id}" class="active" onclick="return confirm('确认删除？')">删除</a>
	||
	<a href="departmentsServlet.action?flag=allDepartments&parent_id=${department.id}">查看下级部门</a>
	||
	<a href="departmentsServlet.action?flag=find_emp&department_id=${department.id}">查看该部门员工</a>
</td>
</c:if>
<c:if test="${param.edit_id == department.id}">
<form method="post" id="edit_form" action="departmentsServlet.action?flag=upd&parent_id=${param.parent_id}">
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
	<a href="departmentsServlet.action?flag=allDepartments&parent_id=${param.parent_id}">取消</a>
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

<jsp:include page="../foot.jsp" />

</body>
</html>



