<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();

    String ptname = "人事管理平台";

    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<style>
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