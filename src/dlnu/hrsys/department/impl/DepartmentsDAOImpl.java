package dlnu.hrsys.department.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dlnu.hrsys.department.dao.DepartmentsDAO;
import dlnu.hrsys.department.entity.Department;
import dlnu.hrsys.department.factory.departmentsDAOFactory;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class DepartmentsDAOImpl implements DepartmentsDAO {

	Connection conn = null;
	Statement stmt = null;
	
	public DepartmentsDAOImpl() throws DBException {
		
		conn = DBUtil.getConn();
	}
	
	public boolean addDepartment(Department department)
	{
		boolean flag = false;
		PreparedStatement pstmt=null;
		try {
				//sql： INSERT INTO `department`( `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date`) VALUES ('财务部','38','15635152688','52','钱很多','5','2016-6-29')
				pstmt = conn.prepareStatement("INSERT INTO `department`( `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date`) VALUES (?,?,?,?,?,?,?)");
				pstmt.setString(1, department.getName());
				pstmt.setInt(2, department.getTypeId());
				pstmt.setString(3, department.getPhone());
				pstmt.setString(4, department.getFax());
				pstmt.setString(5, department.getDesc());
				if (department.getParentId() == 0) {
					pstmt.setObject(6, null);
				} else {
					pstmt.setInt(6, department.getParentId());
				}
				pstmt.setDate(7, department.getFoundDate());
				int num = pstmt.executeUpdate();
				
				//判断添加是否成功
				if(num > 0)
				{
					flag = true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
			
		return flag;
	}
	public boolean delDepartment(int dId)
	{
		boolean flag = false;
		PreparedStatement pstmt = null;
		
		try {
			pstmt = conn.prepareStatement("DELETE FROM `department` WHERE id = ?");
			pstmt.setInt(1, dId);
			int num = pstmt.executeUpdate();
			//判断删除是否成功
			if(num > 0)
			{
				flag = true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return flag;
	}
	public boolean chaDepartment(Department department)
	{
		boolean flag = false;
		PreparedStatement pstmt=null;
		try {
				//sql： UPDATE `department` SET `name`='修改',`type_id`=38,`phone`='1393233343',`fax`='0999',`desc`='908798',`parent_id`=5,`birth_date`='2016-7-1' WHERE id=9
				pstmt = conn.prepareStatement("UPDATE `department` SET `name`=?,`type_id`=?,`phone`=?,`fax`=?,`desc`=?,`parent_id`=?,`birth_date`=? WHERE id=?");
				pstmt.setString(1, department.getName());
				pstmt.setInt(2, department.getTypeId());
				pstmt.setString(3, department.getPhone());
				pstmt.setString(4, department.getFax());
				pstmt.setString(5, department.getDesc());
				pstmt.setInt(6, department.getParentId());
				pstmt.setDate(7, department.getFoundDate());
				pstmt.setInt(8, department.getId());
				int num = pstmt.executeUpdate();
				
				//判断添加是否成功
				if(num > 0)
				{
					flag = true;
				}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		

		return flag;
	}
	public Department findDepById(int departmentId)
	{
		boolean flag = false;
		Department de = new Department();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM `department` WHERE id=?");
			pstmt.setInt(1, departmentId);
			rs = pstmt.executeQuery();
			if(rs.next())
			{
				de.setId(rs.getInt("id"));
				de.setName(rs.getString("name"));
				de.setTypeId(rs.getInt("type_id"));
				de.setPhone(rs.getString("phone"));
				de.setFax(rs.getString("fax"));
				de.setDesc(rs.getString("desc"));
				de.setParentId(rs.getInt("parent_id"));
				de.setFoundDate(rs.getDate("birth_date"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return de;
	}
	public List seekDepByLikeName(String departmentName)
	{
		List list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rs = null;		

		try {
			pstmt = conn.prepareStatement("select * from department where name like ?");
			String strkey = "%" + departmentName + "%";						
			pstmt.setString(1, strkey);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				Department de = new Department();
				de.setId(rs.getInt("id"));
				de.setName(rs.getString("name"));
				de.setTypeId(rs.getInt("type_id"));
				de.setPhone(rs.getString("phone"));
				de.setFax(rs.getString("fax"));
				de.setDesc(rs.getString("desc"));
				de.setParentId(rs.getInt("parent_id"));
				de.setFoundDate(rs.getDate("birth_date"));
				list.add(de);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	public List seekDepByTypeId(int typeId)
	{
		List list = new ArrayList();
		Department de = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = conn.prepareStatement("SELECT * FROM `department` WHERE type_id=?");
			pstmt.setInt(1, typeId);
			rs = pstmt.executeQuery();
			while (rs.next())
			{
				de = new Department();
				de.setId(rs.getInt("id"));
				de.setName(rs.getString("name"));
				de.setTypeId(rs.getInt("type_id"));
				de.setPhone(rs.getString("phone"));
				de.setFax(rs.getString("fax"));
				de.setDesc(rs.getString("desc"));
				de.setParentId(rs.getInt("parent_id"));
				de.setFoundDate(rs.getDate("birth_date"));
				list.add(de);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
	
	public List findAll()
	{
		List list = new ArrayList();
		Department de = null;
		ResultSet rs = null;
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery("SELECT * FROM `department`");
			
			while (rs.next())
			{
				de = new Department();
				de.setId(rs.getInt("id"));
				de.setName(rs.getString("name"));
				de.setTypeId(rs.getInt("type_id"));
				de.setPhone(rs.getString("phone"));
				de.setFax(rs.getString("fax"));
				de.setDesc(rs.getString("desc"));
				de.setParentId(rs.getInt("parent_id"));
				de.setFoundDate(rs.getDate("birth_date"));
				list.add(de);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public List findBySql(String sql)
	{
		List list = new ArrayList();
		Department de = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while (rs.next())
			{
				de = new Department();
				de.setId(rs.getInt("id"));
				de.setName(rs.getString("name"));
				de.setTypeId(rs.getInt("type_id"));
				de.setPhone(rs.getString("phone"));
				de.setFax(rs.getString("fax"));
				de.setDesc(rs.getString("desc"));
				de.setParentId(rs.getInt("parent_id"));
				de.setFoundDate(rs.getDate("birth_date"));
				list.add(de);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return list;
	}
}
