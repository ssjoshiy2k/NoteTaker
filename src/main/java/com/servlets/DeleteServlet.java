package com.servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet
{
	private static final long serialVersionUID = 1L;

	public DeleteServlet()
	{
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		try
		{
			int note_id = Integer.parseInt(request.getParameter("note_id").trim());

			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			Note n = (Note) s.get(Note.class, note_id);
			s.delete(n);
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
