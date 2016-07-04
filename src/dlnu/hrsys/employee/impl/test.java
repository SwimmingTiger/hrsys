package dlnu.hrsys.employee.impl;

import java.sql.Date;

import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.util.DBUtil.DBException;

public class test {

	public static void main(String[] args) throws DBException {
		// TODO Auto-generated method stub
		Employee e = new Employee();
		e.setId(123);
		e.setName("wangzeyu");
		e.setSex_id(9);
		e.setBirth_date(Date.valueOf("1993-05-14"));
		e.setId_card("321");
		e.setDepartment_id(1);
		e.setJob_id(1);
		e.setHire_date(Date.valueOf("1993-05-14"));
		e.setJoin_date(Date.valueOf("1993-05-14"));
		e.setHire_type_id(9);
		e.setHr_type_id(8);
		e.setPolitics_status_id(9);
		e.setNationality_id(9);
		e.setNative_place("abc");
		e.setPhone("54645654");
		e.setEmail("3344fxsasa");
		e.setHeight_cm(178);
		e.setBlood_type_id(9);
		e.setMarital_status_id(9);
		e.setBirth_place("gxfgfdb");
		e.setDomicile_place("gfdsg");
		e.setEducation_status_id(9);
		e.setDegree_id(9);
		e.setGraduate_school("dlnu");
		e.setMajor_name("software");
		e.setGraduate_date(Date.valueOf("2016-07-01"));
		
		EmployeeDaoImpl edm = new EmployeeDaoImpl();
		System.out.println(edm.addEmployee(e));
	//	System.out.println(edm.findEmployeeByLike("gze"));
	//	System.out.println(edm.findEmployeebyId(128));
	}

}
