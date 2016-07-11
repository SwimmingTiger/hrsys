<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();

    String ptname = "人事管理平台";

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!-- 头部Logo区 -->
<table border="0" cellpadding="0" cellspacing="0" width="966" align="center" height="70">
    <tr height="70">
        <td width="110">
            <a href="<%=path%>/"><img src="<%=path %>/images/dlnu1.png" border="0" height="45"/></a>
        </td>
        <td align="left" ><font face="幼圆" style="font-size:22px;"  color="#666666" ><strong><%=ptname %></strong></font></td>
        <td align="right" style="color:#999999;padding-right: 15px;">
            <a href="<%=path%>/login.jsp" class="newBtn" role="button"style="font-size:12px" >注销用户</a>&nbsp;&nbsp;
            <a href="<%=path%>/" class="newBtn" role="button" style="font-size:12px">返回主页</a>&nbsp;&nbsp;
        </td>
    </tr>
</table>