package com.rajesh.struts2;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class ReadData extends ActionSupport {

	private static final long serialVersionUID = -8819352697303500472L;
	
	
	private Map<String,String> dropDownData;
	String did="",mid="",pid="";
	HttpServletResponse response=ServletActionContext.getResponse();
    HttpServletRequest request = ServletActionContext.getRequest();
    
	public String dbDropDown() {
		if(request.getParameter("did")!=null && request.getParameter("did")!=""){
			did=request.getParameter("did");
			if(did.equals("02")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "chittor_m1");
				dropDownData.put("02", "chittor_m2");
				dropDownData.put("03", "chittor_m3");
				dropDownData.put("04", "chittor_m4");
			}
			if(did.equals("01")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "Anantapur_m1");
				dropDownData.put("02", "Anantapur_m2");
			}
		}
		else if(request.getParameter("mid")!=null && request.getParameter("mid")!=""){
			mid=request.getParameter("mid");
			if(mid.equals("02")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "chittor_m2_p2");
				dropDownData.put("02", "chittor_m2_p2");
				dropDownData.put("03", "chittor_m2_p2");
				dropDownData.put("04", "chittor_m2_p2");
			}
			if(mid.equals("01")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "chittor_m1_p1");
				dropDownData.put("02", "chittor_m1_p1");
			}
		}
		else if(request.getParameter("pid")!=null && request.getParameter("pid")!=""){
			pid=request.getParameter("pid");
			if(pid.equals("02")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "chittor_m2_p2_v2");
				dropDownData.put("02", "chittor_m2_p2_v2");
				dropDownData.put("03", "chittor_m2_p2_v2");
				dropDownData.put("04", "chittor_m2_p2_v2");
			}
			if(pid.equals("01")){
				dropDownData = new HashMap<>();
				dropDownData.put("01", "chittor_m1_p1_v1");
				dropDownData.put("02", "chittor_m1_p1_v1");
			}
		}
		else{
			dropDownData = new HashMap<>();
			dropDownData.put("01","Anantapur");
			dropDownData.put("02","Chittor");
			dropDownData.put("03","EastGodavari");
			dropDownData.put("04","WestGodavari");
		}
		return SUCCESS;
	}
	public Map<String, String> getDropDownData() {
		return dropDownData;
	}
	public void setDropDownData(Map<String, String> dropDownData) {
		this.dropDownData = dropDownData;
	}
	
	
	

	

	

	
}
