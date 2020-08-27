package controller;

//struttura di base:
// 1. creare modello e controller
// 2. query sul modelo
// 3. servlet che usa le query e setta i parametri 
// 4. jsp che prende i dati dalla servlet 

import model.ProdottoDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;


@WebServlet("/index.html")
public class InitServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	static ProdottoDAO model = new ProdottoDAO();
	
	public InitServlet() {
		super();
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
{
	try {
		request.removeAttribute("prodotto");
		request.setAttribute("prodotto", model.doRetrieveAll(""));
	}catch(SQLException e){
		System.out.println("Error:" + e.getMessage());
		request.setAttribute("error", e.getMessage());
	}
	
	RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/index.jsp");
	dispatcher.forward(request, response);
    }
	
}

protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	doGet(request, response);
}
}




