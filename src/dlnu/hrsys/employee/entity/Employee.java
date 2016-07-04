package dlnu.hrsys.employee.entity;

import java.sql.Date;

public class Employee {
	private int id;
	private String name;
	private int sex_id;
	private Date birth_date;
	private String id_card;
	private int department_id;
	private int job_id;
	private Date hire_date;
	private Date join_date;
	private int hire_type_id;
	private int hr_type_id;
	private int politics_status_id;
	private int nationality_id;
	private String native_place;
	private String phone;
	private String email;
	private int height_cm;
	private int blood_type_id;
	private int marital_status_id;
	private String birth_place;
	private String domicile_place;
	private int education_status_id;
	private int degree_id;
	private String graduate_school;
	private String major_name;
	private Date graduate_date;
	
	
	
	public Employee(int id, String name, int sex_id, Date birth_date,
			String id_card, int department_id, int job_id, Date hire_date,
			Date join_date, int hire_type_id, int hr_type_id,
			int politics_status_id, int nationality_id, String native_place,
			String phone, String email, int height_cm, int blood_type_id,
			int marital_status_id, String birth_place, String domicile_place,
			int education_status_id, int degree_id, String graduate_school,
			String major_name, Date graduate_date) {
		super();
		this.id = id;
		this.name = name;
		this.sex_id = sex_id;
		this.birth_date = birth_date;
		this.id_card = id_card;
		this.department_id = department_id;
		this.job_id = job_id;
		this.hire_date = hire_date;
		this.join_date = join_date;
		this.hire_type_id = hire_type_id;
		this.hr_type_id = hr_type_id;
		this.politics_status_id = politics_status_id;
		this.nationality_id = nationality_id;
		this.native_place = native_place;
		this.phone = phone;
		this.email = email;
		this.height_cm = height_cm;
		this.blood_type_id = blood_type_id;
		this.marital_status_id = marital_status_id;
		this.birth_place = birth_place;
		this.domicile_place = domicile_place;
		this.education_status_id = education_status_id;
		this.degree_id = degree_id;
		this.graduate_school = graduate_school;
		this.major_name = major_name;
		this.graduate_date = graduate_date;
	}
	public Employee(){}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex_id() {
		return sex_id;
	}
	public void setSex_id(int sex_id) {
		this.sex_id = sex_id;
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
	public int getDepartment_id() {
		return department_id;
	}
	public void setDepartment_id(int department_id) {
		this.department_id = department_id;
	}
	public int getJob_id() {
		return job_id;
	}
	public void setJob_id(int job_id) {
		this.job_id = job_id;
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
	public int getHire_type_id() {
		return hire_type_id;
	}
	public void setHire_type_id(int hire_type_id) {
		this.hire_type_id = hire_type_id;
	}
	public int getHr_type_id() {
		return hr_type_id;
	}
	public void setHr_type_id(int hr_type_id) {
		this.hr_type_id = hr_type_id;
	}
	public int getPolitics_status_id() {
		return politics_status_id;
	}
	public void setPolitics_status_id(int politics_status_id) {
		this.politics_status_id = politics_status_id;
	}
	public int getNationality_id() {
		return nationality_id;
	}
	public void setNationality_id(int nationality_id) {
		this.nationality_id = nationality_id;
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
	public int getBlood_type_id() {
		return blood_type_id;
	}
	public void setBlood_type_id(int blood_type_id) {
		this.blood_type_id = blood_type_id;
	}
	public int getMarital_status_id() {
		return marital_status_id;
	}
	public void setMarital_status_id(int marital_status_id) {
		this.marital_status_id = marital_status_id;
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
	public int getEducation_status_id() {
		return education_status_id;
	}
	public void setEducation_status_id(int education_status_id) {
		this.education_status_id = education_status_id;
	}
	public int getDegree_id() {
		return degree_id;
	}
	public void setDegree_id(int degree_id) {
		this.degree_id = degree_id;
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
