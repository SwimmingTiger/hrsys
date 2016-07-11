package dlnu.hrsys.job.factory;

import dlnu.hrsys.job.dao.JobDAO;
import dlnu.hrsys.job.impl.JobDAOImpl;
import dlnu.hrsys.util.DBUtil.DBException;

public class JobDAOFactory {

	// 实现设计模式，使架构更灵活
		public static JobDAO getJobDAO() throws DBException {
			return new JobDAOImpl();
		}

}
