package com.rajesh.struts2;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class ReadData extends ActionSupport {

	private static final long serialVersionUID = -8819352697303500472L;
	private String state;
	private String district;
	private ArrayList<String> districts;
	private ArrayList<String> states;
	private ArrayList<String> panchayats;

	public ReadData() {
		System.out.println("Inside Constructor ");
		states = new ArrayList<String>();
		states.add("tamilnadu");
		states.add("kerala");
		states.add("karnataka");
		states.add("delhi");
	}

	public String getDefaultState() {
		System.out.println("Inside default State Getter");
		return "Select State";
	}

	public ArrayList<String> getDistricts() {
		return districts;
	}

	public ArrayList<String> getStates() {
		return states;
	}

	public void setState(String state) {
		System.out.println("Inside Setter " + state);
		this.state = state;
	}

	public String dbDistricts() {
		System.out.println("Getting Districts for " + state);
		// Do the database code or business logic here.
		districts = new ArrayList<String>();
		if (state.equalsIgnoreCase("tamilnadu")) {
			districts.add("chennai");
			districts.add("madurai");
			districts.add("trichy");
			districts.add("Covai");
			districts.add("Pudukkottai");
		} else if (state.equalsIgnoreCase("kerala")) {
			districts.add("allappey");
			districts.add("trivandrum");
			districts.add("kozhikkode");
		} else if (state.equalsIgnoreCase("karnataka")) {
			districts.add("bangalore");
			districts.add("Bommanahalli");
			districts.add("Mysore");
		} else if (state.equalsIgnoreCase("-1")) {
		}else {
			districts.add("District 1");
			districts.add("District 2");
			districts.add("District 3");
			districts.add("District 4");
			districts.add("District 5");
		}
		return SUCCESS;
	}
	public String dbPanchayats() {
		System.out.println("Getting Districts for " + district);
		// Do the database code or business logic here.
		panchayats = new ArrayList<String>();
		if (district.equalsIgnoreCase("tamilnadu")) {
			panchayats.add("chennai");
			panchayats.add("madurai");
			panchayats.add("trichy");
			panchayats.add("Covai");
			panchayats.add("Pudukkottai");
		} else if (district.equalsIgnoreCase("kerala")) {
			panchayats.add("allappey");
			panchayats.add("trivandrum");
			panchayats.add("kozhikkode");
		} else if (district.equalsIgnoreCase("karnataka")) {
			panchayats.add("bangalore");
			panchayats.add("Bommanahalli");
			panchayats.add("Mysore");
		} else if (district.equalsIgnoreCase("-1")) {
		}else {
			panchayats.add("District 1");
			panchayats.add("District 2");
			panchayats.add("District 3");
			panchayats.add("District 4");
			panchayats.add("District 5");
		}
		return SUCCESS;
	}
	public String dbStates() {
		// Do the database code or business logic here.
		System.out.println("Inside dbStates method");
		return SUCCESS;
	}

	public ArrayList<String> getPanchayats() {
		return panchayats;
	}

	public void setPanchayats(ArrayList<String> panchayats) {
		this.panchayats = panchayats;
	}

	public String getDistrict() {
		return district;
	}

	public void setDistrict(String district) {
		this.district = district;
	}
}
