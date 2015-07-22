package com.maosh.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.maosh.model.*;
import java.util.*;
/**
 * Servlet implementation class loginClServlet
 */
@WebServlet("/loginClServlet")
public class loginClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public loginClServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String u=request.getParameter("username");
		String p=request.getParameter("password");
		u=Tools.convertString(u);
		System.out.println("username"+u+"in servlet");
		
		UserBeanCl ubc=new UserBeanCl();
		UserBean ub=new UserBean();
		BlogBeanCl bbc=new BlogBeanCl();
		
		if(ubc.checkUser(u,p)){
			//转向跳转，效率低
			//response.sendRedirect("wel.jsp?user="+u);
			//转发
			
			//  get info for wel.jsp
		//	int pageNow=1;
			ArrayList al=bbc.getBlogByUser(u);
		//	int pageCount = bbc.getPageCount();
			ub = ubc.getUser(u);
			request.setAttribute("result", al);
			request.setAttribute("profile", ub.getProfile());
			
			request.getRequestDispatcher("homePage.jsp").forward(request, response);
			
		}else{
			//response.sendRedirect("login.jsp?errNo=2");
			
			request.getRequestDispatcher("login.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		this.doGet(request, response);
	}

}
