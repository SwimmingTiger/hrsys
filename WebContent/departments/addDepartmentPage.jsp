<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
<form method="post" name="" action="../servlet/departmentsServlet.action?flag=add">
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
		<table border="0" style="line-height: 32px;" align="center" cellpadding="0" cellspacing="0">	
	<!-- 	<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>编号</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;"
		><input type="text" style="width: 155px;" id="" name="" value="""></td>
		</tr> -->
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>名称</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;"
		><input type="text" style="width: 155px;" id="" name="name" value="""></td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>类型</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<div class="selectdiv"  style="float: left;margin-right: 5px;">
		<SELECT name="typeId" id="">
				 <!--option value=""></option>
				 <option value="37" selected>公司</option>
				 <option value="38">部门</option-->
			<c:forEach items="${typeUtil.departmentGroup}" var="item">
				<option value="${item.id}">${item.name}</option>
			</c:forEach>
		</SELECT></div>
       </td>
		</tr>
		
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>电话</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<input type="text" style="width: 155px;" id="" name="phone" value="""></td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">传真</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;"
		><input type="text" style="width: 155px;" id="" name="fax" value=""">
		</td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>描述</td>
		<td style="padding-left: 10px;"><input type="text" style="width: 465px;" id="" name="des" value=""></td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>	
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right">上级部门</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		<input type="text" style="width: 155px;" name="parentId" value="">
		</td>
		</tr>
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em>*</em>成立日期</td>
		<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
		 <input name="date" class="Wdate" type="text" onClick="WdatePicker()"></td>
		
		</tr>
		<tr>
		<td colspan="2">
		<table border="0" style="width: 100%" cellpadding="0" cellspacing="0">
		</table>
		
	
		<tr>
		<td style="width: 150px;padding-right: 10px;" align="right"><em></em>备注</td>
		<td style="padding-left: 10px;"><input type="text" style="width: 465px;" id="" name="" value=""></td>
		<td style="padding-left: 10px; color: #808080;font-size: 12px;"><label style="padding-left: 5px;color: red"  id=""></label> </td>	
		</tr>
		</table>
		</div>
		</fieldset>
		<br/>
		
		<fieldset>
		<legend style="font-family: '宋体';color:#007BBB "></legend>
		<div>
		
		<div style="height: 80px;text-align: center;vertical-align: middle;">
		<input id="subbtn"  type="submit" value="确定" onclick="" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
		<a href="../servlet/departmentsServlet.action?flag=allDepartments"><input id="subbtn"  type="button" value="返回"  style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'"></a>
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

<jsp:include page="../foot.jsp" />

</body>
</html>



