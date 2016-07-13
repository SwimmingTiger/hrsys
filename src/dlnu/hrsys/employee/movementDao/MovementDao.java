package dlnu.hrsys.employee.movementDao;

import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.movement.Movement;

public interface MovementDao {
	//添加并修改
	public boolean addMovement(Movement m, Employee employee, int newDepartmentId, int newJobId);
}
