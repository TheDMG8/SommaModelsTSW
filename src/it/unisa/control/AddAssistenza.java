package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.AssistenzaBean;
import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;


@WebServlet("/AddAssistenza")
public class AddAssistenza extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	//static UtenteModelDM model = new UtenteModelDM();
       
    
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
					
					bean.setCategoria(categoria);
					bean.setOrario(orario);
					bean.setProblema(problema);
					
				}
					}
			
				}catch(SQLException | NumberFormatException e) {
					System.out.println("Error:" + e.getMessage());
					request.setAttribute("error", e.getMessage());
				}
		
		
		 
	
				
				
	
	}
