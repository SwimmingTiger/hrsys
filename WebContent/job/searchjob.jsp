<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title><%=ptname %>-岗位管理</title>
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
</style>
<link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-1.10.2.js"></script>
</head>
<body style="background:url(../images/bg11.jpg)">
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center" >
<tr>
<td width="110">
<img src="../images/dlnu1.png" border="0" height="45"/>
</td>
<td align="left" ><font face="幼圆" style="font-size:22px;"  color="#666666" ><strong><%=ptname %></strong></font></td>
<td align="right" style="color:#999999;padding-right: 15px;">
	<a href="<%=path %>/index.jsp" class="">返回主页</a>&nbsp;&nbsp;
</td>
</tr>
</table>
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center">
<tr >
<td width="9" background="<%=path %>/images/regimages/reg_title1.jpg"></td>
<td width="944" background="<%=path %>/images/regimages/reg_title2.jpg" style="line-height: 57px;text-indent: 45px;">
<div style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请填写相关申请信息或者访问<a href="" target="_blank" class="regtit">链接</a>获取更多信息。</div>
</td>
<td width="13" background="<%=path %>/images/regimages/reg_title3.jpg"></td>
</tr>
<tr>
<td width="9" background="<%=path %>/images/regimages/reg_left.jpg"></td>
<td width="944">
		<div id="regtddiv">
		<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">注意：带有&nbsp;<font color="red">*</font>&nbsp;号的必须填写</div>
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
<table>
<tr>
<td style="color:#0;font-size: 12px;" align="center">版权所有: 大连民族大学(c)2016</td>
</tr>
<tr>
<td style="color:#0;font-size: 12px;" align="center">网址：<a href="">http://www.dlnu.edu.cn</a></td>
</tr>

</table>
</center>

</body>
</html>



