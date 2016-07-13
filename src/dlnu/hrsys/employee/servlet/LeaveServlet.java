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
import java.util.logging.Level;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlnu.hrsys.employee.dao.EmployeeDao;
import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.impl.EmployeeDaoImpl;
import dlnu.hrsys.employee.leave.Leave;
import dlnu.hrsys.employee.leaveDao.LeaveDao;
import dlnu.hrsys.employee.leaveDaoFactory.LeaveDaoFactory;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.TypeUtil;
import dlnu.hrsys.util.DBUtil.DBException;

@SuppressWarnings("serial")
@WebServlet(name = "LeaveServlet", urlPatterns = "/LeaveServlet.action")
public class LeaveServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		LeaveDao ld;

		try {
			ld = LeaveDaoFactory.getLeaveDao();

			String flag = request.getParameter("flag");

			Connection conn = DBUtil.getConn();
			ResultSet rs = null;
			PreparedStatement pstmt = null;

			// 添加离职员工信息
			if ("add".equals(flag)) {
				int id = Integer.valueOf(request.getParameter("id"));
				Date leave_time = Date.valueOf(request
						.getParameter("leave_time"));
				int leave_reason_id = Integer.valueOf(request
						.getParameter("leave_reason_id"));
				String destination = request.getParameter("destination");
				Leave l = ld.inputAdd(id, leave_time, leave_reason_id,
						destination);
				boolean bool = ld.addLeave(l);
				if (bool) {
					request.setAttribute("Employee_leave_record", l);

					List<Leave> al = ld.findSketchy();
					request.setAttribute("sketchy", al);
					request.getRequestDispatcher("/leave/Sketchy.jsp").forward(
							request, response);
				} else {
					response.sendRedirect("./leave/LeaveAdd.jsp?employee_id="
							+ l.getEmployee_id());
				}
			}

			// 修改
			if ("upd".equals(flag)) {
				int id = Integer.valueOf(request.getParameter("id"));
				Date leave_time = Date.valueOf(request
						.getParameter("leave_time"));
				int leave_reason_id = Integer.valueOf(request
						.getParameter("leave_reason_id"));
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
					request.getRequestDispatcher("/leave/Sketchy.jsp").forward(
							request, response);
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
				int employee_id = Integer.valueOf(request
						.getParameter("employee_id"));
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

			// 员工简略信息查询
			if ("sketchy".equals(flag)) {
				List<Leave> al = ld.findSketchy();
				request.setAttribute("sketchy", al);
				request.getRequestDispatcher("/leave/Sketchy.jsp").forward(
						request, response);
			}

			// 员工详细信息查询
			if ("detail".equals(flag)) {
				int id = Integer.valueOf(request.getParameter("record_id"));
				Leave l = ld.findDetail(id);
				request.setAttribute("leave", l);
				request.getRequestDispatcher("/leave/DetailInfo.jsp").forward(
						request, response);
			}

			// 模糊查询
			if ("findlike".equals(flag)) {
				int employee_id = 0;
				String name = null;

				try {
					employee_id = Integer.valueOf(request
							.getParameter("employee"));
				} catch (Exception ex) {
					name = request.getParameter("employee");
				}

				String department = request.getParameter("department");
				String job = request.getParameter("job");

				int leave_reason_id = 0;
				try {
					leave_reason_id = Integer.valueOf(request
							.getParameter("leave_reason_id"));
				} catch (Exception ex) {
					// ignore
				}

				Date leave_time1 = null;
				try {
					leave_time1 = Date.valueOf(request
							.getParameter("leave_time1"));
				} catch (Exception ex) {
					// ignore
				}

				Date leave_time2 = null;
				try {
					leave_time2 = Date.valueOf(request
							.getParameter("leave_time2"));
				} catch (Exception ex) {
					// ignore
				}

				List<Leave> al = ld.findEveryThing(employee_id, name,
						department, job, leave_reason_id, leave_time1,
						leave_time2);
				System.out.println(al);
				request.setAttribute("sketchy", al);
				request.getRequestDispatcher("/leave/Sketchy.jsp").forward(
						request, response);
			}

			// 离职日期查询
			if ("findL_Leave_time".equals(flag)) {
				Date B_leave_time = Date.valueOf(request
						.getParameter("B_leave_time"));
				Date F_leave_time = Date.valueOf(request
						.getParameter("F_leave_time"));
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