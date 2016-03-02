package com.rajesh.struts2;

import java.util.ArrayList;

import com.opensymphony.xwork2.ActionSupport;

public class ReadData extends ActionSupport {

	private static final long serialVersionUID = -8819352697303500472L;
	private String state;
	private ArrayList<String> districts;
	private ArrayList<String> states;

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

	public String dbStates() {
		// Do the database code or business logic here.
		System.out.println("Inside dbStates method");
		return SUCCESS;
	}
}
