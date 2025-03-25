package com.servlets;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/SaveNoteServlet")
public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		try {
			String title = request.getParameter("title");
			String content =request.getParameter("content");
			
			Note note = new Note(title,content,new Date());
			
		    Session session =  FactoryProvider.getFactory().openSession();
		    Transaction tx = session.beginTransaction();
		    session.persist(note);	    
		    tx.commit();
		    session.close();
		    response.setContentType("text/html");
		    PrintWriter out = response.getWriter();
		    out.println("<h1 style ='text-align:center'>Note is added successfully</h1>");
		    out.println("<h1 style ='text-align:center'><a href='view_all.jsp'>view all notes</h1>");
		    
//		    RequestDispatcher rd = request.getRequestDispatcher("/view_all.jsp");
//			rd.include(request,response);
//			
					
		} catch (Exception e) {
			 e.printStackTrace();
		}
	}

}
