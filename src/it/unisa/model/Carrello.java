package it.unisa.model;

import java.util.ArrayList;
import java.util.List;
  /*la rendo generica*/
public class Carrello<T> {
   
	  List<T> items;
	  
		public Carrello() {
			items = new ArrayList<T>();
		}
		
		public void addItem(T item) {
			items.add(item);
		}
		public void deleteItem(T item) {
			items.remove(item);
			/*
			for(T it: items) {
				if(it.equals(item)) {
					items.remove(it);
					break;
				}
			}*/
		}
		
		public List<T> getItems() {
			return items;
		}
		public void deleteItems() {
			items.clear();
		}
		
}
