package it.unisa.model;

public class AssistenzaBean {
	String categoria;
	String orario;
	String problema;
	String email;


public AssistenzaBean() {
	categoria="";
	orario="";
	problema="";
	email="";
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getCategoria() {
	return categoria;
}

public void setCategoria(String categoria) {
	this.categoria = categoria;
}
public String getOrario() {
	return orario;
}

public void setOrario(String orario) {
	this.orario = orario;
}

public String getProblema() {
	return problema;
}

public void setProblema(String problema) {
	this.problema = problema;
}
}

