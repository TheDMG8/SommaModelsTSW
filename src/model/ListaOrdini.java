package model;

import java.util.*;

public class ListaOrdini {
	
	private ArrayList<Ordine> lista;
	
	public ListaOrdini() {
	
		lista= new ArrayList<Ordine>();
	}
	
	//commento2
	public void addLista(Ordine ord) {
		lista.add(ord);
	}
	
	public void deleteListaItem(int i) {
		lista.remove(i);
	}
	
    //ok
	
	
	public ArrayList<?> getLista() {
		return lista;
	}
	
	public boolean isEmpty() {
		return lista.isEmpty();
	}

	public void printAllItem() {
		
		Ordine ord;
		
		for(int i=0;i<lista.size();i++) {
			ord=lista.get(i);
			System.out.println(ord.getIdCliente()+","+ord.getIdOrdine()+","+ord.getDestinazione()+","+ord.getDataAcquisto());
		}
			
	}
}
