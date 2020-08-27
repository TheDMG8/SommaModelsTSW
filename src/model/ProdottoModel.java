package model;

import java.sql.SQLException;
import java.util.Collection;
/*implementa i metodi CRUD usando i generic per qualsiasi bean*/
public interface ProdottoModel<T> {

public T doRetrieveByKey(String idProdotto)throws SQLException;
	
	public Collection<T> doRetrieveAll(String ordine)throws SQLException;
	
	public void doSave(T prodotto)throws SQLException;
	
	public void doUpdate(T prodotto)throws SQLException;
	
	public void doDelete(T prodotto)throws SQLException;
}