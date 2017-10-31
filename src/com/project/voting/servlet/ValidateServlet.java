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
 * Servlet implementation class ValidateServlet
 */
@WebServlet("/ValidateServlet")
public class ValidateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String adno = request.getParameter("adno");
				
				
				if(adno.equals(""))
				{
					RequestDispatcher rd = request.getRequestDispatcher("RegisterVoter.jsp");
					rd.forward(request, response);
				}
				
				DAOClass d = new DAOClass();
				AadharBean a = d.getVoter(adno);
				HttpSession s = request.getSession(true);
				s.setAttribute("aadhar",a);
				if(a==null){
					RequestDispatcher rd = request.getRequestDispatcher("NoDataFound.jsp");
					rd.include(request, response);
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("ValidateVoter.jsp");
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
