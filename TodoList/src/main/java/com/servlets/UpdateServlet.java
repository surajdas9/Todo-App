package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Todo;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public UpdateServlet() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
		String title=request.getParameter("title");
		String content=request.getParameter("content");
		int noteid=Integer.parseInt(request.getParameter("noteId"));
		
		Session s=FactoryProvider.getFactory().openSession();
		Transaction t=s.beginTransaction();
		Todo todo=s.get(Todo.class, noteid);
		if(todo!=null) {
			todo.setTitle(title);
			todo.setContent(content);
			todo.setAddedDate(new Date());
			s.update(todo);
			t.commit();
			s.close();
			response.sendRedirect("allnotes.jsp");
		}
	}catch (Exception e) {
		e.printStackTrace();
	}
	}

}
