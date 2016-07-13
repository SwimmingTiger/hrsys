package dlnu.hrsys.employee.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlnu.hrsys.employee.movement.Movement;
import dlnu.hrsys.employee.movementDao.MovementDao;
import dlnu.hrsys.employee.movementDaoFactory.MovementDaoFactory;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class MovementServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
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
				int id = Integer.valueOf(request.getParameter("id"));
				int employee_id = Integer.valueOf(request.getParameter("employee_id"));
				String front_movement_department = request.getParameter("front_movement_department");
				String movement_department = request.getParameter("movement_department");
				int movement_department_type = Integer.valueOf(request
						.getParameter("movement_department_type"));
				String front_movement_job = request.getParameter("front_movement_job");
				String movement_job = request.getParameter("movement_job");
				int movement_job_type = Integer.valueOf(request
						.getParameter("movement_job_type"));
				String movement_reason = request.getParameter("movement_reason");
				Date movement_time = Date.valueOf(request
						.getParameter("movement_time"));
				
				Movement l = new Movement(id, employee_id, front_movement_department,
						movement_department, movement_department_type,
						front_movement_job, movement_job, movement_job_type,
						movement_reason, movement_time);
				boolean bool = md.addMovement(l);
				if (bool) {
					request.getRequestDispatcher("/leave/Sketchy.jsp").forward(
							request, response);
				} else {
					response.sendRedirect("./leave/LeaveAdd.jsp?employee_id="
							+ l.getEmployee_id());
				}
			}
		} catch (DBException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
	}
}
