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
import com.project.voting.bean.VoterBean;

/**
 * Servlet implementation class Voting
 */
@WebServlet("/Voting")
public class Voting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Voting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String adno = request.getParameter("choice");
				
				HttpSession s = request.getSession(false);
				VoterBean v = (VoterBean) s.getAttribute("voter");
				
				DAOClass d = new DAOClass();
				boolean status = d.CalcVote(adno,v.getVoterAdno());
				if(status){
					RequestDispatcher rd = request.getRequestDispatcher("VotingSuccess.jsp");
					rd.forward(request, response);
				}
				else{
					RequestDispatcher rd = request.getRequestDispatcher("VotingError.jsp");
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
