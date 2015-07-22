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
 * Servlet implementation class userClServlet
 */
@WebServlet("/userClServlet")
public class userClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public userClServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		//get flag 
		String flag=request.getParameter("flag");
		
		if(flag.equals("fenye")){
			try {
				int pageNow=Integer.parseInt(request.getParameter("pageNow"));
				
				UserBeanCl ubc=new UserBeanCl();
				
				ArrayList al=ubc.getUserByPage(pageNow);
				int pageCount = ubc.getPageCount();
				
				request.setAttribute("result", al);
				request.setAttribute("pageCount", pageCount);
				
				request.getRequestDispatcher("wel.jsp").forward(request, response);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}else if(flag.equals("delete")){
			String userId=request.getParameter("userId");
			
			UserBeanCl ubc=new UserBeanCl();
			if(ubc.deleteUserById(Integer.parseInt(userId))){
				
				request.getRequestDispatcher("suc.jsp").forward(request, response);
				
			}else{
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
			
		
		}else if(flag.equals("addUser")){
			String name=request.getParameter("userName");
			String passwd=request.getParameter("password");
			String email=request.getParameter("email");
			String grade=request.getParameter("grade");
			
			UserBeanCl ubc=new UserBeanCl();
			
			if(ubc.addUser(name, passwd, email, grade)){
				
				request.getRequestDispatcher("suc.jsp").forward(request, response);
				
			}else{
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
			
		}else if(flag.equals("updateUser")){
			String Id=request.getParameter("userId");
			String name=request.getParameter("userName");
			String passwd=request.getParameter("password");
			String email=request.getParameter("email");
			String grade=request.getParameter("grade");
			
			UserBeanCl ubc=new UserBeanCl();
			
			if(ubc.updateUser(Id,name, passwd, email, grade)){
				
				request.getRequestDispatcher("suc.jsp").forward(request, response);
				
			}else{
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
			
		}
		else if(flag.equals("write off")){
				
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
