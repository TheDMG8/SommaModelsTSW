package it.unisa.model;

import java.sql.SQLException;
import java.util.Collection;

public interface UtenteModel<T> {

	public T doRetrieveByKey(String idUtente)throws SQLException;
	
    public Collection<T> doRetrieveAll(String order)throws SQLException;
	
	public void doSave(T utente)throws SQLException;
	
	public void doUpdate(T utente)throws SQLException;
	
	public void doDelete(T utente)throws SQLException;

	void doUpdateEditProfilo(T utente, int idUtente) throws SQLException;
}
