package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

public class ContieneModelDM implements ContieneModel<ContieneBean> {

	@Override
	public ContieneBean doRetrieveByKey(int idOrdineC, int idProdottoC) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ContieneBean bean = new ContieneBean();
		
		String selectSQL = "SELECT *FROM contiene WHERE idOrdineC = ? AND idProdottoC = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			preparedStatement.setInt(1, idOrdineC );
			preparedStatement.setInt(2, idProdottoC);
			
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				bean.setIdOrdineC(rs.getInt("idOrdineC"));
				bean.setIdProdottoC(rs.getInt("idProdottoC"));
				
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
	public Collection<ContieneBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ContieneBean> contieni = new LinkedList<ContieneBean>();
		
		String selectSQL = "SELECT *FROM contiene";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
            ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				ContieneBean bean = new ContieneBean();
				
				bean.setIdOrdineC(rs.getInt("idOrdineC"));
				bean.setIdProdottoC(rs.getInt("idProdottoC"));
				
				contieni.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return contieni;
	}

	@Override
	public void doSave(ContieneBean contiene) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO contiene" + "(idOrdineC, idProdottoC) VALUES (?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setInt(1, contiene.getIdOrdineC());
			preparedStatement.setInt(2, contiene.getIdProdottoC());
			
			
			System.out.println("doSave: "+ preparedStatement.toString());
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
	public void doUpdate(ContieneBean contiene) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String updateSQL = "UPDATE ordine SET" + 
		                 "WHERE idOrdineC = ? AND idProdottoC = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setInt(1, contiene.getIdOrdineC());
			preparedStatement.setInt(2, contiene.getIdProdottoC());
			
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
	public void doDelete(ContieneBean contiene) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String deleteSQL = "DELETE FROM contiene WHERE idOrdineC = ? AND idProdottoC = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, contiene.getIdOrdineC());
			preparedStatement.setInt(2, contiene.getIdProdottoC());
			
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


