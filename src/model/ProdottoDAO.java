package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collection;
import java.util.LinkedList;

import controller.DriverManagerConnectionPool;

public class ProdottoDAO implements ProdottoModel<Prodotto> {

	@Override
	public Prodotto doRetrieveByKey(String idProdotto) throws SQLException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<Prodotto> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<Prodotto> prodotto = new LinkedList<Prodotto>();
		
		String selectSQL = "SELECT *FROM prodotto";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				Prodotto bean = new Prodotto();
				
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				
				
				prodotto.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return prodotto;
	}

	@Override
	public void doSave(Prodotto prodotto) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doUpdate(Prodotto prodotto) throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void doDelete(Prodotto prodotto) throws SQLException {
		// TODO Auto-generated method stub
		
	}

}
