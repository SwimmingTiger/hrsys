package dlnu.hrsys.department.factory;

import dlnu.hrsys.department.dao.DepartmentsDAO;
import dlnu.hrsys.department.impl.DepartmentsDAOImpl;
import dlnu.hrsys.util.DBUtil.DBException;

public class departmentsDAOFactory {

	public static DepartmentsDAO getsDepartmentsDAO() throws DBException{
		return new DepartmentsDAOImpl();
	}
}
