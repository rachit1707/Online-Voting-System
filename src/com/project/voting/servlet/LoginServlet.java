package com.project.voting.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.project.voting.DAO.DAOClass;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
					
		
					int x=0;
					String username = request.getParameter("username");
					String password = request.getParameter("password");
					String code = request.getParameter("code");
					
					if(username.equals("")||password.equals("") || code.equals(""))
							{
						
						RequestDispatcher rd = request.getRequestDispatcher("LoginVoter.jsp");
						rd.forward(request, response);
							}
					DAOClass d = new DAOClass();
					 x = d.Login(username, password,code);
					 System.out.println("val"+x);
					if(x==1){
						
						HttpSession s = request.getSession(true);
						s.setAttribute("user", username);
				
						
						HttpSession s1 = request.getSession(true);
						s1.setAttribute("pass",password);
						RequestDispatcher rd = request.getRequestDispatcher("VoterPannel.jsp");
						rd.forward(request, response);
					}
					else if(x==2){
						HttpSession s = request.getSession();
						s.setAttribute("user", username);
						HttpSession s1 = request.getSession();
						s1.setAttribute("pass",password);
						RequestDispatcher rd = request.getRequestDispatcher("AdminCheck.jsp");
						rd.forward(request, response);
					}
					else{
						RequestDispatcher rd = request.getRequestDispatcher("LoginError.jsp");
						rd.forward(request, response);
					}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
