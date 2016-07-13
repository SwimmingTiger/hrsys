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

package dlnu.hrsys.employee.leaveImpl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dlnu.hrsys.employee.dao.EmployeeDao;
import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.impl.EmployeeDaoImpl;
import dlnu.hrsys.employee.leave.Leave;
import dlnu.hrsys.employee.leaveDao.LeaveDao;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.TypeUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class LeaveImpl implements LeaveDao {
	
	Connection conn = null;
	Statement stmt = null;
	PreparedStatement pstmt = null;
	PreparedStatement pstmt2 = null;
	
	public LeaveImpl() throws DBException {
		conn = DBUtil.getConn();
	}
	
	//添加
	public boolean addLeave(Leave l) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		try{	
				pstmt = conn.prepareStatement("insert into employee_leave_record("
						+ "leave_time, leave_reason_id, destination, employee_id, name,"
						+ "sex, birth_date, id_card, department, job, hire_date, join_date,"
						+ "hire_type, hr_type, politics_status, nationality, native_place,"
						+ "phone, email, height_cm, blood_type, marital_status, birth_place,"
						+ "domicile_place, education_status, degree, graduate_school, major_name,"
						+ "graduate_date) values(?,?,?,?,?,?,?,?,?,?,?,?,"
						+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
				pstmt2 = conn.prepareStatement("delete from employee where id = ?");
				pstmt.setDate(1, l.getLeave_time());
				pstmt.setInt(2, l.getLeave_reason_id());
				pstmt.setString(3, l.getDestination());
				pstmt.setInt(4, l.getEmployee_id());
				pstmt.setString(5, l.getName());
				pstmt.setString(6, l.getSex());
				pstmt.setDate(7, l.getBirth_date());
				pstmt.setString(8, l.getId_card());
				pstmt.setString(9, l.getDepartment());
				pstmt.setString(10, l.getJob());
				pstmt.setDate(11, l.getHire_date());
				pstmt.setDate(12, l.getJoin_date());
				pstmt.setString(13, l.getHire_type());
				pstmt.setString(14, l.getHr_type());
				pstmt.setString(15, l.getPolitics_status());
				pstmt.setString(16, l.getNationality());
				pstmt.setString(17, l.getNative_place());
				pstmt.setString(18, l.getPhone());
				pstmt.setString(19, l.getEmail());
				pstmt.setInt(20, l.getHeight_cm());
				pstmt.setString(21, l.getBlood_type());
				pstmt.setString(22, l.getMarital_status());
				pstmt.setString(23, l.getBirth_place());
				pstmt.setString(24, l.getDomicile_place());
				pstmt.setString(25, l.getEducation_status());
				pstmt.setString(26, l.getDegree());
				pstmt.setString(27, l.getGraduate_school());
				pstmt.setString(28, l.getMajor_name());
				pstmt.setDate(29, l.getGraduate_date());
				pstmt2.setInt(1, l.getEmployee_id());
				pstmt.executeUpdate();
				pstmt2.executeUpdate();
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	//输入添加信息
	@Override
	public Leave inputAdd(int id, Date leave_time, int leave_reason_id,
			String destination) throws DBException {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("unused")
		boolean flag = false;
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

		EmployeeDao employeeDao = new EmployeeDaoImpl();
		Employee e = employeeDao.findEmployeeById(id);

		employee_id = e.getId();
		name = e.getName();
		sex = TypeUtil.getItemName(e.getSex_id());
		birth_date = e.getBirth_date();
		id_card = e.getId_card();
		department = TypeUtil.getInstance().getDepartmentName(e.getDepartment_id());
		job = TypeUtil.getInstance().getJobName(e.getJob_id());
		hire_date = e.getHire_date();
		join_date = e.getJoin_date();
		hire_type = TypeUtil.getItemName(e.getHire_type_id());
		hr_type = TypeUtil.getItemName(e.getHr_type_id());
		politics_status = TypeUtil.getItemName(e
				.getPolitics_status_id());
		nationality = TypeUtil.getItemName(e.getNationality_id());
		native_place = e.getNative_place();
		phone = e.getPhone();
		email = e.getEmail();
		height_cm = e.getHeight_cm();
		blood_type = TypeUtil.getItemName(e.getBlood_type_id());
		marital_status = TypeUtil.getItemName(e.getMarital_status_id());
		birth_place = e.getBirth_place();
		domicile_place = e.getDomicile_place();
		education_status = TypeUtil.getItemName(e
				.getEducation_status_id());
		degree = TypeUtil.getItemName(e.getDegree_id());
		graduate_school = e.getGraduate_school();
		major_name = e.getMajor_name();
		graduate_date = e.getGraduate_date();

		Leave l = new Leave(id, leave_time, leave_reason_id,
				destination, employee_id, name, sex, birth_date,
				id_card, department, job, hire_date, join_date,
				hire_type, hr_type, politics_status, nationality,
				native_place, phone, email, height_cm, blood_type,
				marital_status, birth_place, domicile_place,
				education_status, degree, graduate_school, major_name,
				graduate_date);
		
		return l;
	}
	
	//修改
	public boolean updLeave(Leave l) {
		// TODO Auto-generated method stub
		
		boolean flag = false;
		
		try {
				pstmt = conn.prepareStatement("update employee_leave_record set"
						+ " leave_time = ?, leave_reason_id = ?,  destination= ? where id = ?");	
				pstmt.setDate(1, l.getLeave_time());
				pstmt.setInt(2, l.getLeave_reason_id());
				pstmt.setString(3, l.getDestination());
				pstmt.setInt(4, l.getId());
				pstmt.executeUpdate();
				flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	
	//全体查询
	@SuppressWarnings("unchecked")
	public List<Leave> findAll() {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List al = new ArrayList();
		Leave l = new Leave();
		ResultSet rs = null;
		
		try{	
				String sql = "select * from employee_leave_record";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()){
					l.setId(rs.getInt("id"));
					l.setLeave_time(rs.getDate("leave_time"));
					l.setLeave_reason_id(rs.getInt("leave_reason_id"));
					l.setDestination(rs.getString("destination"));
					l.setEmployee_id(rs.getInt("employee_id"));
					l.setName(rs.getString("name"));
					l.setSex(rs.getString("sex"));
					l.setBirth_date(rs.getDate("birth_date"));
					l.setId_card(rs.getString("id_card"));
					l.setDepartment(rs.getString("department"));
					l.setJob(rs.getString("job"));
					l.setHire_date(rs.getDate("hire_date"));
					l.setJoin_date(rs.getDate("join_date"));
					l.setHire_type(rs.getString("hire_type"));
					l.setHr_type(rs.getString("hr_type"));
					l.setPolitics_status(rs.getString("politics_status"));
					l.setNationality(rs.getString("nationality"));
					l.setNative_place(rs.getString("native_place"));
					l.setPhone(rs.getString("phone"));
					l.setEmail(rs.getString("email"));
					l.setHeight_cm(rs.getInt("height_cm"));
					l.setBlood_type(rs.getString("blood_type"));
					l.setMarital_status(rs.getString("marital_status"));
					l.setBirth_place(rs.getString("birth_place"));
					l.setDomicile_place(rs.getString("domicile_place"));
					l.setEducation_status(rs.getString("education_status"));
					l.setDegree(rs.getString("degree"));
					l.setGraduate_school(rs.getString("graduate_school"));
					l.setMajor_name(rs.getString("major_name"));
					l.setGraduate_date(rs.getDate("graduate_date"));
					al.add(l);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return al;
	}
	
	//员工简略信息查询
	@SuppressWarnings("unchecked")
	public List<Leave> findSketchy() {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List<Leave> al = new ArrayList();
		ResultSet rs = null;
		String sql="select id, employee_id, name, leave_time, "
				+ "department, job, leave_reason_id, destination"
				+ " from employee_leave_record";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				Leave l = new Leave();
				l.setId(rs.getInt("id"));
				l.setEmployee_id(rs.getInt("employee_id"));
				l.setName(rs.getString("name"));
				l.setDepartment(rs.getString("department"));
				l.setJob(rs.getString("job"));
				l.setLeave_reason_id(rs.getInt("leave_reason_id"));
				l.setLeave_time(rs.getDate("leave_time"));
				l.setDestination(rs.getString("destination"));
				al.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return al;
	}
	
	//员工详细信息查询
	public Leave findDetail(int id) {
		// TODO Auto-generated method stub
		
		Leave l=new Leave();
		ResultSet rs = null;
		
		try{	
			String sql = "select * from employee_leave_record where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()){
				l.setId(rs.getInt("id"));
				l.setLeave_time(rs.getDate("leave_time"));
				l.setLeave_reason_id(rs.getInt("leave_reason_id"));
				l.setDestination(rs.getString("destination"));
				l.setEmployee_id(rs.getInt("employee_id"));
				l.setName(rs.getString("name"));
				l.setSex(rs.getString("sex"));
				l.setBirth_date(rs.getDate("birth_date"));
				l.setId_card(rs.getString("id_card"));
				l.setDepartment(rs.getString("department"));
				l.setJob(rs.getString("job"));
				l.setHire_date(rs.getDate("hire_date"));
				l.setJoin_date(rs.getDate("join_date"));
				l.setHire_type(rs.getString("hire_type"));
				l.setHr_type(rs.getString("hr_type"));
				l.setPolitics_status(rs.getString("politics_status"));
				l.setNationality(rs.getString("nationality"));
				l.setNative_place(rs.getString("native_place"));
				l.setPhone(rs.getString("phone"));
				l.setEmail(rs.getString("email"));
				l.setHeight_cm(rs.getInt("height_cm"));
				l.setBlood_type(rs.getString("blood_type"));
				l.setMarital_status(rs.getString("marital_status"));
				l.setBirth_place(rs.getString("birth_place"));
				l.setDomicile_place(rs.getString("domicile_place"));
				l.setEducation_status(rs.getString("education_status"));
				l.setDegree(rs.getString("degree"));
				l.setGraduate_school(rs.getString("graduate_school"));
				l.setMajor_name(rs.getString("major_name"));
				l.setGraduate_date(rs.getDate("graduate_date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return l;
	}
	
	//模糊查询
	public List<Leave> findEveryThing(int employee_id, String name, String department,
			String job, int leave_reason_id, Date leave_time1, Date leave_time2) {
		List<Leave> result = new ArrayList<>();
		List<Object> param = new ArrayList<>();
		Leave l = null;
		
		String sql = "SELECT * FROM employee_leave_record WHERE 1";
		
		if (employee_id != 0) {
			sql += " AND employee_id = ?";
			param.add(employee_id);
		}
		
		if (name != null && name.length() > 0) {
			sql += " AND name LIKE ?";
			param.add("%" +name+ "%");
		}
		
		if (department != null && department.length() > 0) {
			sql += " AND department LIKE ?";
			param.add("%" +department+ "%");
		}
		
		if (job != null && job.length() > 0) {
			sql += " AND job LIKE ?";
			param.add("%" +job+ "%");
		}
		
		if (leave_reason_id != 0) {
			sql += " AND leave_reason_id = ?";
			param.add(leave_reason_id);
		}
		
		if (leave_time2 != null && leave_time1 == null) {
			leave_time1 = leave_time2;
			leave_time2 = null;
		}
		
		if (leave_time1 != null) {
			if (leave_time2 != null
					&& leave_time2.getTime() != leave_time1.getTime()) {
				if (leave_time2.getTime() < leave_time1.getTime()) {
					Date tDate = leave_time2;
					leave_time2 = leave_time1;
					leave_time1 = tDate;
				}

				sql += " AND leave_time BETWEEN ? AND ?";
				param.add(leave_time1);
				param.add(leave_time2);

			} else {
				sql += " AND leave_time = ?";
				param.add(leave_time1);
			}
		}
		
		System.out.println(sql);
		
		try{
			PreparedStatement pstmt = conn.prepareStatement(sql);
		
			for (int i=1; i<=param.size(); i++) {
				pstmt.setObject(i, param.get(i-1));
			}
		
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				l = new Leave();
				l.setId(rs.getInt("id"));
				l.setLeave_time(rs.getDate("leave_time"));
				l.setLeave_reason_id(rs.getInt("leave_reason_id"));
				l.setDestination(rs.getString("destination"));
				l.setEmployee_id(rs.getInt("employee_id"));
				l.setName(rs.getString("name"));
				l.setSex(rs.getString("sex"));
				l.setBirth_date(rs.getDate("birth_date"));
				l.setId_card(rs.getString("id_card"));
				l.setDepartment(rs.getString("department"));
				l.setJob(rs.getString("job"));
				l.setHire_date(rs.getDate("hire_date"));
				l.setJoin_date(rs.getDate("join_date"));
				l.setHire_type(rs.getString("hire_type"));
				l.setHr_type(rs.getString("hr_type"));
				l.setPolitics_status(rs.getString("politics_status"));
				l.setNationality(rs.getString("nationality"));
				l.setNative_place(rs.getString("native_place"));
				l.setPhone(rs.getString("phone"));
				l.setEmail(rs.getString("email"));
				l.setHeight_cm(rs.getInt("height_cm"));
				l.setBlood_type(rs.getString("blood_type"));
				l.setMarital_status(rs.getString("marital_status"));
				l.setBirth_place(rs.getString("birth_place"));
				l.setDomicile_place(rs.getString("domicile_place"));
				l.setEducation_status(rs.getString("education_status"));
				l.setDegree(rs.getString("degree"));
				l.setGraduate_school(rs.getString("graduate_school"));
				l.setMajor_name(rs.getString("major_name"));
				l.setGraduate_date(rs.getDate("graduate_date"));
				result.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	return result;
		
		
	}
	
	//入职部门名称查询
	@SuppressWarnings("unchecked")
	public List<Leave> findE_Department(String department) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List al = new ArrayList();
		Leave l = new Leave();
		
		try{	
				pstmt = conn.prepareStatement("select * from employee_leave_record where department = ?");
				pstmt.setString(1, department);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					l.setId(rs.getInt("id"));
					l.setLeave_time(rs.getDate("leave_time"));
					l.setLeave_reason_id(rs.getInt("leave_reason_id"));
					l.setDestination(rs.getString("destination"));
					l.setEmployee_id(rs.getInt("employee_id"));
					l.setName(rs.getString("name"));
					l.setSex(rs.getString("sex"));
					l.setBirth_date(rs.getDate("birth_date"));
					l.setId_card(rs.getString("id_card"));
					l.setDepartment(rs.getString("department"));
					l.setJob(rs.getString("job"));
					l.setHire_date(rs.getDate("hire_date"));
					l.setJoin_date(rs.getDate("join_date"));
					l.setHire_type(rs.getString("hire_type"));
					l.setHr_type(rs.getString("hr_type"));
					l.setPolitics_status(rs.getString("politics_status"));
					l.setNationality(rs.getString("nationality"));
					l.setNative_place(rs.getString("native_place"));
					l.setPhone(rs.getString("phone"));
					l.setEmail(rs.getString("email"));
					l.setHeight_cm(rs.getInt("height_cm"));
					l.setBlood_type(rs.getString("blood_type"));
					l.setMarital_status(rs.getString("marital_status"));
					l.setBirth_place(rs.getString("birth_place"));
					l.setDomicile_place(rs.getString("domicile_place"));
					l.setEducation_status(rs.getString("education_status"));
					l.setDegree(rs.getString("degree"));
					l.setGraduate_school(rs.getString("graduate_school"));
					l.setMajor_name(rs.getString("major_name"));
					l.setGraduate_date(rs.getDate("graduate_date"));
					al.add(l);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		return al;
	}
	
	//入职员工编号查询
	@SuppressWarnings("unchecked")
	public List<Leave> findE_Employee_id(int employee_id) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List al = new ArrayList();
		Leave l=new Leave();
		
		try{	
				pstmt = conn.prepareStatement("select * from employee_leave_record where employee_id = ?");
				pstmt.setInt(1, employee_id);
				ResultSet rs = pstmt.executeQuery();
				while(rs.next()){
					l.setId(rs.getInt("id"));
					l.setLeave_time(rs.getDate("leave_time"));
					l.setLeave_reason_id(rs.getInt("leave_reason_id"));
					l.setDestination(rs.getString("destination"));
					l.setEmployee_id(rs.getInt("employee_id"));
					l.setName(rs.getString("name"));
					l.setSex(rs.getString("sex"));
					l.setBirth_date(rs.getDate("birth_date"));
					l.setId_card(rs.getString("id_card"));
					l.setDepartment(rs.getString("department"));
					l.setJob(rs.getString("job"));
					l.setHire_date(rs.getDate("hire_date"));
					l.setJoin_date(rs.getDate("join_date"));
					l.setHire_type(rs.getString("hire_type"));
					l.setHr_type(rs.getString("hr_type"));
					l.setPolitics_status(rs.getString("politics_status"));
					l.setNationality(rs.getString("nationality"));
					l.setNative_place(rs.getString("native_place"));
					l.setPhone(rs.getString("phone"));
					l.setEmail(rs.getString("email"));
					l.setHeight_cm(rs.getInt("height_cm"));
					l.setBlood_type(rs.getString("blood_type"));
					l.setMarital_status(rs.getString("marital_status"));
					l.setBirth_place(rs.getString("birth_place"));
					l.setDomicile_place(rs.getString("domicile_place"));
					l.setEducation_status(rs.getString("education_status"));
					l.setDegree(rs.getString("degree"));
					l.setGraduate_school(rs.getString("graduate_school"));
					l.setMajor_name(rs.getString("major_name"));
					l.setGraduate_date(rs.getDate("graduate_date"));
					al.add(l);
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;	
	}
	
	//入职员工姓名查询
	@SuppressWarnings("unchecked")
	public List<Leave> findE_Name(String name) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List al = new ArrayList();
		Leave l = new Leave();
		
		try{	
			pstmt = conn.prepareStatement("select * from employee_leave_record where name = ?");
			pstmt.setString(1, name);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				l.setId(rs.getInt("id"));
				l.setLeave_time(rs.getDate("leave_time"));
				l.setLeave_reason_id(rs.getInt("leave_reason_id"));
				l.setDestination(rs.getString("destination"));
				l.setEmployee_id(rs.getInt("employee_id"));
				l.setName(rs.getString("name"));
				l.setSex(rs.getString("sex"));
				l.setBirth_date(rs.getDate("birth_date"));
				l.setId_card(rs.getString("id_card"));
				l.setDepartment(rs.getString("department"));
				l.setJob(rs.getString("job"));
				l.setHire_date(rs.getDate("hire_date"));
				l.setJoin_date(rs.getDate("join_date"));
				l.setHire_type(rs.getString("hire_type"));
				l.setHr_type(rs.getString("hr_type"));
				l.setPolitics_status(rs.getString("politics_status"));
				l.setNationality(rs.getString("nationality"));
				l.setNative_place(rs.getString("native_place"));
				l.setPhone(rs.getString("phone"));
				l.setEmail(rs.getString("email"));
				l.setHeight_cm(rs.getInt("height_cm"));
				l.setBlood_type(rs.getString("blood_type"));
				l.setMarital_status(rs.getString("marital_status"));
				l.setBirth_place(rs.getString("birth_place"));
				l.setDomicile_place(rs.getString("domicile_place"));
				l.setEducation_status(rs.getString("education_status"));
				l.setDegree(rs.getString("degree"));
				l.setGraduate_school(rs.getString("graduate_school"));
				l.setMajor_name(rs.getString("major_name"));
				l.setGraduate_date(rs.getDate("graduate_date"));
				al.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}
	
	//离职日期查询
	@SuppressWarnings("unchecked")
	public List<Leave> findL_Leave_time(Date B_leave_time, Date F_leave_time) {
		// TODO Auto-generated method stub
		
		@SuppressWarnings("rawtypes")
		List al = new ArrayList();
		Leave l = new Leave();
		
		try{	
			pstmt = conn.prepareStatement("select * from employee_leave_record where"
					+ "leave_time between '?' and '?'");
			pstmt.setDate(1, B_leave_time);
			pstmt.setDate(2, F_leave_time);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()){
				l.setId(rs.getInt("id"));
				l.setLeave_time(rs.getDate("leave_time"));
				l.setLeave_reason_id(rs.getInt("leave_reason_id"));
				l.setDestination(rs.getString("destination"));
				l.setEmployee_id(rs.getInt("employee_id"));
				l.setName(rs.getString("name"));
				l.setSex(rs.getString("sex"));
				l.setBirth_date(rs.getDate("birth_date"));
				l.setId_card(rs.getString("id_card"));
				l.setDepartment(rs.getString("department"));
				l.setJob(rs.getString("job"));
				l.setHire_date(rs.getDate("hire_date"));
				l.setJoin_date(rs.getDate("join_date"));
				l.setHire_type(rs.getString("hire_type"));
				l.setHr_type(rs.getString("hr_type"));
				l.setPolitics_status(rs.getString("politics_status"));
				l.setNationality(rs.getString("nationality"));
				l.setNative_place(rs.getString("native_place"));
				l.setPhone(rs.getString("phone"));
				l.setEmail(rs.getString("email"));
				l.setHeight_cm(rs.getInt("height_cm"));
				l.setBlood_type(rs.getString("blood_type"));
				l.setMarital_status(rs.getString("marital_status"));
				l.setBirth_place(rs.getString("birth_place"));
				l.setDomicile_place(rs.getString("domicile_place"));
				l.setEducation_status(rs.getString("education_status"));
				l.setDegree(rs.getString("degree"));
				l.setGraduate_school(rs.getString("graduate_school"));
				l.setMajor_name(rs.getString("major_name"));
				l.setGraduate_date(rs.getDate("graduate_date"));
				al.add(l);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return al;
	}
}