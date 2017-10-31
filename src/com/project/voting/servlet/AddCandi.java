package com.project.voting.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.project.voting.DAO.DAOClass;
import com.project.voting.bean.AadharBean;

/**
 * Servlet implementation class AddCandi
 */
@WebServlet("/AddCandi")
public class AddCandi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddCandi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String adno = request.getParameter("adno");
				if(adno.equals("")){
					RequestDispatcher rd = request.getRequestDispatcher("AdminCheck.jsp");
					rd.forward(request, response);
					
				}
				DAOClass d = new DAOClass();
				AadharBean a = d.addCandi(adno);
				request.setAttribute("candi",a);
				RequestDispatcher rd = request.getRequestDispatcher("ValidateCandi.jsp");
				rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
