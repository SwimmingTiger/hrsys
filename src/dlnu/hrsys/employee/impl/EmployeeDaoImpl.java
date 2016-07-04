package dlnu.hrsys.employee.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import dlnu.hrsys.employee.dao.EmployeeDao;
import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class EmployeeDaoImpl implements EmployeeDao {	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	
	public EmployeeDaoImpl() throws DBException {
		conn = DBUtil.getConn();
	}

	@Override
	public boolean addEmployee(Employee e) {
		// TODO Auto-generated method stub
		boolean flag = false;
		
		try {
			pstmt = conn
					.prepareStatement("insert into employee(id, name, sex_id, birth_date, id_card, department_id, job_id, hire_date, join_date, hire_type_id, hr_type_id, politics_status_id, nationality_id, native_place, phone, email, height_cm, blood_type_id, marital_status_id, birth_place, domicile_place, education_status_id, degree_id, graduate_school, major_name, graduate_date,probation_status) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			pstmt.setString(1, null);
			pstmt.setString(2, e.getName());
			pstmt.setInt(3, e.getSex_id());
			pstmt.setDate(4, e.getBirth_date());
			pstmt.setString(5, e.getId_card());
			pstmt.setInt(6, e.getDepartment_id());
			pstmt.setInt(7, e.getJob_id());
			pstmt.setDate(8, e.getHire_date());
			pstmt.setDate(9, e.getJoin_date());
			pstmt.setInt(10, e.getHire_type_id());
			pstmt.setInt(11, e.getHr_type_id());
			pstmt.setInt(12, e.getPolitics_status_id());
			pstmt.setInt(13, e.getNationality_id());
			pstmt.setString(14, e.getNative_place());
			pstmt.setString(15, e.getPhone());
			pstmt.setString(16, e.getEmail());
			pstmt.setInt(17, e.getHeight_cm());
			pstmt.setInt(18, e.getBlood_type_id());
			pstmt.setInt(19, e.getMarital_status_id());
			pstmt.setString(20, e.getBirth_place());
			pstmt.setString(21, e.getDomicile_place());
			pstmt.setInt(22, e.getEducation_status_id());
			pstmt.setInt(23, e.getDegree_id());
			pstmt.setString(24, e.getGraduate_school());
			pstmt.setString(25, e.getMajor_name());
			pstmt.setDate(26, e.getGraduate_date());
			pstmt.setInt(27, e.getHire_type_id());
			pstmt.executeUpdate();
			flag = true;
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		return flag;
	}

	@Override
	public boolean delEmployee(String eid) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean updEmployee(int id,int hire_id) {
		// TODO Auto-generated method stub
		boolean flag = false;
		try {
			pstmt = conn
					.prepareStatement("update employee set probation_status = ?  where id = ? ");
			
			pstmt.setInt(1, hire_id);
			pstmt.setInt(2, id);

			pstmt.executeUpdate();
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		return flag;
	}



	@Override
	public List findEmployee() {
		// TODO Auto-generated method stub
		List al = new ArrayList();
		ResultSet rs = null;
		String sql = "select * from employee";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Employee e = new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setSex_id(rs.getInt("sex_id"));
				e.setBirth_date(rs.getDate("birth_date"));
				e.setId_card(rs.getString("id_card"));
				e.setDepartment_id(rs.getInt("department_id"));
				e.setJob_id(rs.getInt("job_id"));
				e.setHire_date(rs.getDate("hire_date"));
				e.setJoin_date(rs.getDate("hire_date"));
				e.setHire_type_id(rs.getInt("hire_date"));
				e.setHr_type_id(rs.getInt("hr_type_id"));
				e.setPolitics_status_id(rs.getInt("politics_status_id"));
				e.setNationality_id(rs.getInt("nationality_id"));
				e.setNative_place(rs.getString("native_place"));
				e.setPhone(rs.getString("phone"));
				e.setEmail(rs.getString("email"));
				e.setHeight_cm(rs.getInt("height_cm"));
				e.setBlood_type_id(rs.getInt("blood_type_id"));
				e.setMarital_status_id(rs.getInt("marital_status_id"));
				e.setBirth_place(rs.getString("birth_place"));
				e.setDomicile_place(rs.getString("domicile_place"));
				e.setEducation_status_id(rs.getInt("education_status_id"));
				e.setDegree_id(rs.getInt("degree_id"));
				e.setGraduate_school(rs.getString("graduate_school"));
				e.setMajor_name(rs.getString("major_name"));
				e.setGraduate_date(rs.getDate("graduate_date"));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}

	@Override
	public List findEmployeeByHire_Id(int id) {
		// TODO Auto-generated method stub
		
		List al = new ArrayList();
		ResultSet rs = null;
		String sql = "select * from employee where probation_status=" + id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Employee e = new Employee();
				e.setId(rs.getInt("id"));
				e.setName(rs.getString("name"));
				e.setSex_id(rs.getInt("sex_id"));
				e.setBirth_date(rs.getDate("birth_date"));
				e.setId_card(rs.getString("id_card"));
				e.setDepartment_id(rs.getInt("department_id"));
				e.setJob_id(rs.getInt("job_id"));
				e.setHire_date(rs.getDate("hire_date"));
				e.setJoin_date(rs.getDate("hire_date"));
				e.setHire_type_id(rs.getInt("hire_date"));
				e.setHr_type_id(rs.getInt("hr_type_id"));
				e.setPolitics_status_id(rs.getInt("politics_status_id"));
				e.setNationality_id(rs.getInt("nationality_id"));
				e.setNative_place(rs.getString("native_place"));
				e.setPhone(rs.getString("phone"));
				e.setEmail(rs.getString("email"));
				e.setHeight_cm(rs.getInt("height_cm"));
				e.setBlood_type_id(rs.getInt("blood_type_id"));
				e.setMarital_status_id(rs.getInt("marital_status_id"));
				e.setBirth_place(rs.getString("birth_place"));
				e.setDomicile_place(rs.getString("domicile_place"));
				e.setEducation_status_id(rs.getInt("education_status_id"));
				e.setDegree_id(rs.getInt("degree_id"));
				e.setGraduate_school(rs.getString("graduate_school"));
				e.setMajor_name(rs.getString("major_name"));
				e.setGraduate_date(rs.getDate("graduate_date"));
				al.add(e);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}

}
