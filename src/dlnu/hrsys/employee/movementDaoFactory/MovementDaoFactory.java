package dlnu.hrsys.employee.movementDaoFactory;

import dlnu.hrsys.employee.movementDao.MovementDao;
import dlnu.hrsys.employee.movementImpl.MovementImpl;
import dlnu.hrsys.util.DBUtil.DBException;

public class MovementDaoFactory {
	public static MovementDao getMovementDao() throws DBException{
		return new MovementImpl();
	}
}
