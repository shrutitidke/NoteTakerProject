package com.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

@WebServlet("/UpdateServlet")
public class UpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			int noteId = Integer.parseInt(request.getParameter("noteId"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			 Session s = FactoryProvider.getFactory().openSession();
			Transaction  tx = s.beginTransaction();
			    Note note = s.get(Note.class,noteId);
		        note.setTitle(title);
		        note.setContent(content);
		        note.setAddedDate(new Date());
			    tx.commit();
			    s.close();
			    
			    response.sendRedirect("view_all.jsp");

		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}

}
