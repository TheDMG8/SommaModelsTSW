package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AssistenzaBean;
import it.unisa.model.AssistenzaModelDM;
import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;


@WebServlet("/AddAssistenza")
public class AddAssistenza extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static AssistenzaModelDM model = new AssistenzaModelDM();
       
    
    public AddAssistenza() {
        super();
    
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		
		String action = request.getParameter("action"); 		//togliere action
		try {
			if(action != null) {
				if(action.equals("assistenza")) {
					String categoria= request.getParameter("categoria");
					String orario= request.getParameter("orario");
					String problema= request.getParameter("problema");
					
					AssistenzaBean bean = new AssistenzaBean();
					UtenteBean user=(UtenteBean)request.getSession().getAttribute("user");
					bean.setCategoria(categoria);
					bean.setOrario(orario);
					bean.setProblema(problema);
					bean.setEmail(user.getEmail());
					
					model.doSave(bean);
					getServletContext().setAttribute("beanAssist", bean);
				}
					}
			
				}catch(NumberFormatException e) {
					System.out.println("Error:" + e.getMessage());
					request.setAttribute("error", e.getMessage());
				} catch (SQLException e) {
					e.printStackTrace();
				}
		
		String address;
		address = "/successAssistenza.jsp";
		System.out.println("TERMOSTATO7");
		RequestDispatcher dispatcher = request.getRequestDispatcher(address);
		dispatcher.forward(request, response);
		

	
		
		
		 
	
				
				
	
	}
}