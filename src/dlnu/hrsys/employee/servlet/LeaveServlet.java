/** 
* <p>application name： sample1</p> 
* <p>application describing： this class handels the request of the client</p> 
* <p>copyright： Copyright ® 2016 大连民族大学版权所有</p> 
* <p>company： dlnu</p> 
* <p>time： 2016.06.27</p> 
* 
* @author 莫绍聪 
* @version ver 3.1 
*/

package dlnu.hrsys.employee.servlet;

import java.io.IOException;
import java.sql.*;
import java.util.List;
import java.util.Random;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dlnu.hrsys.employee.leave.Leave;
import dlnu.hrsys.employee.leaveDao.LeaveDao;
import dlnu.hrsys.employee.leaveDaoFactory.LeaveDaoFactory;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.TypeUtil;
import dlnu.hrsys.util.DBUtil.DBException;

@SuppressWarnings("serial")
@WebServlet(name="LeaveServlet", urlPatterns="/LeaveServlet.action")
public class LeaveServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		LeaveDao ld;
		
		try {
			ld = LeaveDaoFactory.getLeaveDao();

			String flag = request.getParameter("flag");

			Connection conn = DBUtil.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;

			// 添加离职员工信息
			if ("add".equals(flag)) {
				try {
					Random rd = new Random();
					int id = rd.hashCode();
					int id2 = Integer.valueOf(request.getParameter("id"));
					Date leave_time = Date.valueOf(request.getParameter("leave_time"));
					int leave_reason_id = Integer.valueOf(request.getParameter("leave_reason_id"));
					String destination = request.getParameter("destination");
					int employee_id = 0;
					String name = null;
					String sex = null;
					Date birth_date = null;
					String id_card = null;
					String department = null;
					String job = null;
					Date hire_date = null;
					Date join_date = null;
					String hire_type = null;
					String hr_type = null;
					String politics_status = null;
					String nationality = null;
					String native_place = null;
					String phone = null;
					String email = null;
					int height_cm = 0;
					String blood_type = null;
					String marital_status = null;
					String birth_place = null;
					String domicile_place = null;
					String education_status = null;
					String degree = null;
					String graduate_school = null;
					String major_name = null;
					Date graduate_date = null;

					try {
						pstmt = conn.prepareStatement("select * from employee where id = ?");
						pstmt.setInt(1, id2);
						rs = pstmt.executeQuery();

						while (rs.next()) {
							employee_id = rs.getInt("id");
							name = rs.getString("name");
							sex = TypeUtil.getItemName(rs.getInt("sex_id"));
							birth_date = rs.getDate("birth_date");
							id_card = rs.getString("id_card");
							department = TypeUtil.getItemName(rs.getInt("department_id"));
							job = TypeUtil.getItemName(rs.getInt("job_id"));
							hire_date = rs.getDate("hire_date");
							join_date = rs.getDate("join_date");
							hire_type = TypeUtil.getItemName(rs.getInt("hire_type_id"));
							hr_type = TypeUtil.getItemName(rs.getInt("hr_type_id"));
							politics_status = TypeUtil.getItemName(rs.getInt("politics_status_id"));
							nationality = TypeUtil.getItemName(rs.getInt("nationality_id"));
							native_place = rs.getString("native_place");
							phone = rs.getString("phone");
							email = rs.getString("email");
							height_cm = rs.getInt("height_cm");
							blood_type = TypeUtil.getItemName(rs.getInt("blood_type_id"));
							marital_status = TypeUtil.getItemName(rs.getInt("marital_status_id"));
							birth_place = rs.getString("birth_place");
							domicile_place = rs.getString("domicile_place");
							education_status = TypeUtil.getItemName(rs.getInt("education_status_id"));
							degree = TypeUtil.getItemName(rs.getInt("degree_id"));
							graduate_school = rs.getString("graduate_school");
							major_name = rs.getString("major_name");
							graduate_date = rs.getDate("graduate_date");
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}

					Leave l = new Leave(id, leave_time, leave_reason_id,
							destination, employee_id, name, sex, birth_date,
							id_card, department, job, hire_date, join_date,
							hire_type, hr_type, politics_status, nationality,
							native_place, phone, email, height_cm, blood_type,
							marital_status, birth_place, domicile_place,
							education_status, degree, graduate_school, major_name,
							graduate_date);
					boolean bool = ld.addLeave(l);
					if (bool) {
						request.setAttribute("Employee_leave_record", l);

						List<Leave> al = ld.findSketchy();
						request.setAttribute("sketchy", al);
						request.getRequestDispatcher("/leave/Sketchy.jsp").forward(request, response);
					} else {
						response.sendRedirect("./leave/LeaveAdd.jsp?employee_id=" + l.getEmployee_id());
					}
				} catch (IllegalArgumentException e) {
					response.getWriter().println("<script>alert('数字或日期格式不正确！');history.back();</script>");
				}
			}
			
			//修改
			if ("upd".equals(flag)) {
				int id = Integer.valueOf(request.getParameter("id"));
				Date leave_time = Date.valueOf(request.getParameter("leave_time"));
				int leave_reason_id = Integer.valueOf(request.getParameter("leave_reason_id"));
				String destination = request.getParameter("destination");

				Leave l = new Leave();
				l.setId(id);
				l.setLeave_time(leave_time);
				l.setLeave_reason_id(leave_reason_id);
				l.setDestination(destination);
				boolean bool = ld.updLeave(l);
				if (bool) {
					List<Leave> al = ld.findSketchy();
					request.setAttribute("sketchy", al);
					request.getRequestDispatcher("/leave/Sketchy.jsp").forward(request, response);
				} else {
					response.sendRedirect("/leave/Sketchy.jsp");
				}
			}

			// 入职部门名称查询
			if ("findE_Department".equals(flag)) {
				String department = request.getParameter("department");
				List<Leave> ll = ld.findE_Department(department);
				request.setAttribute("E_Department", ll);
				request.getRequestDispatcher("").forward(request, response);
			}

			// 入职员工编号查询
			if ("findE_Employee_id".equals(flag)) {
				int employee_id = Integer.valueOf(request.getParameter("employee_id"));
				List<Leave> ll = ld.findE_Employee_id(employee_id);
				request.setAttribute("E_Employee_id", ll);
				request.getRequestDispatcher("").forward(request, response);
			}

			// 入职员工姓名查询
			if ("findE_Name".equals(flag)) {
				String name = request.getParameter("name");
				List<Leave> ll = ld.findE_Name(name);
				request.setAttribute("E_Name", ll);
				request.getRequestDispatcher("").forward(request, response);
			}
			
			//员工简略信息查询
			if ("sketchy".equals(flag)) {
				List<Leave> al = ld.findSketchy();
				request.setAttribute("sketchy", al);
				request.getRequestDispatcher("/leave/Sketchy.jsp").forward(request, response);
			}
			
			//员工详细信息查询
			if ("detail".equals(flag)) {
				int id = Integer.valueOf(request.getParameter("record_id"));
				Leave l = ld.findDetail(id);
				request.setAttribute("leave", l);
				request.getRequestDispatcher("/leave/DetailInfo.jsp").forward(request, response);
			}

			// 模糊查询
			if ("findlike".equals(flag)) {
				int employee_id = 0;
				String name = null;
				
				try {
					employee_id = Integer.valueOf(request.getParameter("employee"));
				} catch (Exception ex) {
					name = request.getParameter("employee");
				}
				
				String department = request.getParameter("department");
				String job = request.getParameter("job");
				
				int leave_reason_id = 0;
				try {
					leave_reason_id = Integer.valueOf(request.getParameter("leave_reason_id"));
				} catch (Exception ex) {
					//ignore
				}
				
				Date leave_time1 = null;
				try {
					leave_time1 = Date.valueOf(request.getParameter("leave_time1"));
				} catch (Exception ex) {
					//ignore
				}
				
				Date leave_time2 = null;
				try {
					leave_time2 = Date.valueOf(request.getParameter("leave_time2"));
				} catch (Exception ex) {
					//ignore
				}
				
				
				List<Leave> al = ld.findEveryThing(employee_id, name, department, job, leave_reason_id, leave_time1, leave_time2);
				System.out.println(al);
				request.setAttribute("sketchy", al);
				request.getRequestDispatcher("/leave/Sketchy.jsp").forward(request, response);
			}

			// 离职日期查询
			if ("findL_Leave_time".equals(flag)) {
				Date B_leave_time = Date.valueOf(request.getParameter("B_leave_time"));
				Date F_leave_time = Date.valueOf(request.getParameter("F_leave_time"));
				List<Leave> ll = ld
						.findL_Leave_time(B_leave_time, F_leave_time);
				request.setAttribute("B_leave_time", ll);
				request.setAttribute("F_leave_time", ll);
				request.getRequestDispatcher("").forward(request, response);
			}
		} catch (DBException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}