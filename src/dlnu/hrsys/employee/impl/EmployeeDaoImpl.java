package dlnu.hrsys.employee.impl;

import java.sql.*;
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
    public boolean updEmployee(int id, int hire_id) {
        // TODO Auto-generated method stub
        boolean flag = false;
        try {
            pstmt = conn
                    .prepareStatement("update employee set probation_status = ?  where id = ? ");

            pstmt.setInt(1, hire_id);
            pstmt.setInt(2, id);

            pstmt.executeUpdate();

            if (hire_id == 3) {
                pstmt = conn.prepareStatement("update employee set hire_type_id = ?  where id = ? ");
                pstmt.setInt(1, hire_id);
                pstmt.setInt(2, id);
                pstmt.executeUpdate();
            }

            flag = true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return flag;
    }

    private Employee getResult(ResultSet rs) throws SQLException {
        Employee e = new Employee();

        e.setId(rs.getInt("id"));
        e.setName(rs.getString("name"));
        e.setSex_id(rs.getInt("sex_id"));
        e.setBirth_date(rs.getDate("birth_date"));
        e.setId_card(rs.getString("id_card"));
        e.setDepartment_id(rs.getInt("department_id"));
        e.setJob_id(rs.getInt("job_id"));
        e.setHire_date(rs.getDate("hire_date"));
        e.setJoin_date(rs.getDate("join_date"));
        e.setHire_type_id(rs.getInt("hire_type_id"));
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

        return e;
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
                Employee e = getResult(rs);
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
                Employee e = getResult(rs);
                al.add(e);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return al;
    }

    @Override
    public List findEmployeeByJobId(int jobId) {
        // TODO Auto-generated method stub

        List al = new ArrayList();
        ResultSet rs = null;
        String sql = "select * from employee where job_id=" + jobId;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Employee e = getResult(rs);
                al.add(e);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return al;
    }

    @Override
    public List findEmployeeByDepartmentId(int departmentId) {
        // TODO Auto-generated method stub

        List al = new ArrayList();
        ResultSet rs = null;
        String sql = "select * from employee where department_id=" + departmentId;
        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
                Employee e = getResult(rs);
                al.add(e);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return al;
    }

    public Employee findEmployeeById(int id) {
        ResultSet rs = null;
        Employee e = new Employee();
        String sql = "select * from employee where id=" + id;

        try {
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);

            if (rs.next()) {
                e = getResult(rs);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return e;
    }

    //模糊查询
    public List<Employee> findEveryThing(int employee_id, String name, int department_id,
                                         int job_id, Date join_date1, Date join_date2, int hire_type_id) {
        List<Employee> result = new ArrayList<>();
        List<Object> param = new ArrayList<>();
        Employee e = null;

        String sql = "SELECT * FROM employee WHERE 1";

        if (employee_id != 0) {
            sql += " AND id = ?";
            param.add(employee_id);
        }

        if (name != null && name.length() > 0) {
            sql += " AND name LIKE ?";
            param.add("%" + name + "%");
        }

        if (department_id != 0) {
            sql += " AND department_id = ?";
            param.add(department_id);
        }

        if (job_id != 0) {
            sql += " AND job_id = ?";
            param.add(job_id);
        }

        if (join_date2 != null && join_date1 == null) {
            join_date1 = join_date2;
            join_date2 = null;
        }

        if (join_date1 != null) {
            if (join_date2 != null
                    && join_date2.getTime() != join_date1.getTime()) {
                if (join_date2.getTime() < join_date1.getTime()) {
                    Date tDate = join_date2;
                    join_date2 = join_date1;
                    join_date1 = tDate;
                }

                sql += " AND join_date BETWEEN ? AND ?";
                param.add(join_date1);
                param.add(join_date2);

            } else {
                sql += " AND join_date = ?";
                param.add(join_date1);
            }
        }

        if (hire_type_id != 0) {
            sql += " AND hire_type_id = ?";
            param.add(hire_type_id);
        }

        System.out.println(sql);

        try {
            PreparedStatement pstmt = conn.prepareStatement(sql);

            for (int i = 1; i <= param.size(); i++) {
                pstmt.setObject(i, param.get(i - 1));
            }

            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                e = getResult(rs);
                result.add(e);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;


    }
}
