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

package dlnu.hrsys.employee.leave;

import java.sql.Date;

public class Leave {
	
	private int id;  //记录编号
	private Date leave_time;  //离职时间
	private int leave_reason_id;  //离职类型
	private String destination;  //离职去向
	private int employee_id;  //员工编号
	private String name;  //姓名
	private String sex;  //性别
	private Date birth_date;  //生日
	private String id_card;  //身份证号
	private String department;  //部门名称
	private String job;  //岗位名称
	private Date hire_date;  //入职日期
	private	Date join_date;  //参加工作日期
	private String hire_type;  //用工形式
	private String hr_type;  //人员来源
	private	String politics_status;  //政治面貌
	private	String nationality;  //民族
	private	String native_place;  //籍贯
	private	String phone;  //电话	
	private	String email;  //电子邮件
	private	int height_cm;  //身高（厘米）
	private	String blood_type;  //血型
	private	String marital_status;  //婚姻状况
	private	String birth_place;  //出生地
	private	String domicile_place;  //户口所在地
	private	String education_status;  //最高学历
	private	String degree;  //最高学位
	private	String graduate_school;  //毕业院校
	private	String major_name;  //所学专业
	private Date graduate_date;  //毕业日期
	
	public Leave() {
		
	}
	
	public Leave(int id, Date leave_time, int leave_reason_id,
			String destination, int employee_id, String name,
			String sex, Date birth_date, String id_card,
			String department, String job, Date hire_date, Date join_date,
			String hire_type, String hr_type,	String politics_status,
			String nationality,	String native_place, String phone, String email,
			int height_cm,	String blood_type,	String marital_status,
			String birth_place,	String domicile_place,	String education_status,
			String degree,	String graduate_school,	String major_name,
			Date graduate_date) {
		
		super();
		this.id = id;
		this.leave_time = leave_time;
		this.leave_reason_id = leave_reason_id;
		this.destination = destination;
		this.employee_id = employee_id;
		this.name = name;
		this.sex = sex;
		this.birth_date = birth_date;
		this.id_card = id_card;
		this.department = department;
		this.job = job;
		this.hire_date = hire_date;
		this.join_date = join_date;
		this.hire_type = hire_type;
		this.hr_type = hr_type;
		this.politics_status = politics_status;
		this.nationality = nationality;
		this.native_place = native_place;
		this.phone = phone;
		this.email = email;
		this.height_cm = height_cm;
		this.blood_type = blood_type;
		this.marital_status = marital_status;
		this.birth_place = birth_place;
		this.domicile_place = domicile_place;
		this.education_status = education_status;
		this.degree = degree;
		this.graduate_school = graduate_school;
		this.major_name = major_name;
		this.graduate_date = graduate_date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Date getLeave_time() {
		return leave_time;
	}
	public void setLeave_time(Date leave_time) {
		this.leave_time = leave_time;
	}
	public int getLeave_reason_id() {
		return leave_reason_id;
	}
	public void setLeave_reason_id(int leave_reason_id) {
		this.leave_reason_id = leave_reason_id;
	}
	public String getDestination() {
		return destination;
	}
	public void setDestination(String destination) {
		this.destination = destination;
	}
	public int getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(int employee_id) {
		this.employee_id = employee_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public Date getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(Date birth_date) {
		this.birth_date = birth_date;
	}
	public String getId_card() {
		return id_card;
	}
	public void setId_card(String id_card) {
		this.id_card = id_card;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getHire_date() {
		return hire_date;
	}
	public void setHire_date(Date hire_date) {
		this.hire_date = hire_date;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	public String getHire_type() {
		return hire_type;
	}
	public void setHire_type(String hire_type) {
		this.hire_type = hire_type;
	}
	public String getHr_type() {
		return hr_type;
	}
	public void setHr_type(String hr_type) {
		this.hr_type = hr_type;
	}
	public String getPolitics_status() {
		return politics_status;
	}
	public void setPolitics_status(String politics_status) {
		this.politics_status = politics_status;
	}
	public String getNationality() {
		return nationality;
	}
	public void setNationality(String nationality) {
		this.nationality = nationality;
	}
	public String getNative_place() {
		return native_place;
	}
	public void setNative_place(String native_place) {
		this.native_place = native_place;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getHeight_cm() {
		return height_cm;
	}
	public void setHeight_cm(int height_cm) {
		this.height_cm = height_cm;
	}
	public String getBlood_type() {
		return blood_type;
	}
	public void setBlood_type(String blood_type) {
		this.blood_type = blood_type;
	}
	public String getMarital_status() {
		return marital_status;
	}
	public void setMarital_status(String marital_status) {
		this.marital_status = marital_status;
	}
	public String getBirth_place() {
		return birth_place;
	}
	public void setBirth_place(String birth_place) {
		this.birth_place = birth_place;
	}
	public String getDomicile_place() {
		return domicile_place;
	}
	public void setDomicile_place(String domicile_place) {
		this.domicile_place = domicile_place;
	}
	public String getEducation_status() {
		return education_status;
	}
	public void setEducation_status(String education_status) {
		this.education_status = education_status;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getGraduate_school() {
		return graduate_school;
	}
	public void setGraduate_school(String graduate_school) {
		this.graduate_school = graduate_school;
	}
	public String getMajor_name() {
		return major_name;
	}
	public void setMajor_name(String major_name) {
		this.major_name = major_name;
	}
	public Date getGraduate_date() {
		return graduate_date;
	}
	public void setGraduate_date(Date graduate_date) {
		this.graduate_date = graduate_date;
	}
}