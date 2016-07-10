package dlnu.hrsys.department.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dlnu.hrsys.department.dao.DepartmentsDAO;
import dlnu.hrsys.department.entity.Department;
import dlnu.hrsys.department.factory.departmentsDAOFactory;
import dlnu.hrsys.util.DBUtil.DBException;

@WebServlet(name="DepartmentsServlet", urlPatterns="/servlet/departmentsServlet.action")

public class departmentsServlet extends HttpServlet {

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
		
	//	HttpSession session = request.getSession(true);
		String flag = request.getParameter("flag");

		int parent_id = 0;
		try {
			parent_id = Integer.valueOf(request.getParameter("parent_id"));
		} catch (Exception ex) {
			// ignore
		}

		try {
			
			System.out.print("into servlet    ");
				DepartmentsDAO dD = departmentsDAOFactory.getsDepartmentsDAO();
				switch(flag)
				{
					case "allDepartments":
					{System.out.print("into all    ");

						List all = dD.findAll(parent_id);
						request.setAttribute("alldepartments", all);
						request.getRequestDispatcher("/departments/departmentTable.jsp").forward(
								request, response);
						break;
					}
					case "add":
					{System.out.print("into add   ");
						String dname = request.getParameter("name");
						int dtypeId = Integer.valueOf(request.getParameter("typeId"));
						String dphone = request.getParameter("phone");
						String dfax = request.getParameter("fax");
						String ddesc = request.getParameter("des");
						int dparentId = 0;
						Date ddate = Date.valueOf(request.getParameter("date"));
						try {
							dparentId = Integer.valueOf(request.getParameter("parentId"));
						}
						catch (Exception ex) {
							// ignore
						}
						
						
						Department d = new Department();
						d.setName(dname);
						d.setTypeId(dtypeId);
						d.setPhone(dphone);
						d.setFax(dfax);
						d.setDesc(ddesc);
						d.setParentId(dparentId);
						d.setFoundDate(ddate);
						
						boolean bool = dD.addDepartment(d);
						
						if(bool)
						{
							//重定向 转入成功页面
							System.out.print("success");
							request.getRequestDispatcher("../departments/addDepartmentPage.jsp").forward(
									request, response);
						}else{
							//转发 
							System.out.print("fail");
						}
						
						break;
					}
					case "del":
					{
						System.out.print("into del   ");
						
						Integer uid = Integer.valueOf(request.getParameter("uid"));

						System.out.print("get uid: ");		
						System.out.print(uid);
						
						boolean bool = dD.delDepartment(uid);
						
						if(bool)
						{
							//重定向 转入成功页面
							System.out.print("success");
							List all = new ArrayList();
							all = dD.findAll(parent_id);
							request.setAttribute("alldepartments", all);
							request.getRequestDispatcher("/departments/departmentTable.jsp").forward(
									request, response);
						}else{
							//转发 
							System.out.print("fail");
						}
						
						break;
					}
					case "upd":
					{
						System.out.print("this is upd ");

						int did = Integer.valueOf(request.getParameter("id"));

						Department d = departmentsDAOFactory.getsDepartmentsDAO().findDepById(did);

						String dname = request.getParameter("name");
						int dtypeId = Integer.valueOf(request.getParameter("typeId"));
						String dphone = request.getParameter("phone");
						String dfax = request.getParameter("fax");
						String ddesc = request.getParameter("desc");
						Date ddate = Date.valueOf(request.getParameter("foundDate"));

						//根本没有修改parent_id的界面
						/*int dparentId = 0;
						try {
							dparentId = Integer.valueOf(request.getParameter("parentId"));
						}
						catch (Exception ex) {
							// ignore
						}*/
						
						d.setId(did);
						d.setName(dname);
						d.setTypeId(dtypeId);
						d.setPhone(dphone);
						d.setFax(dfax);
						d.setDesc(ddesc);
						//d.setParentId(dparentId);
						d.setFoundDate(ddate);
						
						System.out.print("   id is: ");
						System.out.print(did);
						
						boolean bool = dD.chaDepartment(d);
						
						if(bool)
						{
							List all = new ArrayList();
							all = dD.findAll(parent_id);
							request.setAttribute("alldepartments", all);
							request.getRequestDispatcher("/departments/departmentTable.jsp").forward(
									request, response);
						}else {
							
							System.out.print("there is a fail in your changing");
						}
						
						break;
					}
					case "seek":
					{
						//SELECT `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date` FROM `department` WHERE name='修改' and type_id=38
						// WHERE name='修改' and type_id=38
						String name = request.getParameter("name");
						int type = Integer.valueOf(request.getParameter("type"));
						String sql = "SELECT `id`, `name`, `type_id`, `phone`, `fax`, `desc`, `parent_id`, `birth_date` FROM `department` where 1 ";
						String sql2 = null;
						String sql3 = null;
						String where = null;

						if (name != null)
						{
							sql2 = " and name like "+ "'%" + name + "%'";
							sql = sql + sql2;
						}
						if (type != 0)
						{
							sql3 = " and type_id=" + type;
							sql = sql + sql3;
						}

						System.out.print(sql);
						
						List all = new ArrayList();
						all = dD.findBySql(sql);	
						
						request.setAttribute("alldepartments", all);
						request.getRequestDispatcher("/departments/departmentTable.jsp").forward(
								request, response);
						
						break;
					}
					default:
					{
						List all = new ArrayList();
						all = dD.findAll(parent_id);
						request.setAttribute("alldepartments", all);
						request.getRequestDispatcher("/departments/departmentTable.jsp").forward(
								request, response);
					}
			}
		} catch (DBException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
