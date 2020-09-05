package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface OrdineModel<T> {

public T doRetrieveByKey(String idOrdine)throws SQLException;
	
	public Collection<T> doRetrieveAll(String order)throws SQLException;
	
	public int doSave(T ordine)throws SQLException;
	
	public void doUpdate(T ordine)throws SQLException;
	
	public void doDelete(T ordine)throws SQLException;

	Collection<OrdineBean> doRetrieveByKeyUser(int idUser) throws SQLException;
}
