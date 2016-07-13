package dlnu.hrsys.employee.movementImpl;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.movement.Movement;
import dlnu.hrsys.employee.movementDao.MovementDao;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

import javax.xml.transform.Result;

public class MovementImpl implements MovementDao {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	
	public MovementImpl() throws DBException {
		conn = DBUtil.getConn();
	}
	
	public boolean addMovement(Movement m, Employee employee, int newDepartmentId, int newJobId) {
		// TODO Auto-generated method stub
		
		boolean flag = true;
		
		try{	
			pstmt = conn.prepareStatement("insert into movement("
					+ "employee_id, front_movement_department,"
					+ "movement_department, movement_department_type,"
					+ "front_movement_job, movement_job, movement_job_type,"
					+ "movement_reason, movement_time) values(?,?,?,?,?,?,?,?,?)");

			pstmt2 = conn.prepareStatement("update employee set department_id = ?, job_id = ? where id = ?");

			pstmt.setInt(1, m.getEmployee_id());
			pstmt.setString(2, m.getFront_movement_department());
			pstmt.setString(3, m.getMovement_department());
			pstmt.setInt(4, m.getMovement_department_type());
			pstmt.setString(5, m.getFront_movement_job());
			pstmt.setString(6, m.getMovement_job());
			pstmt.setInt(7, m.getMovement_job_type());
			pstmt.setString(8, m.getMovement_reason());
			pstmt.setDate(9, m.getMovement_time());

			if (newDepartmentId == 0) {
				newDepartmentId = employee.getDepartment_id();
			}

			if (newJobId == 0) {
				newJobId = employee.getJob_id();
			}

			pstmt2.setInt(1, newDepartmentId);
			pstmt2.setInt(2, newJobId);
			pstmt2.setInt(3, m.getEmployee_id());

			pstmt.executeUpdate();
			pstmt2.executeUpdate();
		} catch (SQLException e) {
			flag = false;
			e.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public List<Movement> findAll() {
		List<Movement> list = new ArrayList<>();
		String sql = "SELECT * FROM movement ORDER BY movement_time ASC";

		try {
			stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);

			while (rs.next()) {
				Movement movement = new Movement();
				movement.setId(rs.getInt("id"));
				movement.setEmployee_id(rs.getInt("employee_id"));
				movement.setMovement_reason(rs.getString("movement_reason"));
				movement.setMovement_time(rs.getDate("movement_time"));

				movement.setFront_movement_department(rs.getString("front_movement_department"));
				movement.setMovement_department(rs.getString("movement_department"));
				movement.setMovement_department_type(rs.getInt("movement_department_type"));

				movement.setFront_movement_job(rs.getString("front_movement_job"));
				movement.setMovement_job(rs.getString("movement_job"));
				movement.setMovement_job_type(rs.getInt("movement_job_type"));

				list.add(movement);
			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}

		return list;
	}
}
