package dlnu.hrsys.employee.movementImpl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

import dlnu.hrsys.employee.movement.Movement;
import dlnu.hrsys.employee.movementDao.MovementDao;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class MovementImpl implements MovementDao {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	
	public MovementImpl() throws DBException {
		conn = DBUtil.getConn();
	}
	
	public boolean addMovement(Movement m) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		try{	
			pstmt = conn.prepareStatement("insert into movement"
					+ "employee_id, front_movement_department,"
					+ "movement_department, movement_department_type,"
					+ "front_movement_job, movement_job, movement_job_type,"
					+ "movement_reason, movement_time) values(?,?,?,?,?,?,?,?,?)");
			pstmt2 = conn.prepareStatement("update from employee set department = ?,"
					+ "job = ? where id = ?");
			pstmt.setInt(1, m.getEmployee_id());
			pstmt.setString(2, m.getFront_movement_department());
			pstmt.setString(3, m.getMovement_department());
			pstmt.setInt(4, m.getMovement_department_type());
			pstmt.setString(5, m.getFront_movement_job());
			pstmt.setString(6, m.getMovement_job());
			pstmt.setInt(7, m.getMovement_job_type());
			pstmt.setString(8, m.getMovement_reason());
			pstmt.setDate(9, m.getMovement_time());
			pstmt2.setString(1, m.getMovement_department());
			pstmt2.setString(2, m.getMovement_job());
			pstmt2.setInt(3, m.getEmployee_id());
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
}
