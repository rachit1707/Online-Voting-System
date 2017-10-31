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
 * Servlet implementation class AddAadhar
 */
@WebServlet("/AddAadhar")
public class AddAadhar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddAadhar() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 AadharBean a = (AadharBean) request.getAttribute("aadhar");
		 DAOClass d = new DAOClass();
		 boolean status = d.addAadhar(a);
		 if(status){
			 	RequestDispatcher rd = request.getRequestDispatcher("AddSuccess.jsp");
			 	rd.forward(request, response);
		 }
		 else{
			 	RequestDispatcher rd = request.getRequestDispatcher("AddError.jsp");
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
