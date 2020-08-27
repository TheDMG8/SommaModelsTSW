package model;

import java.util.*;


public class Carrello {

	private ArrayList<Prodotto> carrello;
	private double costoTot;
	
	public Carrello() {
		carrello= new ArrayList<Prodotto>();
	}
	
	public void addProdToCarrello(Prodotto item) {
		carrello.add(item);
		costoTot=costoTot+item.getPrezzoProdotto();
	}
	
	public void printAllItem() {
		
		Prodotto item;
		
		for(int i=0;i<carrello.size();i++) {
			item=carrello.get(i);
			System.out.println(item.getIdProdotto()+" "+item.getNomeProdotto()+" "+item.getTipoProdotto()+" "+item.getPrezzoProdotto());
		}
			
	}
	
	public Prodotto getItem(int i) {
		return carrello.get(i);
	}
	
	public void setItem(int i, Prodotto prod) {
		carrello.set(i, prod);
	}
	
	public ArrayList<?> getCartItem() {
		return carrello;
	}
	
	public void deleteProdFromCarrello(int i) {
		costoTot=costoTot-carrello.get(i).getPrezzoProdotto();
		carrello.remove(i);
	}
	
	public double getCostoTot() {
		return costoTot;
	}
	
	public boolean isEmpty() {
		return carrello.isEmpty();
	}
}
