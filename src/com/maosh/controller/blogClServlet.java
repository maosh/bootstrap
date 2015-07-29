package com.maosh.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.maosh.model.BlogBeanCl;
import java.sql.Timestamp;

public class blogClServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public blogClServlet() {
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
		String user=request.getParameter("username");
		System.out.println("flag: "+flag+"in servlet");
		if(flag.equals("fenye")){
			try {
				int pageNow=Integer.parseInt(request.getParameter("pageNow"));
				
				BlogBeanCl bbc=new BlogBeanCl();
				
				ArrayList al=bbc.getBlogByUser(user);
				int pageCount = bbc.getPageCount();
				
				request.setAttribute("result", al);
				request.setAttribute("pageCount", pageCount);
				
				request.getRequestDispatcher("homepage.jsp").forward(request, response);
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
		}

		else if(flag.equals("deleteBlog")){
			String blogId=request.getParameter("blogId");
			
			BlogBeanCl bbc=new BlogBeanCl();
			if(bbc.deleteBlogById(Integer.parseInt(blogId))){
				
				request.getRequestDispatcher("suc.jsp").forward(request, response); 
				
			}else{
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
			
		
		}

		else if(flag.equals("addBlog")){
			
			String author=request.getParameter("author");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			Timestamp d = new Timestamp(System.currentTimeMillis()); 
			System.out.println("author: "+author+"content: "+ content);
			BlogBeanCl bbc=new BlogBeanCl();
			int id=0;
			id=bbc.addBlog(author, title, content,d);
			System.out.println(id);
			if(0 != id){
			//	request.setAttribute("blogid", (String)Integer.toString(id));
			//	request.getRequestDispatcher("suc.jsp").forward(request, response);
				
				//JSONStringer stringer = new JSONStringer();  
				//response.getWriter().write(Integer.toString(id));  
			//	response.setContentType("text/html; charset=UTF-8");  
				request.setAttribute("id", id);
				request.setAttribute("ts", d);
				request.getRequestDispatcher("newPost.jsp").forward(request, response); 
				
				
			}else{
				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
			
		}else if(flag.equals("updateBlog")){
			String blogId=request.getParameter("blogId");
			String author=request.getParameter("author");
			String title=request.getParameter("title");
			String content=request.getParameter("content");
			
			BlogBeanCl bbc=new BlogBeanCl();
			
			if(bbc.updateBlogById(Integer.parseInt(blogId),author, title, content)){
				
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
