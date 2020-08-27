package model;

import java.sql.SQLException;
import java.util.Collection;

public interface ContieneModel<T> {

public T doRetrieveByKey(int idOrdineC , int idProdottoC)throws SQLException;
	
	public Collection<T> doRetrieveAll(String order)throws SQLException;
	
	public void doSave(T contiene)throws SQLException;
	
	public void doUpdate(T contiene)throws SQLException;
	
	public void doDelete(T contiene)throws SQLException;
}
