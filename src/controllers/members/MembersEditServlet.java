package controllers.members;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.Member;
import utils.DBUtil;

/**
 * Servlet implementation class MembersEditServlet
 */
@WebServlet("/members/edit")
public class MembersEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public MembersEditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	    EntityManager em = DBUtil.createEntityManager();

        Member m = em.find(Member.class, Integer.parseInt(request.getParameter("id")));

        em.close();

        request.setAttribute("member", m);
        request.setAttribute("_token", request.getSession().getId());
        request.getSession().setAttribute("member_id", m.getId());

        RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/members/edit.jsp");
        rd.forward(request, response);
	}

}
