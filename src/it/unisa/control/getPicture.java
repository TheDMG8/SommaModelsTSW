package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import it.unisa.model.ProductModelDM;


@WebServlet("/getPicture")
public class getPicture extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	static ProductModelDM model = new ProductModelDM();
	
    public getPicture() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (String) request.getParameter("idProdotto"); 
		
		if (id != null) {
			byte[] bt;
			try {
				bt = model.doRetrieveByKey(id).getImmagine();
			
			ServletOutputStream out = response.getOutputStream();
			if (bt != null) 
			{
				response.setContentType("image/jpeg");
				out.write(bt);
				
			}
			out.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	  }
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
