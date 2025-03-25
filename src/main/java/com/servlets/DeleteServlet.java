package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


import java.io.IOException;

import org.hibernate.Session;
import org.hibernate.Transaction;
import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/DeleteServlet")
public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("noteId"));
			 Session s = FactoryProvider.getFactory().openSession();
			Transaction  tx = s.beginTransaction();
			    Note note = s.get(Note.class, noteId);
		        s.remove(note);
			    tx.commit();
			    s.close();
			    
			    response.sendRedirect("view_all.jsp");

		}
		catch (Exception e) {
			e.printStackTrace();
		}
	
	}

}
