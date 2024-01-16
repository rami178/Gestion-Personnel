package net.personnel.usermanagement.web;


import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.personnel.usermanagement.dao.LoginDao;
import net.personnel.usermanagement.dao.PersonnelDOA;
import net.personnel.usermanagement.dao.UserDao;
import net.personnel.usermanagement.model.LoginBean;
import net.personnel.usermanagement.model.Personnel;
import net.personnel.usermanagement.model.User;


/**
 * ControllerServlet.java
 * This servlet acts as a page controller for the application, handling all
 * requests from the user.
 * @email Ramesh Fadatare
 */

@WebServlet("/")
public class PersonnelServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PersonnelDOA personnelDOA;
	private LoginDao loginDao;
	private UserDao userDao;

	public void init() {
		personnelDOA = new PersonnelDOA();
		loginDao = new LoginDao();
		userDao = new UserDao();


	}

	

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		doGet(request, response);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getServletPath();


		try {
			switch (action) {
			case "/":
				authenticate(request, response);
				break;
			case "/fr":
				authenticateFr(request, response);
				break;
			case "/listF":
				listPersonnelFr(request, response);
				break;
			case "/newF":
				showNewFormF(request, response);
				break;
			case "/new":
				showNewForm(request, response);
				break;
			case "/insert":
				insertPersonnel(request, response);
				break;
			case "/delete":
				deletePersonnel(request, response);
				break;
			case "/deleteF":
				deletePersonnelF(request, response);
				break;
			case "/editF":
				showEditFormF(request, response);
				break;
			case "/edit":
				showEditForm(request, response);
				break;
			case "/update":
				updatePersonnel(request, response);
				break;
			default:
				listPersonnel(request, response);
				break;
			}
		} catch (SQLException ex) {
			throw new ServletException(ex);
		}
	}	
	private void listPersonnel(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		List<Personnel> listPersonnel = personnelDOA.selectAllPersonnels();
		request.setAttribute("listPersonnel", listPersonnel);
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-list.jsp");
		dispatcher.forward(request, response);
	}
	private void listPersonnelFr(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		List<Personnel> listPersonnel = personnelDOA.selectAllPersonnels();
		request.setAttribute("listPersonnel", listPersonnel);
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-list-fr.jsp");
		dispatcher.forward(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-form.jsp");
		dispatcher.forward(request, response);
	}
	private void showNewFormF(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-formF.jsp");
		dispatcher.forward(request, response);
	}

	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		Personnel existingPersonnel = personnelDOA.selectPersonnel(mat);
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-form.jsp");
		request.setAttribute("personnel", existingPersonnel);
		dispatcher.forward(request, response);

	}
	private void showEditFormF(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		Personnel existingPersonnel = personnelDOA.selectPersonnel(mat);
		RequestDispatcher dispatcher = request.getRequestDispatcher("personnel-formF.jsp");
		request.setAttribute("personnel", existingPersonnel);
		dispatcher.forward(request, response);

	}


	private void insertPersonnel(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		String nom = request.getParameter("nom");
		String grade = request.getParameter("grade");
		String prison = request.getParameter("prison");
		String email = request.getParameter("email");
		int tel = Integer.parseInt(request.getParameter("tel"));
		String adresse = request.getParameter("adresse");
		Personnel newPersonnel = new Personnel(mat,nom,grade,prison, email, tel,adresse);
		personnelDOA.insertPersonnel(newPersonnel);
		response.sendRedirect("list");
	}

	private void updatePersonnel(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		String nom = request.getParameter("nom");
		String grade = request.getParameter("grade");
		String prison = request.getParameter("prison");
		String email = request.getParameter("email");
		int tel = Integer.parseInt(request.getParameter("tel"));
		String adresse = request.getParameter("adresse");

		Personnel personnelUpdate = new Personnel(mat,nom,grade,prison, email, tel,adresse);
		personnelDOA.updatePersonnel(personnelUpdate);
		response.sendRedirect("list");
	}

	private void deletePersonnel(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		personnelDOA.SupprimerPersonnel(mat);
		response.sendRedirect("list");

	}
	private void deletePersonnelF(HttpServletRequest request, HttpServletResponse response) 
			throws SQLException, IOException {
		request.setCharacterEncoding("UTF-8");
		int mat = Integer.parseInt(request.getParameter("mat"));
		personnelDOA.SupprimerPersonnel(mat);
		response.sendRedirect("listF");

	}

	private void authenticate(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			if (loginDao.validate(loginBean)) {
			
				listPersonnel(request, response);
				
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				response.sendRedirect("login.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	private void authenticateFr(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException, SQLException {
		request.setCharacterEncoding("UTF-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		LoginBean loginBean = new LoginBean();
		loginBean.setUsername(username);
		loginBean.setPassword(password);

		try {
			if (loginDao.validate(loginBean)) {
			
				listPersonnelFr(request, response);
				
			} else {
				HttpSession session = request.getSession();
				session.setAttribute("user", username);
				response.sendRedirect("login-fr.jsp");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

	}
	
	
	
}
