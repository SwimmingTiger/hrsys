package dlnu.hrsys.employee.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.DataFormatException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlnu.hrsys.employee.entity.Employee;
import dlnu.hrsys.employee.impl.EmployeeDaoImpl;
import dlnu.hrsys.job.entity.Job;
import dlnu.hrsys.job.factory.JobDAOFactory;
import dlnu.hrsys.util.DBUtil.DBException;
import dlnu.hrsys.util.TypeUtil;

@WebServlet(name="EmployeeServlet", urlPatterns="/EmployeeServlet")
public class EmployeeServlet extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		EmployeeDaoImpl edm;
		int probation_status;
		
		try {
			edm = new EmployeeDaoImpl();

		Employee e;
		String flag = request.getParameter("flag");

		  if("add".equals(flag)){ 
			  
			  if(request.getParameter("birth_date").length() <= 0 || request.getParameter("hire_date").length() <= 0 || request.getParameter("join_date").length() <= 0){
				  //JOptionPane.showMessageDialog(null, "必填项不能为空！");
				  //request.getRequestDispatcher("/employee/add.jsp").forward(request,response);
				  out.println("<script>alert('必填项不能为空！');history.back();</script>");
			  }else {
				  try {
					  //int id=Integer.valueOf(request.getParameter("id"));
					  String name = request.getParameter("name");
					  int sex_id = Integer.valueOf(request.getParameter("sex_id"));
					  Date birth_date = Date.valueOf(request.getParameter("birth_date"));
					  String id_card = request.getParameter("id_card");
					  int department_id = Integer.valueOf(request.getParameter("department_id"));
					  int job_id = Integer.valueOf(request.getParameter("job_id"));
					  Date hire_date = Date.valueOf(request.getParameter("hire_date"));
					  Date join_date = Date.valueOf(request.getParameter("join_date"));
					  int hire_type_id = Integer.valueOf(request.getParameter("hire_type_id"));
					  int hr_type_id = Integer.valueOf(request.getParameter("hr_type_id"));
					  int politics_status_id = Integer.valueOf(request.getParameter("politics_status_id"));
					  int nationality_id = Integer.valueOf(request.getParameter("nationality_id"));
					  String native_place = request.getParameter("native_place");
					  String phone = request.getParameter("phone");
					  String email = request.getParameter("email");
					  int height_cm = 0;
					  if (request.getParameter("height_cm").length() > 0) {
						  height_cm = Integer.valueOf(request.getParameter("height_cm"));
					  }
					  int blood_type_id = Integer.valueOf(request.getParameter("blood_type_id"));
					  int marital_status_id = Integer.valueOf(request.getParameter("marital_status_id"));
					  String birth_place = request.getParameter("birth_place");
					  String domicile_place = request.getParameter("domicile_place");
					  int education_status_id = Integer.valueOf(request.getParameter("education_status_id"));
					  int degree_id = Integer.valueOf(request.getParameter("degree_id"));
					  String graduate_school = request.getParameter("graduate_school");
					  String major_name = request.getParameter("major_name");
					  Date graduate_date = null;
					  if (request.getParameter("graduate_date").length() > 0) {
						  graduate_date = Date.valueOf(request.getParameter("graduate_date"));
					  }

					  e = new Employee(1, name, sex_id, birth_date, id_card, department_id, job_id, hire_date, join_date, hire_type_id, hr_type_id,
							  politics_status_id, nationality_id, native_place, phone, email, height_cm, blood_type_id, marital_status_id, birth_place,
							  domicile_place, education_status_id, degree_id, graduate_school, major_name, graduate_date);
			  
			  /*e=new Employee(1,name,1,birth_date,id_card,1,1,hire_date,join_date,9,9,
			  8,7,native_place,phone,email,height_cm,6,5,birth_place,
			  domicile_place,4,3,graduate_school,major_name,graduate_date);*/

					  //员工超编检查
					  int empSize = edm.getEmployeeSizeByJobId(e.getJob_id());
					  Job job = JobDAOFactory.getJobDAO().findJobById(e.getJob_id());

					  if (job.getSize() > 0 && empSize >= job.getSize()) {
						  out.println("<script>alert('该岗位员工人数超过限制！');history.back();</script>");
					  } else {
						  boolean bool = edm.addEmployee(e);
						  if (bool) {
							  request.setAttribute("Employee", e);
							  request.getRequestDispatcher("/index.jsp").forward(request, response);
						  }
					  }
				  } catch (IllegalArgumentException ex) {
					  out.println("<script>alert('数字或日期格式不正确！');history.back();</script>");
				  }
			  }
		  }
		  
		  if("find".equals(flag)){
			  List list = new ArrayList();		
			  list = edm.findEmployeeByHire_Id(4);
			  request.setAttribute("emp_linshi", list);
			  request.getRequestDispatcher("/employee/probation.jsp").forward(request,response); 
		  }

			if("list_all".equals(flag)){
				List list = new ArrayList();
				list = edm.findEmployeeByHire_Id(3);
				request.setAttribute("emp_list", list);
				request.getRequestDispatcher("/employee/list.jsp").forward(request,response);
			}

			if("search_all".equals(flag) || "search_probation".equals(flag)){
				int employee_id = 0;
				String name = null;

				try {
					employee_id = Integer.valueOf(request.getParameter("employee"));
				} catch (Exception ex) {
					name = request.getParameter("employee");
				}

				int department_id = 0;
				try {
					department_id = Integer.valueOf(request.getParameter("department_id"));
				} catch (Exception ex) {
					//ignore
				}

				int job_id = 0;
				try {
					job_id = Integer.valueOf(request.getParameter("job_id"));
				} catch (Exception ex) {
					//ignore
				}

				Date join_date1 = null;
				try {
					join_date1 = Date.valueOf(request.getParameter("join_date1"));
				} catch (Exception ex) {
					//ignore
				}

				Date join_date2 = null;
				try {
					join_date2 = Date.valueOf(request.getParameter("join_date2"));
				} catch (Exception ex) {
					//ignore
				}




				if ("search_all".equals(flag)) {
					List<Employee> al = edm.findEveryThing(employee_id, name, department_id, job_id, join_date1, join_date2, TypeUtil.TYPE_NORMAL_EMPLOYEE);
					request.setAttribute("emp_list", al);
					request.getRequestDispatcher("/employee/list.jsp").forward(request, response);
				} else {
					List<Employee> al = edm.findEveryThing(employee_id, name, department_id, job_id, join_date1, join_date2, TypeUtil.TYPE_PROBATION_EMPLOYEE);
					request.setAttribute("emp_linshi", al);
					request.getRequestDispatcher("/employee/probation.jsp").forward(request, response);
				}
			}
		  
		  if("update".equals(flag)) {
              int id2 = Integer.parseInt(request.getParameter("id"));
              probation_status = Integer.valueOf(request.getParameter("probation_status")).intValue();

			  if (probation_status == 5) {
				  response.sendRedirect("leave/LeaveAdd.jsp?employee_id=" + id2);
			  } else {
				  edm.updEmployee(id2, probation_status);
				  List list1 = edm.findEmployeeByHire_Id(4);
				  request.setAttribute("emp_linshi", list1);
				  request.getRequestDispatcher("/employee/probation.jsp").forward(request, response);
			  }
          }

			if("detail".equals(flag)) {
				int id = Integer.parseInt(request.getParameter("id"));
				Employee employee = edm.findEmployeeById(id);
				request.setAttribute("employee", employee);
				request.getRequestDispatcher("/employee/DetailInfo.jsp").forward(request, response);
			}

		} catch (DBException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}	
		
	}

}
