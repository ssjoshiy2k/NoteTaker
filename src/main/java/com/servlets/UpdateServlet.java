package com.servlets;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class UpdateServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public UpdateServlet()
	{
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{

		try
		{
			int noteID = Integer.parseInt(request.getParameter("noteID").trim());
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();

			Note note = s.get(Note.class, noteID);
			note.setAddedDate(new Date());
			note.setTitle(title);
			note.setContent(content);

			tx.commit();
			s.close();

			response.sendRedirect("all_notes.jsp");

		} catch (Exception e)
		{
			// TODO: handle exception
			e.getStackTrace();
		}

	}

}
