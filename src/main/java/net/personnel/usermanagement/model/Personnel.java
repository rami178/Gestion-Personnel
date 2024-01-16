package net.personnel.usermanagement.model;

public class Personnel {
	
	private int mat;
	private String nom ;
	private String grade;
	private String prison;
	private String email;
	private int tel;
	private String adresse;
	
	
	
	public Personnel(int mat, String nom, String grade, String prison, String email, int tel,String adresse) {
		super();
		this.mat = mat;
		this.nom = nom;
		this.grade = grade;
		this.prison = prison;
		this.email = email;
		this.tel = tel;
		this.adresse = adresse;
	}
	public int getMat() {
		return mat;
	}
	public void setMat(int mat) {
		this.mat = mat;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public String getPrison() {
		return prison;
	}
	public void setPrison(String prison) {
		this.prison = prison;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getTel() {
		return tel;
	}
	public void setTel(int tel) {
		this.tel = tel;
	}
	public String getAdresse() {
		return adresse;
	}
	public void setAdresse(String adresse) {
		this.adresse = adresse;
	}
	
	

}
