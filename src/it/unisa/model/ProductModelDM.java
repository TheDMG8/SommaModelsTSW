package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

import it.unisa.model.DriverManagerConnectionPool;

public class ProductModelDM implements ProductModel<ProductBean> {

	@Override
	public ProductBean doRetrieveByKey(String idProdotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ProductBean bean = new ProductBean();
		
		String selectSQL = "SELECT *FROM prodotto WHERE idProdotto = ?";
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			/*traduzione della stringa in intero*/
			preparedStatement.setInt(1, Integer.parseInt(idProdotto) );
			/*stampo la query e la eseguo*/
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			while(rs.next()) {
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
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
	public Collection<ProductBean> doRetrieveAll(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();
		
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
				
				ProductBean bean = new ProductBean();
				
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				
				
				prodotti.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return prodotti;
	}

	@Override
	public List<ProductBean> doRetrieveAllStatico(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		List<ProductBean> prodotti = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT *FROM prodotto WHERE tipoCategoria='statico' ";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				
				
				prodotti.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return prodotti;
	}
	
	public Collection<ProductBean> retriveBySearch(String s){
        try (Connection con = DriverManagerConnectionPool.getConnection()) {
            String search = "%";
            search += s + "%";
            PreparedStatement ps =
                    con.prepareStatement("SELECT * FROM prodotto WHERE nomeProdotto LIKE ?");
            ps.setString(1,search);
            ResultSet rs = ps.executeQuery();

            Collection<ProductBean> list = new LinkedList<ProductBean>();
    		
            while (rs.next()) {
            	ProductBean bean = new ProductBean();
            	bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
                list.add(bean);
            }
            return list;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
	
	/*lista prodotti dinamici*/
	@Override
	public Collection<ProductBean> doRetrieveAllDinamico(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT *FROM prodotto WHERE tipoCategoria= 'Radiocomandato' ";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				
				
				prodotti.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return prodotti;
	}

	@Override
	public Collection<ProductBean> doRetrieveAllAccessori(String order) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		Collection<ProductBean> prodotti = new LinkedList<ProductBean>();
		
		String selectSQL = "SELECT *FROM prodotto WHERE tipoCategoria= 'accessori' ";
		
		if (order != null && !order.equals("")) {
			selectSQL += "ORDER BY" + order;
		}
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			
			System.out.println("doRetrieveAll:" + preparedStatement.toString());
ResultSet rs = preparedStatement.executeQuery();
			
			
			while(rs.next()) {
				
				ProductBean bean = new ProductBean();
				
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("tipoProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				
				
				prodotti.add(bean);
				
			}
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return prodotti;
	}
	
	
	@Override
	public void doSave(ProductBean prodotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		String insertSQL = "INSERT INTO prodotto" + "(nomeProdotto, marcaProdotto,tipoCategoria,tipoProdotto,descrizioneProdotto,prezzoProdotto,immagine,numPezziDisponibili) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(insertSQL);
			
			preparedStatement.setString(1, prodotto.getNomeProdotto());
			preparedStatement.setString(2, prodotto.getMarcaProdotto());
			preparedStatement.setString(3, prodotto.getTipoCategoria());
			preparedStatement.setString(4, prodotto.getTipoProdotto());
			preparedStatement.setString(5, prodotto.getDescrizioneProdotto());
			preparedStatement.setDouble(6, prodotto.getPrezzoProdotto());
			preparedStatement.setString(7, prodotto.getImmagine());
			preparedStatement.setInt(8, prodotto.getNumPezziDisponibili());
			
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
	public void doUpdate(ProductBean prodotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String updateSQL = "UPDATE prodotto SET" + 
		                 "nomeProdotto = ?, marcaProdotto = ?, tipoCategoria = ?, tipoProdotto = ?, descrizioneProdotto = ?, prezzoProdotto = ?, immagine = ?, numPezziDisponibili = ? WHERE idProdotto = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(updateSQL);
			
			preparedStatement.setString(1, prodotto.getNomeProdotto());
			preparedStatement.setString(2, prodotto.getMarcaProdotto());
			preparedStatement.setString(3, prodotto.getTipoCategoria());
			preparedStatement.setString(4, prodotto.getTipoProdotto());
			preparedStatement.setString(5, prodotto.getDescrizioneProdotto());
			preparedStatement.setDouble(6, prodotto.getPrezzoProdotto());
			preparedStatement.setString(7, prodotto.getImmagine());
			preparedStatement.setInt(8, prodotto.getNumPezziDisponibili());
			preparedStatement.setInt(9, prodotto.getIdProdotto());
			
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
	public void doDelete(ProductBean prodotto) throws SQLException {
		Connection connection = null;
		PreparedStatement preparedStatement = null;
	 	
		String deleteSQL = "DELETE FROM prodotto WHERE idProdotto = ?";
		
		try {
			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement(deleteSQL);
			preparedStatement.setInt(1, prodotto.getIdProdotto());
			
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


	public ArrayList<ProductBean> doRetrieveByOrdine(String idOrdine) throws SQLException {
		// TODO Auto-generated method stub
		Connection connection = null;
		PreparedStatement preparedStatement = null;
		
		ArrayList<ProductBean> list = new ArrayList<ProductBean>();
		
		String selectSQL = "SELECT p.idProdotto,p.nomeProdotto,p.marcaProdotto,p.tipoCategoria,p.descrizioneProdotto,p.prezzoProdotto,p.immagine,p.numPezziDisponibili FROM utente as u,prodotto as p, ordine as o, contiene as c WHERE  o.idOrdine = ? && u.idUtente=o.idOrdineCliente && o.idOrdine =c.idOrdineC && c.idProdottoC = p.idProdotto";
		
		try {

			connection = DriverManagerConnectionPool.getConnection();
			preparedStatement = connection.prepareStatement (selectSQL);
			/*traduzione della stringa in intero*/
			preparedStatement.setInt(1, Integer.parseInt(idOrdine));
			/*stampo la query e la eseguo*/
			System.out.println("doRetrieveByKey:" + preparedStatement.toString());
			ResultSet rs = preparedStatement.executeQuery();
			System.out.println("Termostao in product model ordini");
			
			while(rs.next()) {
				ProductBean bean= new ProductBean();
				bean.setIdProdotto(rs.getInt("idProdotto"));
				bean.setNomeProdotto(rs.getString("nomeProdotto"));
				bean.setMarcaProdotto(rs.getString("marcaProdotto"));
				bean.setTipoCategoria(rs.getString("tipoCategoria"));
				bean.setTipoProdotto(rs.getString("marcaProdotto"));
				bean.setDescrizioneProdotto(rs.getString("descrizioneProdotto"));
				bean.setPrezzoProdotto(rs.getInt("prezzoProdotto"));
				bean.setImmagine(rs.getString("immagine"));
				bean.setNumPezziDisponibili(rs.getInt("numPezziDisponibili"));
				list.add(bean);
			}
			
		}finally {
			try {
			if(preparedStatement != null )
				preparedStatement.close();
			}finally {
				
				DriverManagerConnectionPool.releaseConnection(connection);
		   }
		}
		return list;
	}

		


}
