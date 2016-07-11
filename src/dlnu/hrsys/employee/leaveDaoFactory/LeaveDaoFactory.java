package dlnu.hrsys.employee.leaveDaoFactory;

import dlnu.hrsys.employee.leaveDao.LeaveDao;
import dlnu.hrsys.employee.leaveImpl.LeaveImpl;
import dlnu.hrsys.util.DBUtil.DBException;

public class LeaveDaoFactory {
	public static LeaveDao getLeaveDao() throws DBException{
		return new LeaveImpl();
	}
}
