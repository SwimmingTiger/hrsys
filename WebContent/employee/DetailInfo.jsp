<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="dlnu.hrsys.util.TypeUtil" import="dlnu.hrsys.util.typeutil.entity.*" %>
<%
	String path = request.getContextPath();

	String ptname = "员工管理平台";

	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	request.setAttribute("typeUtil", TypeUtil.getInstance());
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title><%=ptname%>-员工详情</title>
	<jsp:include page="../import.jsp" />
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
<body>
<jsp:include page="../head.jsp" />
<form method="post" name="" action="">
	<input type="hidden" name="methods" id="methods">
	<table border="0" cellpadding="0" cellspacing="0" width="966"
		   align="center">
		<tr height="57">
			<td width="9"
				background="<%=path%>/images/regimages/reg_title1.jpg"></td>
			<td width="944"
				background="<%=path%>/images/regimages/reg_title2.jpg"
				style="line-height: 57px;text-indent: 45px;">
				<div
						style="font-size: 16px;font-family: Microsoft YaHei, 宋体, Segoe UI, verdana, arial;color: #fefefe">离职员工详细信息。</div>
			</td>
			<td width="13"
				background="<%=path%>/images/regimages/reg_title3.jpg"></td>
		</tr>
		<tr>
			<td width="9" background="<%=path%>/images/regimages/reg_left.jpg"></td>
			<td width="944">
				<div id="regtddiv">
					<div style="margin: 5px;text-align: right;color: #666666;font-family: 宋体">
						<font color="red"></font>
					</div>
					<fieldset>
						<legend style="font-family: '宋体';color:#007BBB ">员工信息</legend>
						<div>
							<table border="0" style="line-height: 32px;" align="center"
								   cellpadding="0" cellspacing="0">

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工编号</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.id}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>员工姓名</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.name}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>性别</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.sex_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>生日</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.birth_date}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>身份证号</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.id_card}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>部门名称</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getDepartmentName(employee.department_id)}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>岗位名称</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getJobName(employee.job_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>入职日期</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.hire_date}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>参加工作日期</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.join_date}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>用工形式</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.hire_type_id)}"
											   readonly="readonly">
									</td>
								</tr>


								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>人员来源</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.hr_type_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>政治面貌</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.politics_status_id)}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>民族</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.nationality_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>籍贯</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.native_place}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>电话</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.phone}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>电子邮件</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.email}"
											   readonly="readonly">
									</td>
								</tr>

								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>身高（厘米）</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.height_cm}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>血型</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.blood_type_id)}"
											   readonly="readonly">
									</td>
								</tr>


								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>婚姻状况）</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.marital_status_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>出生地</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.birth_place}"
											   readonly="readonly">
									</td>
								</tr>


								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>户口所在地</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.domicile_place}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>最高学历</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.education_status_id)}"
											   readonly="readonly">
									</td>
								</tr>


								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>最高学位</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${typeUtil.getItemName(employee.degree_id)}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>毕业院校</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.graduate_school}"
											   readonly="readonly">
									</td>
								</tr>


								<tr>
									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>所学专业</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.major_name}"
											   readonly="readonly">
									</td>

									<td style="width: 150px;padding-right: 10px;" align="right"><em></em>毕业日期</td>
									<td nowrap="nowrap" colspan="2" style="padding-left: 10px;">
										<input type="text" name="uid" value="${employee.graduate_date}"
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
							<input id="subbtn"  type="button" value="返回" onclick="history.back()" style="position: relative;top: 30%" class="regbtn" onmouseover="this.className='regbtn_hover'" onmouseout="this.className='regbtn'">
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


<jsp:include page="../foot.jsp"></jsp:include>

</body>
</html>