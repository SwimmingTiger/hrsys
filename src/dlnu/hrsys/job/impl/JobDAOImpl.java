package dlnu.hrsys.job.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import dlnu.hrsys.job.dao.JobDAO;
import dlnu.hrsys.job.entity.Job;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.DBUtil.DBException;

public class JobDAOImpl implements JobDAO {
	Connection conn = null;
	Statement stmt = null;
	public JobDAOImpl() throws DBException {
		conn = DBUtil.getConn();
		
	}
	@Override
	public boolean addJob(Job j) {
		boolean flag = false;
		PreparedStatement pst = null;
		try {
			String sql = "insert into job (name,type_id,size)values(?,?,?)";
			pst = conn.prepareStatement(sql);
			pst.setString(1, j.getName());
			pst.setInt(2, j.getType_id());
			pst.setInt(3, j.getSize());
		
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			try {
				pst.close();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public boolean delJob(int id) {
		// TODO 自动生成的方法存根
		String sql = "delete from Job where id = "+id;
		boolean flag = false;
		try {
			stmt = conn.createStatement();
			stmt.execute(sql);
			flag = true;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				stmt.close();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public boolean updJob(Job j) {
		// TODO 自动生成的方法存根
		boolean flag = false;
		PreparedStatement pst = null;
		try {
			String sql = "update job set name=?,type_id=?,size=? where id=?";
			pst = conn.prepareStatement(sql);
			pst.setString(1, j.getName());
			pst.setInt(2, j.getType_id());
			pst.setInt(3, j.getSize());
			pst.setInt(4, j.getId());
			
			pst.executeUpdate();
			flag = true;
		} catch (Exception e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}finally {
			try {
				pst.close();
				//conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return flag;
	}

	@Override
	public List findJobByType_id(int type_id) {
		// TODO 自动生成的方法存根
		List al = new ArrayList();
		ResultSet rs = null;
		Job j = null;
        //查询两个表
		String sql = "select * from Job where type_id =" + type_id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				j = new Job();
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setType_id(rs.getInt("type_id"));
				j.setSize(rs.getInt("size"));
				al.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				//conn.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}

	@Override
	public List searchJobs(String name, int type_id) {
		// TODO 自动生成的方法存根
		List al = new ArrayList();
		ResultSet rs = null;
		Job j = null;
        
		String sql = "select * from Job where 1";
		
		if (null != name && !"".equals(name)) {
			sql += " AND name LIKE '%" + name + "%'";
		}
		
		if (0 != type_id) {
			sql += " AND type_id = " + type_id;
		}
		
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				j = new Job();
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setType_id(rs.getInt("type_id"));
				j.setSize(rs.getInt("size"));
				al.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				//conn.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}

	
	@Override
	public Job findJobById(int id) {
		// TODO 自动生成的方法存根
		
		ResultSet rs = null;
		Job j = new Job();
        //查询两个表
		String sql = "select * from Job where id =" + id;
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setType_id(rs.getInt("type_id"));
				j.setSize(rs.getInt("size"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				//conn.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return j;
	}

	@Override
	public List findJobByName(String name) {
		// TODO 自动生成的方法存根
		List al = new ArrayList();
		ResultSet rs = null;
		Job j = new Job();
		String sql = "select * from Job where name like '%"+name+"%'";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setType_id(rs.getInt("type_id"));
				j.setSize(rs.getInt("size"));
				al.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				//conn.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}

	@Override
	public List findJobAll() {
		// TODO 自动生成的方法存根
		List al = new ArrayList();
		ResultSet rs = null;
		String sql = "select id,name,type_id,size from Job";
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Job j = new Job();
				j.setId(rs.getInt("id"));
				j.setName(rs.getString("name"));
				j.setType_id(rs.getInt("type_id"));
				j.setSize(rs.getInt("size"));
				al.add(j);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				rs.close();
				//conn.close();
				stmt.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return al;
	}

}
