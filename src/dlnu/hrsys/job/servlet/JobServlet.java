package dlnu.hrsys.job.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dlnu.hrsys.employee.impl.EmployeeDaoImpl;
import dlnu.hrsys.job.dao.JobDAO;
import dlnu.hrsys.job.entity.Job;
import dlnu.hrsys.job.factory.JobDAOFactory;
import dlnu.hrsys.util.DBUtil.DBException;

/**
 * Servlet implementation class JobServlet
 */
@WebServlet("/JobServlet")
public class JobServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public JobServlet() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}//doGet

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stubrequest.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.setCharacterEncoding("UTF-8");
		//解决提交信息中文乱码
		request.setCharacterEncoding("UTF-8");
		String flag = request.getParameter("flag");
		System.out.println(flag);
		//
		List list = null;
		PrintWriter out = response.getWriter();
		
		
		try {
			System.out.println("into servlet");
			JobDAO jd = JobDAOFactory.getJobDAO();
			
			switch(flag){
			//添加岗位
			case "add":
				try {
				System.out.println("this is add job");
				String name = request.getParameter("name");
				System.out.println(name);
				int type_id = Integer.valueOf(request.getParameter("type_id"));
				int size = 0;
					if (request.getParameter("size").length() > 0) {
						Integer.valueOf(request.getParameter("size"));
					}

					if (name != null && name.length() > 0) {
						Job j = new Job(name, type_id, size);
						boolean index = jd.addJob(j);
						System.out.println(index);
						if (index) {

							response.setContentType("text/html");
							response.setCharacterEncoding("UTF-8");
							PrintWriter out1 = response.getWriter();
							out1.println("<script type='text/javascript'>"
									+ "alert('添加成功！');"
									+ "location='JobServlet?flag=find';"
									+ "</script>");
							out1.println("</HTML>");
							out1.flush();
							out1.close();

						} else {
							response.setContentType("text/html");
							response.setCharacterEncoding("UTF-8");
							PrintWriter out1 = response.getWriter();
							out1.println("<script type='text/javascript'>"
									+ "alert('添加失败！');"
									+ "location='job/job.jsp';"
									+ "</script>");
							out1.println("</HTML>");
							out1.flush();
							out1.close();

						}
					} else {
						out.println("<script>alert('岗位名称不能为空！');history.back();</script>");
					}
				} catch (IllegalArgumentException ex) {
					out.println("<script>alert('数字或日期格式不正确！');history.back();</script>");
				}
				break;
				//修改记录
			case "mod":
				System.out.println("this is mod job");
				//List mod_al = jd.findJobAll();
				list = jd.findJobAll();
				//request.setAttribute("allJob", mod_al);
				request.setAttribute("allJob", list);
				request.getRequestDispatcher("job/searchjob.jsp").forward(request,response);
				
				break;
				//删除记录
			case "del":
				//得到当前行，对这行执行delete
				System.out.println("this is del job");
				int id = Integer.valueOf(request.getParameter("uid"));
				boolean bool = jd.delJob(id);
				System.out.println(bool);
				if(bool){
					
				//	List al = null;
					list = jd.findJobAll();
					request.setAttribute("allJob", list);
					request.getRequestDispatcher("job/searchjob.jsp").forward(request,response);
				}else{
					response.sendRedirect("job/error.jsp");	
					
				}
				break;
				//从主页进入直接显示全部
			case "all":
				System.out.println("this is all job");
			//	List al = null;
				list = jd.findJobAll();
				request.setAttribute("allJob", list);
				request.getRequestDispatcher("job/searchjob.jsp").forward(request,response);
				break;
			//查找
			case "find":
				
				System.out.println("this is find job");
				String f_name = request.getParameter("name");
				
				int f_type_id = 0;
				
				try {
					f_type_id = Integer.valueOf(request.getParameter("type_id"));
				} catch (Exception ex) {
					//ignore
				}
				
				//String f_id = request.getParameter("id");
				
				System.out.println(f_type_id);
				//System.out.println(f_id);
				System.out.println(f_name);
					System.out.println("岗位类型单查");
					List t_al = null;
					t_al = jd.searchJobs(f_name, f_type_id);
					if(t_al!=null && !t_al.isEmpty()){
					request.setAttribute("allJob",t_al);
					request.getRequestDispatcher("job/searchjob.jsp").forward(request,response);
				}else{
					//输入中文出现乱码，以致查询不到（已解决）
					//若查询内容不存在则给出提示
						response.setContentType("text/html");
						response.setCharacterEncoding("UTF-8");
						PrintWriter out1 = response.getWriter();
						out1.println("<script type='text/javascript'>"
								+ "alert('您查询的结果不存在！');"
								+ "location='JobServlet?flag=find';"
								+ "</script>");
						out1.println("</HTML>");
						out1.flush();
						out1.close();
					
					}
				
				break;
			//确认保存	
			case "upd":
				System.out.println("this is upd job");
				String u_name = request.getParameter("name");
				System.out.println(u_name);
				int u_type_id = Integer.valueOf(request.getParameter("type_id"));
				int u_size = Integer.valueOf(request.getParameter("size"));
				int u_id = Integer.valueOf(request.getParameter("id"));
				Job u_j = new Job(u_id,u_name,u_type_id,u_size);
			//	System.out.println("job name:"+name+"type_id:"+type_id+"size:"+size);
				boolean u_index = jd.updJob(u_j );
				System.out.println(u_index);
				if(u_index){
					
					//List upd_al = jd.findJobAll();
					//request.setAttribute("allJob", upd_al);
					list = jd.findJobAll();
					request.setAttribute("allJob", list);
					request.getRequestDispatcher("job/searchjob.jsp").forward(request,response);
				}else{
					response.sendRedirect("job/error.jsp");	
					
				}
				break; 
			case"find_emp":
				EmployeeDaoImpl edm = new EmployeeDaoImpl();
				int job_id = Integer.valueOf(request.getParameter("uid"));
				 list=edm.findEmployeeByJobId(job_id);
				 if(list!=null && !list.isEmpty()){
					 Job job = jd.findJobById(job_id);
					 request.setAttribute("job", job);
					 request.setAttribute("allEmp", list);
					 System.out.println(list);
					 request.getRequestDispatcher("job/Einfo.jsp").forward(request,response);
					
					}else{
						//输入中文出现乱码，以致查询不到（已解决）
						//若查询内容不存在则给出提示
							response.setContentType("text/html");
							response.setCharacterEncoding("UTF-8");
							PrintWriter out1 = response.getWriter();
							out1.println("<script type='text/javascript'>"
									+ "alert('该岗位下没有员工！');"
									+ "location='JobServlet?flag=find';"
									+ "</script>");
							out1.println("</HTML>");
							out1.flush();
							out1.close();
						
						}
					
				
				break;
			default:
				System.out.println("没整明白吧！");
				break;
		}} catch (DBException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
	}
	
	}
