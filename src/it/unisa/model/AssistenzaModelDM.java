package it.unisa.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;



public class AssistenzaModelDM {

		public void doSave(AssistenzaBean bean) throws SQLException {
		Connection connection=null;
		PreparedStatement preparedStatement=null;
		String insertSQL= "insert into assistenza (categoria, orario, problema, email) values (?,?,?,?)";
		
		try {
			connection = DriverManagerConnectionPool.getConnection(); 
			preparedStatement = connection.prepareStatement (insertSQL);

			preparedStatement.setString(1, bean.getCategoria());
			preparedStatement.setString(2, bean.getOrario());
			preparedStatement.setString(3, bean.getProblema());
			preparedStatement.setString(4, bean.getEmail());
			
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

}
