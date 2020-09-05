package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;

public class OrdineModelDM implements OrdineModel<OrdineBean> {

	@Override
	public OrdineBean doRetrieveByKey(String idOrdine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		OrdineBean bean = new OrdineBean();
		
		String selectSQL = "SELECT *FROM ordine WHERE idOrdine = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			preparedStatement.setInt(1, Integer.parseInt(idOrdine) );
			
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				bean.setIdOrdine(rs.getInt("idOrdine"));
				bean.setDataOrdine(rs.getString("dataOrdine"));
				bean.setRegione(rs.getString("regione"));
				bean.setCitta(rs.getString("citta"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setVia(rs.getString("via"));
				bean.setNumCivico(rs.getInt("numCivico"));
				bean.setStatoOrdine(rs.getString("statoOrdine"));
				
			}
			
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return bean;
	}
	
	@Override
	public Collection<OrdineBean> doRetrieveByKeyUser(int idUser) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		@SuppressWarnings("unchecked")
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>()  ;
		
		String selectSQL = "SELECT o.idOrdine,o. dataOrdine,o.regione,o.citta,o.provincia,o.via,o.numCivico,o.statoOrdine\r\n" + 
							"FROM ordine as o ,utente as u \r\n" + 
							"WHERE  o.idOrdineCliente=u.idUtente&& u.idUtente = ?";
		 
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			preparedStatement.setInt(1, idUser );
			
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				
				OrdineBean bean = new OrdineBean();
				
				bean.setIdOrdine(rs.getInt("idOrdine"));
				bean.setDataOrdine(rs.getString("dataOrdine"));
				bean.setRegione(rs.getString("regione"));
				bean.setCitta(rs.getString("citta"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setVia(rs.getString("via"));
				bean.setNumCivico(rs.getInt("numCivico"));
				bean.setStatoOrdine(rs.getString("statoOrdine"));
				
				ordini.add(bean);
				
			}
			
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		System.out.println("TermostatoOrdini");
		return ordini;
	}

	@Override
	public Collection<OrdineBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<OrdineBean> ordini = new LinkedList<OrdineBean>();
		
		String selectSQL = "SELECT *FROM ordine";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				OrdineBean bean = new OrdineBean();
				
				bean.setIdOrdine(rs.getInt("idOrdine"));
				bean.setDataOrdine(rs.getString("dataOrdine"));
				bean.setRegione(rs.getString("regione"));
				bean.setCitta(rs.getString("citta"));
				bean.setProvincia(rs.getString("provincia"));
				bean.setVia(rs.getString("via"));
				bean.setNumCivico(rs.getInt("numCivico"));
				bean.setStatoOrdine(rs.getString("statoOrdine"));
				
				ordini.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return ordini;
	}
	
	

	@SuppressWarnings("resource")
	@Override
	public int doSave(OrdineBean ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO ordine" + "(dataOrdine, regione, citta, provincia, via, numCivico, statoOrdine,idOrdineCliente) VALUES (?, ?, ?, ?, ?, ?,?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setString(1, ordine.getDataOrdine());
			preparedStatement.setString(2,ordine.getRegione());
			preparedStatement.setString(3, ordine.getCitta());
			preparedStatement.setString(4, ordine.getProvincia());
			preparedStatement.setString(5,ordine.getVia());
			preparedStatement.setInt(6,ordine.getNumCivico());
			preparedStatement.setString(7,ordine.getStatoOrdine());
			preparedStatement.setInt(8, ordine.getIdUtente());
			
			System.out.println("doSave: "+ preparedStatement.toString());
			preparedStatement.executeUpdate();
		
			connection.commit();
			String Sql= "Select idOrdine From Ordine where idOrdineCliente=?";
			preparedStatement = connection.prepareStatement(Sql);
			preparedStatement.setInt(1, ordine.getIdUtente());
			System.out.println("doSave: "+ preparedStatement.toString());
			ResultSet rs =preparedStatement.executeQuery();
			ArrayList<Integer> numOrdini= new ArrayList<Integer>();
			while(rs.next())
			{
				numOrdini.add(rs.getInt("idOrdine"));
			}
			System.out.println("ADDORDINE ADD ORDINE MODEL ");
			return numOrdini.size();
		} finally {
				try {
					if(preparedStatement != null) 
						preparedStatement.close();
				} finally {
					DriverManagerConnectionPool.releaseConnection(connection);
				}
			}		

	}
	
	public void doSaveProdottiOrdine(int idOrdine, int[] idProdotti,int size) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO contiene" + "(idOrdineC,idProdottoC) VALUES (?, ?)";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			for(int i=0;i<size;i++) {
				preparedStatement.setInt(1,idOrdine);
				preparedStatement.setInt(2, idProdotti[i]);
				System.out.println("doSave: "+ preparedStatement.toString());
				preparedStatement.executeUpdate();
				connection.commit();
				System.out.println("ADDORDINE PRODOTTI ORDINE");
			}
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
	public void doUpdate(OrdineBean ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String updateSQL = "UPDATE ordine SET" + 
		                 "dataOrdine = ?, regione = ?, citta = ?, provincia = ?, via = ?, numCivico = ?, statoOrdine = ? WHERE idOrdine = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, ordine.getDataOrdine());
			preparedStatement.setString(2,ordine.getRegione());
			preparedStatement.setString(3, ordine.getCitta());
			preparedStatement.setString(4, ordine.getProvincia());
			preparedStatement.setString(5,ordine.getVia());
			preparedStatement.setInt(6,ordine.getNumCivico());
			preparedStatement.setString(7,ordine.getStatoOrdine());
			preparedStatement.setInt(8, ordine.getIdOrdine());
			
			System.out.println("doUpdate: "+ preparedStatement.toString());
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
	public void doDelete(OrdineBean ordine) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String deleteSQL = "DELETE FROM ordine WHERE idOrdine = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, ordine.getIdOrdine());
			
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
}