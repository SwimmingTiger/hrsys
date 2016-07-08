package dlnu.hrsys.department.daotest;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import dlnu.hrsys.department.dao.DepartmentsDAO;
import dlnu.hrsys.department.entity.Department;
import dlnu.hrsys.department.factory.departmentsDAOFactory;
import dlnu.hrsys.util.DBUtil.DBException;

public class testDepartment {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		//测试addDepartment功能
		//String name, int typeId, String phone, String fax,String des, int parentId, Date dateFound
		/*Date date = Date.valueOf("2016-7-1");
		Department d = new Department("财务部", 38, "15635152688", "52", "钱很多", 5, date);
		try {
				DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
				boolean flag = dD.addDepartment(d);
				if (flag)
				{
					System.out.print("add success!");
				}else{
					System.out.print("add fail!");
				}
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		*/
		
		
		//测试delDepartment功能
	/*	try {
			int delId = 11;
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			boolean flag = dD.delDepartment(delId);
			if (flag)
			{
				System.out.print("del success!");
			}else{
				System.out.print("del fail!");
			}
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		
		//测试chaDepartment功能
	/*	try {
			Date date = Date.valueOf("2016-6-30");
			Department d = new Department(9,"财务部", 38, "15635152688", "52", "钱很多", 5, date);
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			boolean flag = dD.chaDepartment(d);
			System.out.print(d.getId());
			if (flag)
			{
				System.out.print("change success!");
			}else{
				System.out.print("change fail!");
			}
		} catch (DBException e) {
			e.printStackTrace();
		}*/
		
		
		//测试findDepById 功能
		/*try {
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			Department d = dD.findDepById(9);
			System.out.print(d.getName());
			System.out.print(d.getId());
		} catch (DBException e) {
			e.printStackTrace();
		}*/
		
		//测试seekDepByLikeName 功能
		/*try {
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			List list = new ArrayList();
			list = dD.seekDepByLikeName("部");
			Iterator it = list.iterator();
			while(it.hasNext())
			{
				Department de = (Department) it.next();
				System.out.println(de.getId());
			}
			
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
		
		//测试seekDepByTypeId 功能
		/*try {
			List list = new ArrayList();
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			list = dD.seekDepByTypeId(38);
			Iterator it = list.iterator();
			while(it.hasNext())
			{
				Department d = (Department) it.next();
				System.out.print(d.getId());
			}
			
		} catch (DBException e) {
			e.printStackTrace();
		}*/
		
		//测试findAll 功能
		/*try {
			List list = new ArrayList();
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			list = dD.findAll();
			Iterator it = list.iterator();
			while(it.hasNext())
			{
				Department d = (Department) it.next();
				System.out.print(d.getId());
			}
			
		} catch (DBException e) {
			e.printStackTrace();
		}*/
		
		//测试findBySql 功能
		try {
			String sql = "SELECT `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date` FROM `department` where 1  and name like '%人事部%' and type_id=38";
			List list = new ArrayList();
			DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
			list = dD.findBySql(sql);
			Iterator it = list.iterator();
			while(it.hasNext())
			{
				Department d = (Department) it.next();
				System.out.print(d.getId());
				System.out.print(d.getName());
			
			}
		} catch (DBException e) {
			e.printStackTrace();
		}
	}
}
