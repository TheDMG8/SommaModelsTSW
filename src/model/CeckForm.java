package model;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/form.html")
public class CeckForm extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String errorForm="";
			String name= request.getParameter("name");
			String surname=request.getParameter("surname");
			
			if(name == null|| name.trim().equals("")) {
				errorForm+="Insert name<br>";
			}else {
				request.setAttribute("name",name);
			}
			
			if(surname == null|| surname.trim().equals("")) {
				errorForm+="Insert surname<br>";
			}else {
				request.setAttribute("surname",surname);
			}
			
			if(errorForm != null && !errorForm.equals("")) {
				request.setAttribute("errorForm", errorForm);
			}else {
			String message="informazione completa Nome:"+name+"Cognome:"+surname;
			request.setAttribute("message", message);
			}
			
			RequestDispatcher dispatcher= getServletContext().getRequestDispatcher("jsp/formTest.jsp"); 
			dispatcher.forward(request, response);
			
	}

}
