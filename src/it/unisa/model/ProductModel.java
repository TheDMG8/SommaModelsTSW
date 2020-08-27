package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;
/*interfaccia che ci nasconde il codice sql va implementata*/
/*implementa i metodi CRUD usando i generic per qualsiasi bean*/
public interface ProductModel<T> {
   
	public T doRetrieveByKey(String idProdotto)throws SQLException;
	
	public Collection<T> doRetrieveAll(String order)throws SQLException;
	
	public void doSave(T prodotto)throws SQLException;
	
	public void doUpdate(T prodotto)throws SQLException;
	
	public void doDelete(T prodotto)throws SQLException;
}
