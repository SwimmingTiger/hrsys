package dlnu.hrsys.department.dao;

import java.util.List;

import dlnu.hrsys.department.entity.Department;

public interface DepartmentsDAO {

	public boolean addDepartment(Department department);
	public boolean delDepartment(int dId);
	public boolean chaDepartment(Department department);
	public Department findDepById(int departmentId);
	public List seekDepByLikeName(String departmentName);
	public List seekDepByTypeId(int typeId);
	public List findAll();

	List findAll(int parentId);

	public List findBySql(String sql);
}
