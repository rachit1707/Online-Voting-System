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
import com.project.voting.bean.AadharBean;

/**
 * Servlet implementation class ValidateEmail
 */
@WebServlet("/ValidateEmail")
public class ValidateEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateEmail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				HttpSession s = request.getSession(false);
				String user = request.getParameter("username");
				String pass = request.getParameter("password");
				
				if(user.equals("") || pass.equals(""))
				{
					System.out.println("hello");
					RequestDispatcher rd = request.getRequestDispatcher("ValidateVoter.jsp");
					rd.include(request, response);
				}
					
				AadharBean a = (AadharBean)s.getAttribute("aadhar");
				DAOClass d = new DAOClass();
				String code=d.getCode(a.getAdno());			
			
				if(Integer.parseInt(a.getAge())>=18)
				{
				if(d.SendEmail(a.getEmail(), user, pass, code)){
						boolean status = d.RegisterVoter(a,code,user,pass);
						if(status == true){
						RequestDispatcher rd = request.getRequestDispatcher("RegistrationSuccess.jsp");
						rd.forward(request, response);
					}
					else{
						RequestDispatcher rd = request.getRequestDispatcher("RegistrationError.jsp");
						rd.forward(request, response);
					}
					
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("RegistrationError.jsp");
					rd.forward(request, response);
				}
				}
				else
				{
					RequestDispatcher rd = request.getRequestDispatcher("RegistrationError.jsp");
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
