package dlnu.hrsys.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.impl.EmployeeDaoImpl;
import dlnu.hrsys.employee.movement.Movement;
import dlnu.hrsys.employee.movementDao.MovementDao;
import dlnu.hrsys.employee.movementDaoFactory.MovementDaoFactory;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;
import dlnu.hrsys.util.TypeUtil;

@WebServlet(name = "MovementServlet", urlPatterns = "/MovementServlet.action")
public class MovementServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		MovementDao md;

		try {
			md = MovementDaoFactory.getMovementDao();

			String flag = request.getParameter("flag");

			@SuppressWarnings("unused")
			Connection conn = DBUtil.getConn();
			@SuppressWarnings("unused")
			ResultSet rs = null;
			@SuppressWarnings("unused")
			PreparedStatement pstmt = null;

			// 添加调转员工信息
			if ("add".equals(flag)) {
				try {

				int id = 0; //id是自动增长的

				int employee_id = Integer.valueOf(request.getParameter("employee_id"));

				Employee employee = (new EmployeeDaoImpl()).findEmployeeById(employee_id);

				String front_movement_department = TypeUtil.getInstance().getDepartmentName(employee.getDepartment_id());
				int movement_department_id = Integer.valueOf(request.getParameter("department_id"));
				String movement_department = "";
				try {
					movement_department = TypeUtil.getInstance().getDepartmentName(movement_department_id);
				} catch (Exception ex) {
					// ignore
				}
				int movement_department_type = Integer.valueOf(request.getParameter("movement_department_type"));

				String front_movement_job = TypeUtil.getInstance().getJobName(employee.getJob_id());
				int movement_job_id = Integer.valueOf(request.getParameter("job_id"));
				String movement_job = "";
				try {
					movement_job = TypeUtil.getInstance().getJobName(movement_job_id);
				} catch (Exception ex) {
					// ignore
				}
				int movement_job_type = Integer.valueOf(request.getParameter("movement_job_type"));

				String movement_reason = request.getParameter("movement_reason");
				Date movement_time = Date.valueOf(request.getParameter("movement_time"));

				if (movement_department_id == 0 && movement_job_id == 0) {
					response.getWriter().println("<script>alert('部门和岗位均未调转！');history.back();</script>");
				} else {

					Movement l = new Movement(id, employee_id, front_movement_department,
							movement_department, movement_department_type,
							front_movement_job, movement_job, movement_job_type,
							movement_reason, movement_time);

					boolean bool = md.addMovement(l, employee, movement_department_id, movement_job_id);

					if (bool) {
						response.sendRedirect("MovementServlet.action?flag=find_all");
					} else {
						response.getWriter().println("<script>alert('添加失败！');history.back();</script>");
					}
				}
				} catch (IllegalArgumentException ex) {
					response.getWriter().println("<script>alert('数字或日期格式不正确！');history.back();</script>");
				}
			}

			if ("find_all".equals(flag)) {
				List<Movement> movementList = md.findAll();
				request.setAttribute("movementList", movementList);
				//System.out.println(movementList.toString());
				request.getRequestDispatcher("/movement/list.jsp").forward(request, response);
			}
		} catch (DBException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
