<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String path = request.getContextPath();

	String ptname = "人事管理平台";

	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><%=ptname%>-员工离职</title>
<link rel='Shortcut Icon' href='<%=path%>/favicon.ico' />
<link rel='Bookmark' href='<%=path%>/favicon.ico' />
<link rel='stylesheet' type='text/css' href='<%=path%>/css/normal.css' />
<script type='text/javascript' src='<%=path%>/js/normalutil.js'></script>
<link rel='stylesheet' type='text/css' href='<%=path%>/css/login.css' />
<link type='text/css' rel='stylesheet'
	href='<%=path%>/css/formstyle.css' />
<script type='text/javascript' src='<%=path%>/js/formjs.js'></script>
<script type='text/javascript'>formStylePath.setImagePath('<%=path%>/images/');</script>
<script type='text/javascript' src='<%=path%>/js/syspanel.js'></script>
<script type='text/javascript'>panelStylePath.setImagePath('<%=path%>/images/grid_images/');
</script>
<script type='text/javascript' src='<%=path%>/js/pcasunzip.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/engine.js'></script>
<script type='text/javascript' src='<%=path%>/dwr/util.js'></script>
<script type='text/javascript'
	src='<%=path%>/dwr/interface/dwrCommonService.js'></script>
<script type="text/javascript"
	src="<%=path%>/dwr/interface/dwrSysProcessService.js"></script>
<script language="javascript" type="text/javascript"
	src="My97DatePicker/WdatePicker.js"></script>
	 <link href="css/bootstrap.css" rel="stylesheet">
<script src="js/bootstrap.js"></script>
<script src="js/jquery-1.10.2.js"></script>
<style type="text/css">
th,td {
	font-size: 13px;
}

.regbtn {
	width: 142px;
	height: 32px;
	border: 0px;
	margin: 0px;
	cursor: pointer;
	background: url("<%=path%>/images/regimages/reg_finish_btn.gif")
		no-repeat;
	color: #4d2f00;
	line-height: 32px;
	font-size: 14px;
	font-weight: bold;
	font-family: 宋体;
}

.regbtn_hover {
	width: 142px;
	height: 32px;
	border: 0px;
	margin: 0px;
	cursor: pointer;
	background: url("<%=path%>/images/regimages/reg_finish_btn_.gif")
		no-repeat;
	color: #4d2f00;
	line-height: 32px;
	font-size: 14px;
	font-weight: bold;
	font-family: 宋体;
}
</style>
</head>
<body style="background:url(../images/bg11.jpg)">
<jsp:include page="../head.jsp" />
	<form method="post" name="" action="">
		<input type="hidden" name="methods" id="methods">
		<table class="table" cellpadding="0" cellspacing="0" width="966"
			align="center">
			<tr height="57">
				<td width="9"
					background="<%=path%>/images/regimages/reg_title1.jpg"></td>
				<td width="944"
					background="<%=path%>/images/regimages/reg_title2.jpg"
					style="line-height: 57px;text-indent: 45px;">
					<div
						style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">请填写相关信息或者访问<a href="" target="_blank" class="regtit">链接</a>获取更多信息。</div>
				</td>
				<td width="13"
					background="<%=path%>/images/regimages/reg_title3.jpg"></td>
			</tr>
			<tr>
				<td width="9" background="<%=path%>/images/regimages/reg_left.jpg"></td>
				<td width="944">
					<div id="regtddiv">
						<div
							style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">
							<font color="red"></font>
						</div>
						<fieldset>
							<legend style="font-family: '宋体';color:#007BBB ">离职信息</legend>
							<div>
								<table border="0" style="line-height: 32px;" align="center"
									cellpadding="0" cellspacing="0">

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>记录编号</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.id}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>离职日期</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.leave_time}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>离职类型</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.leave_reason_id}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>离职去向</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.destination}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工编号</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.employee_id}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工姓名</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.name}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>性别</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.sex}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>生日</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.birth_date}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>身份证号</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.id_card}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>部门名称</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.department}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>岗位名称</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.job}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>入职日期</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.hire_date}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>参加工作日期</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.join_date}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>用工形式</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.hire_type}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>人员来源</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.hr_type}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>政治面貌</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.politics_status}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>民族</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.nationality}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>籍贯</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.native_place}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>电话</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.phone}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>电子邮件</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.email}"
											readonly="readonly">
										</td>
									</tr>

									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>身高（厘米）</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.height_cm}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>血型</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.blood_type}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>婚姻状况）</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.marital_status}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>出生地</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.birth_place}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>户口所在地</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.domicile_place}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>最高学历</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.education_status}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>最高学位</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.degree}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>毕业院校</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.graduate_school}"
											readonly="readonly">
										</td>
									</tr>


									<tr>
										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>所学专业</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.major_name}"
											readonly="readonly">
										</td>

										<td style="width: 150px;padding-right: 10px;" align="right"><em></em>毕业日期</td>
										<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
											<input type="text" name="uid" value="${leave.graduate_date}"
											readonly="readonly">
										</td>
									</tr>

								</table>
							</div>
						</fieldset>
						<br />

						<fieldset>
							<legend style="font-family: '宋体';color:#D0410A "></legend>
							<div style="overflow: hidden; text-align:center">
								<input id="subbtn"  type="button" value="返回" onclick="location='LeaveServlet.action?flag=findlike'" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
							</div>
						</fieldset>
						<br />

						<!--fieldset>
							<legend style="font-family: '宋体';color:#007BBB "></legend>
							<div></div>
						</fieldset-->
						<br />
					</div>
				</td>
				<td width="13"
					background="<%=path%>/images/regimages/reg_right.jpg"></td>
			</tr>
			<tr height="16">
				<td width="9"
					background="<%=path%>/images/regimages/reg_bottom1.jpg"></td>
				<td width="944"
					background="<%=path%>/images/regimages/reg_bottom2.jpg"></td>
				<td width="13"
					background="<%=path%>/images/regimages/reg_bottom3.jpg"></td>
			</tr>
		</table>
	</form>


	
<center>
<jsp:include page="../foot.jsp"></jsp:include>
</center>

</body>
</html>