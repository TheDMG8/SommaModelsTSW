package it.unisa.control;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import it.unisa.model.UtenteBean;
import it.unisa.model.UtenteModelDM;




@WebServlet("/AddUtente")
public class AddUtente extends HttpServlet {
	
	private static final long serialVersionUID = 1L;
	
	
	static UtenteModelDM model = new UtenteModelDM();
	
    public AddUtente() {
        super();
      
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		try {
			if(action != null) {
				if(action.equals("insert")) {
					HttpSession session=request.getSession();
					
					/*CONTROLLO FORM LATO SERVLET MI MANCA
					 */
					
					String regNome =  "/^[A-Za-z- ]+$/";
					String regCognome =  "/^[A-Za-z- ]+$/";
					String regRegione =  "/^[A-Za-z- ]+$/";
					String regCitta =  "/^[A-Za-z- ]+$/";
					String regProvincia =  "/^[A-Za-z- ]+$/";
					String regVia =  "/^[A-Za-z- ]+$/";
					String regCellulare =  "/^[0-9]+$/";
					String regEmail =  "/^[A-Za-z- ]+$/";
					String regPassword =  "/^[A-Za-z- ]+$/";
					Boolean validate=true;
					
				if(!request.getParameter("nome").matches(regNome)) {
						System.out.println("nome dato corretto");
				}else {validate=false;}
				if(!request.getParameter("cognome").matches(regCognome)) {
						System.out.println("cognome dato corretto");		
				}else {validate=false;}
				
			    if(!request.getParameter("regione").matches(regRegione)) {
						System.out.println("regione dato corretto");	
				}else {validate=false;}
				if(!request.getParameter("citta").matches(regCitta)) {
						System.out.println("citta dato corretto");		
				}else {validate=false;}
				if(!request.getParameter("provincia").matches(regProvincia)) {
						System.out.println("provincia dato corretto");		
			   }else {validate=false;}
			   if(!request.getParameter("via").matches(regVia)) {
						System.out.println("via dato corretto");
				}else {validate=false;}
			   if(!request.getParameter("cellulare").matches(regCellulare)) {
					System.out.println("cellulare dato corretto");					
			   }else {validate=false;}
			   if(!request.getParameter("email").matches(regEmail)) {
					System.out.println("email dato corretto");
			 }else {validate=false;}
			  if(!request.getParameter("password").matches(regPassword)) {
					System.out.println("password dato corretto");
				}else {validate=false;}	
			  if(validate==true) {
				  System.out.println("tutti i campi sono giusti");
			  }else {
				  RequestDispatcher view = request.getRequestDispatcher("CreaUtente.jsp");/*dove inoltro il form*/
				  HttpSession currentSession = request.getSession();
				  currentSession.setAttribute("error", "error");
				  view.forward(request,response);
					return;  
			  }
				//Se tutti i controlli sono stati superati si crea il bean e si inserisce nel database

					
					String nome= request.getParameter("nome");
					String cognome= request.getParameter("cognome");
					String sesso= request.getParameter("sesso");
					String regione= request.getParameter("regione");
					String citta= request.getParameter("citta");
					String provincia= request.getParameter("provincia");
					String via= request.getParameter("via");
					int numCivico= Integer.parseInt(request.getParameter("numerocivico"));
					String cellulare= request.getParameter("cellulare");
					String email= request.getParameter("email");
					String psswrd= request.getParameter("password");
					
					UtenteBean bean = new UtenteBean();
					
					bean.setNome(nome);
					bean.setCognome(cognome);
					bean.setSesso(sesso);
					bean.setRegione(regione);
					bean.setCitta(citta);
					bean.setProvincia(provincia);
					bean.setVia(via);
					bean.setNumCivico(numCivico);
					bean.setCellulare(cellulare);
					bean.setEmail(email);
					bean.setPsswrd(psswrd);
					
					model.doSave(bean);
					System.out.println("sono arrivato qui");
					RequestDispatcher view = request.getRequestDispatcher("success.jsp");/*dove inoltro il form*/
					view.forward(request,response);
					return;
				  }else if(action.equals("modify")) {
					    UtenteBean userOld=(UtenteBean) request.getSession().getAttribute("user");
					    
					    String nome= request.getParameter("nome");
						String cognome= request.getParameter("cognome");
						String regione= request.getParameter("regione");
						String citta= request.getParameter("citta");
						String provincia= request.getParameter("provincia");
						String via= request.getParameter("via");
						int numCivico= Integer.parseInt(request.getParameter("numerocivico"));
						String cellulare= request.getParameter("cellulare");
						String psswrd= request.getParameter("password");
						
						UtenteBean bean = new UtenteBean();
						
						bean.setNome(nome);
						bean.setCognome(cognome);
						bean.setRegione(regione);
						bean.setCitta(citta);
						bean.setProvincia(provincia);
						bean.setVia(via);
						bean.setNumCivico(numCivico);
						bean.setCellulare(cellulare);
						bean.setEmail(userOld.getEmail());
						bean.setSesso(userOld.getSesso());
						bean.setIdUtente(userOld.getIdUtente());
						bean.setPsswrd(psswrd);
						bean.setAdmin(userOld.isAdmin());
						
						int IdUser= (int) request.getSession().getAttribute("idUser");
						System.out.println("ho preso l'idutente:"+ IdUser);
						model.doUpdateEditProfilo(bean, IdUser);
						System.out.println("ho effettuato la modifica");
						HttpSession currentSession = request.getSession();
						currentSession.setAttribute("user", bean);
						RequestDispatcher view = request.getRequestDispatcher("userPersonalPage.jsp");/*dove inoltro il form*/
						view.forward(request,response);
						return;
					  
					  
					  
					  
					  
				  }else if(action.equals("login")) {
					String paramUsername = request.getParameter("username");
					String paramPassword = request.getParameter("password");
					
					/* controllo del login con funzione da db*/
					@SuppressWarnings("unused")
					String redirectedPage;
					int isAdmin= checkLogin(paramUsername, paramPassword);
					
					if(isAdmin == 1) {
						UtenteBean user= model.doRetrieveByKey(paramUsername);
						HttpSession oldsession = request.getSession(false);
						if(oldsession != null) {
							oldsession.invalidate(); /*invalida la sessione se esiste*/
						}
						HttpSession currentSession = request.getSession(); /*ne creo una nuova*/
					   	currentSession.setAttribute("user", user);
					   	currentSession.setMaxInactiveInterval(5*60);/*5 minuti di inattivit  massima*/
					   	
					   	currentSession.setAttribute("adminRoles", true);
						RequestDispatcher view = request.getRequestDispatcher("Index.jsp");
						view.forward(request,response);
						return;
					}
					else if(isAdmin == 2) {
						request.setAttribute("message", "Amministratore riconosciuto. Password errata.");
						RequestDispatcher view = request.getRequestDispatcher("login.jsp");
						view.forward(request,response);
						return;
					}
					else {
						UtenteBean user= model.doRetrieveByKey(paramUsername);
					
						if(user.isEmpty()) { //Utente non registrato
							request.setAttribute("message", "Utente non registrato");
							RequestDispatcher view = request.getRequestDispatcher("login.jsp");
							view.forward(request,response);
							return;
						}
					
						if(user.getPsswrd().equals(paramPassword)) {
							/*se l'autenticazione va bene*/
							/*recupero la sessione*/
							HttpSession oldsession = request.getSession(false);
							if(oldsession != null) {
								oldsession.invalidate(); /*invalida la sessione se esiste*/
							}
							HttpSession currentSession = request.getSession(); /*ne creo una nuova*/
						   	currentSession.setAttribute("user", user);
						   	currentSession.setMaxInactiveInterval(30*60);/*5 minuti di inattivit  massima*/
						   
						   	response.sendRedirect("Index.jsp");/*vai alla pagina home con login*/
						   	return;
						}  else { /*se l'autenticazione va male*/
								request.setAttribute("message", "Password errata");
								RequestDispatcher view = request.getRequestDispatcher("login.jsp");
								view.forward(request,response);
								return;
							}
					}
				}
			}}catch(SQLException | NumberFormatException e) {
			System.out.println("Error:" + e.getMessage());
			request.setAttribute("error", e.getMessage());
			}
	}
		/*accesso dal database da qui controllo admin nel database*/
		private int checkLogin(String paramUsername, String paramPassword){
			if ("admin@admin".equals(paramUsername) && "admin".equals(paramPassword)) return 1; 
			else if("admin@admin".equals(paramUsername) && !("admin".equals(paramPassword))) return 2;
			else return 0;
		}
		
	}

