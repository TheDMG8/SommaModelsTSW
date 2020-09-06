package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import it.unisa.model.UtenteBean;
import it.unisa.model.DriverManagerConnectionPool;

public class UtenteModelDM implements UtenteModel<UtenteBean> {

	@Override
	public UtenteBean doRetrieveByKey(String idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		UtenteBean bean= new UtenteBean();
		
		String selectSQL="SELECT * FROM utente WHERE email = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			preparedStatement.setString(1, idUtente);
			
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs= preparedStatement.executeQuery();
			
			while(rs.next()) {
				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setSesso(rs.getString("sesso"));
				bean.setRegione(rs.getString("regione"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setCitta(rs.getString("citta"));
				bean.setVia(rs.getString("via"));
				bean.setNumCivico(rs.getInt("numCivico"));
				bean.setCellulare(rs.getString("cellulare"));
				bean.setEmail(rs.getString("email"));
				bean.setPsswrd(rs.getString("psswrd"));
				bean.setIdUtente(rs.getInt("idUtente"));
				bean.setAdmin(rs.getString("isAdmin"));
				
			}
		}finally {
			try {
				if(preparedStatement != null )
					preparedStatement.close();
				}finally {
					
					DriverManagerConnectionPool.releaseConnection(connection);
				}
		}
		System.out.println(bean.isAdmin);
		return bean;
	}

	@Override
	public Collection<UtenteBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<UtenteBean> utenti = new LinkedList<UtenteBean>();
		
		String selectSQL = "SELECT * FROM utente";
		
		if(order != null && !order.equals("")) {
			selectSQL += " ORDER BY " + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				UtenteBean bean = new UtenteBean();

				bean.setNome(rs.getString("nome"));
				bean.setCognome(rs.getString("cognome"));
				bean.setSesso(rs.getString("sesso"));
				bean.setRegione(rs.getString("regione"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setCitta(rs.getString("citta"));
				bean.setVia(rs.getString("via"));
				bean.setNumCivico(rs.getInt("numCivico"));
				bean.setCellulare(rs.getString("cellulare"));
				bean.setEmail(rs.getString("email"));
				bean.setPsswrd(rs.getString("psswrd"));
				bean.setIdUtente(rs.getInt("idUtente"));
				
				utenti.add(bean);
			}
		} finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}
		}
		
		return utenti;
	}

	@Override
	public void doSave(UtenteBean utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL="INSERT INTO utente" +
		         "(nome,cognome,sesso,regione,citta,provincia,via,numCivico,cellulare,email,psswrd) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
		       
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (insertSQL);

			preparedStatement.setString(1, utente.getNome());
			preparedStatement.setString(2, utente.getCognome());
			preparedStatement.setString(3, utente.getSesso());
			preparedStatement.setString(4, utente.getRegione());
			preparedStatement.setString(5, utente.getCitta());
			preparedStatement.setString(6, utente.getProvincia());
			preparedStatement.setString(7, utente.getVia());
			preparedStatement.setInt(8, utente.getNumCivico());
			preparedStatement.setString(9, utente.getCellulare());
			preparedStatement.setString(10, utente.getEmail());
			preparedStatement.setString(11, utente.getPsswrd());
			
			System.out.println("doSave:" + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			/*abbiamo settato a false sennò il db non viene aggiornato*/
			connection.commit();
	}finally {
		try {
		if(preparedStatement != null )
			preparedStatement.close();
		}finally {
			
			DriverManagerConnectionPool.releaseConnection(connection);
	   }
	}
	}
	@Override
	public void doUpdateEditProfilo(UtenteBean utente,int idUtente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		String updateSQL="UPDATE utente SET nome = ?, cognome = ?, regione = ?, citta =?, provincia = ?, via = ? , numCivico = ?, cellulare = ?,  psswrd = ? WHERE idUtente = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (updateSQL);

			preparedStatement.setString(1, utente.getNome());
			preparedStatement.setString(2, utente.getCognome());
			preparedStatement.setString(3, utente.getRegione());
			preparedStatement.setString(4, utente.getCitta());
			preparedStatement.setString(5, utente.getProvincia());
			preparedStatement.setString(6, utente.getVia());
			preparedStatement.setInt(7, utente.getNumCivico());
			preparedStatement.setString(8, utente.getCellulare());
			preparedStatement.setString(9, utente.getPsswrd());
			preparedStatement.setInt(10, idUtente);
			
			System.out.println("doUpdate:" + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			/*abbiamo settato a false sennò il db non viene aggiornato*/
			connection.commit();
	}finally {
		try {
		if(preparedStatement != null )
			preparedStatement.close();
		}finally {
			
			DriverManagerConnectionPool.releaseConnection(connection);
	   }
	}
	}

	@Override
	public void doDelete(UtenteBean utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String deleteSQL = "DELETE FROM utente WHERE idUtente = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, utente.getIdUtente());
			
			System.out.println("doDelete: "+ preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			connection.commit();
			
		} finally {
			try {
				if(preparedStatement != null) 
					preparedStatement.close();
			} finally {
				DriverManagerConnectionPool.releaseConnection(connection);
			}

		}

	}
	
	@Override
	public void doUpdate(UtenteBean utente) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String updateSQL="UPDATE utente SET" +
		         "(nome = ?, cognome = ?, sesso = ?, regione = ?, citta = ?, provincia = ?, via = ?, numCivico = ?, cellulare = ?, email = ?, psswrd = ? WHERE idUtente = ?";

		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (updateSQL);

			preparedStatement.setString(1, utente.getNome());
			preparedStatement.setString(2, utente.getCognome());
			preparedStatement.setString(3, utente.getSesso());
			preparedStatement.setString(4, utente.getRegione());
			preparedStatement.setString(5, utente.getCitta());
			preparedStatement.setString(6, utente.getProvincia());
			preparedStatement.setString(7, utente.getVia());
			preparedStatement.setInt(8, utente.getNumCivico());
			preparedStatement.setString(9, utente.getCellulare());
			preparedStatement.setString(10, utente.getEmail());
			preparedStatement.setString(11, utente.getPsswrd());
			preparedStatement.setInt(12, utente.getIdUtente());
			
			System.out.println("doUpdate:" + preparedStatement.toString());
			preparedStatement.executeUpdate();
			
			/*abbiamo settato a false sennò il db non viene aggiornato*/
			connection.commit();
	}finally {
		try {
		if(preparedStatement != null )
			preparedStatement.close();
		}finally {
			
			DriverManagerConnectionPool.releaseConnection(connection);
	   }
	}
	}
}
