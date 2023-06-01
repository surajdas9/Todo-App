package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Todo;
import com.helper.FactoryProvider;

public class SaveNoteSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SaveNoteSevlet() {
        super();
        
    }
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		 try {
			 String title=req.getParameter("title");
			 String content=req.getParameter("content");
			 Todo todo= new Todo(title,content,new Date());
			// System.out.println(todo.getId()+" : "+todo.getTitle());
			 
			 //hibernate Save
		   Session s= FactoryProvider.getFactory().openSession();
		   Transaction t=s.beginTransaction();
		   s.save(todo);
		   t.commit();
			s.clear();
			PrintWriter out=resp.getWriter();
			out.print("<h1> Note added Sucessfully</h1>");
			resp.sendRedirect("allnotes.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
