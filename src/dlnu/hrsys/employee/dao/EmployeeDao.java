package dlnu.hrsys.employee.dao;

import java.util.List;

import dlnu.hrsys.employee.entity.Employee;


public interface EmployeeDao {
	//增加用户。
	public boolean addEmployee(Employee e);
	//删除用户。
	public boolean delEmployee(String eid);
	//修改用户。
	public boolean updEmployee(int id,int hire_id);
	//单体查询。
	//public Employee findEmployeebyHire_Id(Employee e);
	//全查。
	public List findEmployee();
	public List findEmployeeByHire_Id(int id);
	
	public Employee findEmployeeById(int id);
}
