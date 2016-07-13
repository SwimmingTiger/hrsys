package dlnu.hrsys.employee.movement;

import java.sql.Date;

public class Movement {
	private int id;  //记录编号
	private int employee_id;  //员工编号
	private String front_movement_department;  //调转前部门
	private String movement_department;  //调转后部门
	private int movement_department_type;  //部门调转类型
	private String front_movement_job;  //调转前岗位
	private String movement_job;  //调转后岗位
	private int movement_job_type;  //岗位调转类型
	private String movement_reason;  //调转原因
	private Date movement_time;  //调转时间
	
	public Movement() {
		
	}
	
	public Movement(int id, int employee_id, String front_movement_department,
			String movement_department, int movement_department_type,
			String front_movement_job, String movement_job,
			int movement_job_type, String movement_reason,
			Date movement_time) {
		
		super();
		this.id = id;
		this.employee_id = employee_id;
		this.front_movement_department = front_movement_department;
		this.movement_department = movement_department;
		this.movement_department_type = movement_department_type;
		this.front_movement_job = front_movement_job;
		this.movement_job = movement_job;
		this.movement_job_type = movement_job_type;
		this.movement_reason = movement_reason;
		this.movement_time = movement_time;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getEmployee_id() {
		return employee_id;
	}

	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}

	public String getFront_movement_department() {
		return front_movement_department;
	}

	public void setFront_movement_department(String front_movement_department) {
		this.front_movement_department = front_movement_department;
	}

	public String getMovement_department() {
		return movement_department;
	}

	public void setMovement_department(String movement_department) {
		this.movement_department = movement_department;
	}

	public int getMovement_department_type() {
		return movement_department_type;
	}

	public void setMovement_department_type(int movement_department_type) {
		this.movement_department_type = movement_department_type;
	}

	public String getFront_movement_job() {
		return front_movement_job;
	}

	public void setFront_movement_job(String front_movement_job) {
		this.front_movement_job = front_movement_job;
	}

	public String getMovement_job() {
		return movement_job;
	}

	public void setMovement_job(String movement_job) {
		this.movement_job = movement_job;
	}

	public int getMovement_job_type() {
		return movement_job_type;
	}

	public void setMovement_job_type(int movement_job_type) {
		this.movement_job_type = movement_job_type;
	}

	public String getMovement_reason() {
		return movement_reason;
	}

	public void setMovement_reason(String movement_reason) {
		this.movement_reason = movement_reason;
	}

	public Date getMovement_time() {
		return movement_time;
	}

	public void setMovement_time(Date movement_time) {
		this.movement_time = movement_time;
	}
}
