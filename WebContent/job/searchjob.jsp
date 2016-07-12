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
<title><%=ptname %>-岗位管理</title>
	<jsp:include page="../import.jsp" />
</head>
<body>
<jsp:include page="../head.jsp" />
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr >
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg" style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">对公司的岗位信息进行维护</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<fieldset >
		<legend style="font-family: '宋体';color:#007BBB "><a href="job/Job.jsp">·点击添加岗位信息</a></legend>
		<legend style="font-family: '宋体';color:#007BBB ">·查询岗位信息（以下必填一个）</legend>
		<form method="post" action="<%=path%>/JobServlet?flag=find">
		<table border="0" style="line-height: 32px; height: 124px" align="center" cellpadding="0" cellspacing="0">
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">岗位名称</td>
		<td style="padding-left: 10px;"><input type="text" style="width: 280px;"name="name"></td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">岗位类型</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<select name="type_id">
			<option value="0">全部</option>
   			<c:forEach items="${typeUtil.jobTypeGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</select>
		</td>
		</tr>
		<tr>
		<td>
		<div style="position:relative;left:160px;top:20px;">
		<input id="search" type="submit" value="查询" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		</div>
		
		</td>
		</tr>
		</table>
		</form>
		<br>
		<table class="table" width="1000px"; style="position:relative; top:20px;">
          <tr>
            <th style="text-align:center;width: 180px">岗位编号</th>
            <th style="text-align:center;width: 180px">岗位名称</th>
            <th style="text-align:center; width: 180px">岗位类型</th>
            <th style="text-align:center; width: 180px">岗位编制</th>
            <th style="text-align:center;">操作</th>
          </tr>
		
		<c:forEach items="${allJob}" var="job">
		<form method="post" action="<%=path%>/JobServlet?flag=upd">
		<tr>
		<c:if test="${param.uid != job.id}">
		<td align="center">${job.id}</td>
		<td align="center">${job.name}</td>
		<td align="center">${typeUtil.getItemName(job.type_id)}</td>
		<td align="center">${job.size}</td>
		<td style="text-align:center;">
			<a href="JobServlet?flag=find_emp&uid=${job.id}">查询该岗位员工信息</a>
			||
			<a href="JobServlet?flag=mod&uid=${job.id}">修改</a>
			||
			<a href="JobServlet?flag=del&uid=${job.id}" class="active" onclick="return confirm('确认删除？')">删除</a>
		</td>
	    
		</c:if>
		<c:if test="${param.uid == job.id}">
		<td align="center"><input type="text" name="id" value="${job.id}" readonly="readonly"></td>
		<td align="center"><input type="text" name="name" value="${job.name}"></td>
		<td align="center">
			<!--input type="text" value="${typeUtil.getItemName(job.type_id)}" readonly="readonly"-->
			<select name="type_id">
   				<c:forEach items="${typeUtil.jobTypeGroup}" var="item">
					<option value="${item.id}" <c:if test="${item.id == job.type_id}">selected="selected"</c:if>>${item.name}</option>
				</c:forEach>
			</select>
		</td>
		<td align="center"><input type="text" name="size" value="${job.size}"></td>
		<td style="text-align:center;">
			<a href="JobServlet?flag=all">取消</a>
			||
			<input type="submit" value="保存">
		</td>
	    </c:if>
	    </tr>
	    </form>
		</c:forEach>
		
      </table>
      <br/>
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
	

<center>
<jsp:include page="../foot.jsp"></jsp:include>
</center>

</body>
</html>



