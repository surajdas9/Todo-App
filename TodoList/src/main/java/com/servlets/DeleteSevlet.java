package com.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entites.Todo;
import com.helper.FactoryProvider;


public class DeleteSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DeleteSevlet() {
        super();
        
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			
			int noteId=Integer.parseInt(request.getParameter("note_id").trim());
			
			Session s= FactoryProvider.getFactory().openSession();
			Transaction t=s.beginTransaction();
			Todo todo=(Todo)s.get(Todo.class, noteId);
			s.delete(todo);
			t.commit();
			s.close();
			response.sendRedirect("allnotes.jsp");
			
		}catch (Exception e) {
		
		}
	}

	
}
