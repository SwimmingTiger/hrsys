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

package dlnu.hrsys.employee.leaveDaoFactory;

import dlnu.hrsys.employee.leaveDao.LeaveDao;
import dlnu.hrsys.employee.leaveImpl.LeaveImpl;
import dlnu.hrsys.util.DBUtil.DBException;

public class LeaveDaoFactory {
	public static LeaveDao getLeaveDao() throws DBException{
		return new LeaveImpl();
	}
}
