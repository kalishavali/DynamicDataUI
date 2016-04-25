package com.tcs.nregs.NewReports.reqhand;

import java.io.DataInputStream;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.log4j.Logger;
import org.apache.tomcat.util.http.fileupload.FileItem;
import org.apache.tomcat.util.http.fileupload.FileItemFactory;
import org.json.simple.JSONArray;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.tcs.nregs.FundFR.dao.NodalBankLogin_engDAO;
import com.tcs.nregs.FundFR.dao.NodalBankLogin_engDAOImpl;
import com.tcs.nregs.NewReports.dao.LandDevelopmentdao;
import com.tcs.nregs.NewReports.dao.LandDevelopmentdaoImpl;
import com.tcs.nregs.NewReports.dao.NewReportsdao;
import com.tcs.nregs.NewReports.dao.NewReportsdaoImpl;
import com.tcs.nregs.NewReports.dao.SmartCardreport_engDAO;
import com.tcs.nregs.NewReports.dao.SmartCardreport_engDAOImpl;
import com.tcs.nregs.common.dao.CommonDAO;
import com.tcs.nregs.common.dao.CommonDAOImpl;
import com.tcs.nregs.common.dao.Common_engDAO;
import com.tcs.nregs.common.dao.Common_engDAOImpl;
import com.tcs.nregs.util.DataAccess;
import com.tcs.sgv.common.exception.BaseException;
import com.tcs.sgv.common.requesthandler.BaseHandler;

public class LandDevelopmentNewRH extends BaseHandler{
	String lStrreturnPage = null;
	String lStrAction = null;
	String sid = "01";
	String did = "-1";
	String cid = "-1";
	String mid = "-1";
	String pid = "-1";
	String vid = "-1";
	String hid = "-1";
	String excel = "-1";
	String lStryear = "";
	String lStrmonth = "";
	String status = "";
	String heading = "";
	String type = "";
	String path = "";
	String id = "";
	String lStrtype = "";
	String reportLevel="";
	static Logger glogger = Logger.getLogger(NewReportsRH.class);
	ArrayList ResultList = new ArrayList();
	int[] floatval = new int[15];
	String fin_flag = "Y";
	ArrayList<String> commonDtls = new ArrayList<String>();
	ArrayList dlist = new ArrayList();
	ArrayList idlist = new ArrayList();
	ArrayList dlistnew = new ArrayList();
	ArrayList<ArrayList<String>> dlistfinal2 = new ArrayList<ArrayList<String>>();
	ArrayList dlistfinal = new ArrayList();
	String FinYear = "";
	String monthname = "";
	String lang = "";
	String UpdatedTime="";
	Calendar calendar = new GregorianCalendar();
	Common_engDAOImpl cdaom = new Common_engDAOImpl();
	LandDevelopmentdao Ndao = new LandDevelopmentdaoImpl();
	Common_engDAO cDAO = new Common_engDAOImpl();
	CommonDAO telCdao = new CommonDAOImpl();
	NewReportsdao Newdao = new NewReportsdaoImpl();
	NodalBankLogin_engDAO NBdao=new NodalBankLogin_engDAOImpl();
	@Override
	public String processRequest(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("StateKey") != null)
			sid = (String) session.getAttribute("StateKey");
		if (session.getAttribute("district_id") != null
				&& !session.getAttribute("district_id").equals("-1")) {
			did = (String) session.getAttribute("district_id");
			request.setAttribute("DistrictKey", did);
		}
		if (session.getAttribute("mandal_id") != null
				&& !session.getAttribute("mandal_id").equals("-1")) {
			mid = (String) session.getAttribute("mandal_id");
			request.setAttribute("MandalKey", mid);
		}
		if (session.getAttribute("panchayat_id") != null
				&& !session.getAttribute("panchayat_id").equals("-1")) {
			String tpid = (String) session.getAttribute("panchayat_id");
			if (tpid.length() != 0)
				pid = (String) session.getAttribute("panchayat_id");
			request.setAttribute("PanchayatKey", pid);
		}
		if (session.getAttribute("year_val") != null
				&& !session.getAttribute("year_val").equals("-1")) {
			lStryear = (String) session.getAttribute("year_val");
		} else {
			if (calendar.get(Calendar.MONTH) < 3) {
				lStryear = Integer.toString(calendar.get(Calendar.YEAR) - 1);
			} else {
				lStryear = Integer.toString(calendar.get(Calendar.YEAR));
			}
		}
		if (session.getAttribute("month_val") != null
				&& !session.getAttribute("month_val").equals("-1")) {
			lStrmonth = (String) session.getAttribute("month_val");
		} else {
			lStrmonth = (calendar.get(Calendar.MONTH) + 1) + "";
		}
		if (lStrmonth.length() < 2) {
			lStrmonth = "0" + lStrmonth;
		}
		if (request.getParameter("actionVal") != null) {
			lStrAction = request.getParameter("actionVal");
		}
		FinYear = Ndao.getFinYear(lStryear);
		monthname = cdaom.getMonth(lStrmonth);
		
		// Labour and Expenditure Details
		if (lStrAction != null && lStrAction.equals("LabourAndExpenditureDetails")) {
			String ip_address = (String) request.getRemoteAddr();
			if (session.getAttribute("sid") != null)
				sid = (String) session.getAttribute("sid");
			try {
				if (request.getParameter("id") != null) {
					id = (String) request.getParameter("id");
					idlist = Ndao.getId(id);
					if (idlist.size() >= 1) {
						did = (String) idlist.get(0);
					}
					if (idlist.size() >= 2) {
						mid = (String) idlist.get(1);
					}
					if (idlist.size() >= 3) {
						pid = (String) idlist.get(2);
					}
				}
				request.setAttribute("ID", id);
				if (did.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "State";
					lStrreturnPage = "R9_CommonRepwithRH";
				} else if (!did.equals("-1") && mid.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "District";
					lStrreturnPage = "R9_CommonRepwithRH";
				} else if (!mid.equals("-1") && pid.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "Mandal";
					lStrreturnPage = "R9_CommonRepwithRH";
				} else if(!pid.equals("-1")){
					request.setAttribute("LinkValue", "-1");
					reportLevel = "panchayatreport";
					lStrreturnPage = "AllMandCommon";
				}
				else{
					request.setAttribute("LinkValue", "1");
					reportLevel = "Habitation";
				}
				commonDtls = cDAO.getAllCommonDtls(sid, did, mid, pid,lStryear, lStrmonth);
				request.setAttribute("TopDetails", commonDtls);
				request.setAttribute("ReportName","R1. Labour and Expenditure details");
				request.setAttribute("ReportType", "");
				dlist = Ndao.getLabourAndExpenditureDetailsHdngs(did, mid, pid);
				dlistnew = (ArrayList) dlist.get(0);
				for (int i = 0; i < dlistnew.size(); i++) {
					if (!dlistnew.get(i).equals("$")) {
						dlistfinal.add((String) dlistnew.get(i));
					} else {
						dlistfinal2.add(dlistfinal);
						dlistfinal = new ArrayList<String>();
					}
				}
				request.setAttribute("Headings", dlistfinal2);
				if(did!="-1" && mid!="-1" && pid!="-1"){
					dlist = Newdao.getAbstractRep1Dtls(sid, did, mid, pid, lStryear,lStrmonth, type, lang, ip_address);
					request.setAttribute("Data",((ArrayList)dlist.get(0)));
					lStrreturnPage = "AllMandCommon";
				}else{
					dlist = Ndao.getLabourAndExpenditureDetailsDtls(did, mid, pid);
					request.setAttribute("Data", dlist);
					lStrreturnPage = "R9_CommonRepwithRH";
				}
				request.setAttribute("reportID", "LAED");
				request.setAttribute("actionval", "LabourAndExpenditureDetails");
				request.setAttribute("RHName", "LandDevelopmentNewRH");
				if(!pid.equals("-1")){
					request.setAttribute("reportname", reportLevel);
				}else{
					request.setAttribute("replvl", reportLevel);
				}
			} catch (Exception e) {
				System.out.println(e);
			}
		}
		 
		// IHHLs
		if (lStrAction != null && lStrAction.equals("IHHLs")) {
			if (session.getAttribute("sid") != null)
				sid = (String) session.getAttribute("sid");
			try {
				if (request.getParameter("id") != null) {
					id = (String) request.getParameter("id");
					idlist = Ndao.getId(id);
					if (idlist.size() >= 1) {
						did = (String) idlist.get(0);
					}
					if (idlist.size() >= 2) {
						mid = (String) idlist.get(1);
					}
					if (idlist.size() >= 3) {
						pid = (String) idlist.get(2);
					}
				}
				request.setAttribute("ID", id);
				if (did.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "State";
					lStrreturnPage = "R9_3headercommonreportwithRH";
					request.setAttribute("reportname", reportLevel);
				} else if (!did.equals("-1") && mid.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "District";
					lStrreturnPage = "R9_CommonRepwithRH";
					request.setAttribute("replvl", reportLevel);
				} else if (!mid.equals("-1") && pid.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportLevel = "Mandal";
					lStrreturnPage = "R9_CommonRepwithRH";
					request.setAttribute("replvl", reportLevel);
				} else {
					request.setAttribute("LinkValue", "-1");
					//For Photo
					request.setAttribute("path", "GovtDocs\\RevisitingPhotos\\"+ did + mid + "\\");
					request.setAttribute("photo", "yes");
					reportLevel = "Panchayat";
					lStrreturnPage = "R9_3headercommonreportwithRH";
					request.setAttribute("reportname", reportLevel);
				}
				FinYear = Ndao.getFinYear(lStryear);
				monthname = cdaom.getMonth(lStrmonth);
				commonDtls = cDAO.getAllCommonDtls(sid, did, mid, pid,lStryear, lStrmonth);
				request.setAttribute("TopDetails", commonDtls);
				// Change
				request.setAttribute("ReportName","R2. IHHLs");
				request.setAttribute("ReportType", "");
				// Change
				dlist = Ndao.getIHHLsHdngs(did, mid, pid);
				dlistnew = (ArrayList) dlist.get(0);
				for (int i = 0; i < dlistnew.size(); i++) {
					if (!dlistnew.get(i).equals("$")) {
						dlistfinal.add((String) dlistnew.get(i));
					} else {
						dlistfinal2.add(dlistfinal);
						dlistfinal = new ArrayList<String>();
					}
				}
				request.setAttribute("Headings", dlistfinal2);
				// Change
				dlist = Ndao.getIHHLsDtls(did, mid, pid);
				request.setAttribute("Data", dlist);
				// Change
				request.setAttribute("reportID", "IHHLs");
				// Change
				request.setAttribute("actionval", "IHHLs");
				request.setAttribute("RHName", "LandDevelopmentNewRH");

			} catch (Exception e) {
				System.out.println(e);
			}
		}
		//For Gos Upload
		if (lStrAction != null && lStrAction.equals("goUpload")) {
			String category="";
			String gonumber="";
			String goDate="";
			String subject="";
			int result=0;
			String MaxFileNo="";
			String UPLOAD_DIRECTORY = "C:/Files/";
			//String UPLOAD_DIRECTORY = "\\\\10.100.100.41\\f$\\Application_Downloads\\NREGS_Web\\GO\\";
			if(!session.getAttribute("Status").equals("SUCCESS")){
				lStrreturnPage="goLogin";
			}
			else if (ServletFileUpload.isMultipartContent(request)) {
				try {
					String fname = null;
					String userName=(String)session.getAttribute("username");
					List<org.apache.commons.fileupload.FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					for (org.apache.commons.fileupload.FileItem item : multiparts) {
						if (!item.isFormField()) {
							ArrayList<ArrayList<String>> resultList=new ArrayList<ArrayList<String>>();
							resultList=NBdao.getMaxFileNumber(userName, gonumber);
							MaxFileNo=String.format("%03d",Integer.parseInt( resultList.get(0).get(0) )+1);
							fname = new File(item.getName()).getName();
							fname = userName+"_"+gonumber+"_"+MaxFileNo+"."+fname.substring(fname.lastIndexOf(".") + 1);
							item.write(new File(UPLOAD_DIRECTORY + File.separator + fname ));
						}else if (item.isFormField() && item.getFieldName().equals("category")) {			                
							category = item.getString();			               
			            }else if (item.isFormField() && item.getFieldName().equals("gonumber")) {			                
							gonumber = item.getString();			               
			            }else if (item.isFormField() && item.getFieldName().equals("dmaDate12")) {			                
							goDate = item.getString();			               
			            }else if (item.isFormField() && item.getFieldName().equals("subject")) {			                
							subject = item.getString();			               
			            }
					}
					result=NBdao.setGOUploadData(category,gonumber,goDate,subject,fname,userName);
					if(result==1){
						ArrayList<ArrayList<String>> spryearList=new ArrayList<ArrayList<String>>();
						request.setAttribute("result", "Go files uploaded Successfully");
						spryearList = cDAO.getFinancialYear();
						String y=Integer.toString(calendar.get(Calendar.YEAR));
						ArrayList<ArrayList<String>> resultList=new  ArrayList<ArrayList<String>>();
						resultList = NBdao.getGOUploadData(Integer.toString(calendar.get(Calendar.YEAR)),userName);
						request.setAttribute("resultList",resultList);
						request.setAttribute("yearList",spryearList);
						lStrreturnPage="goDetails";
					}else
					{
						request.setAttribute("result", "Failed upload Go files. Please try again");
						lStrreturnPage="goUpload";
					}
					
				} catch (Exception ex) {
					request.setAttribute("Error", "Failed to upload file" + ex);
				}
	 
			}else {
				request.setAttribute("Error","Failed to upload file");
				lStrreturnPage="goUpload";
			}
			
        }
		if (lStrAction != null && lStrAction.equals("updateGoData")) {
			String category="";
			String gonumber="";
			String goDate="";
			String subject="";
			int result=0;
			String MaxFileNo="";
			String fname2=null;
			String seqNumber=request.getParameter("seqNumber");
			String fname=request.getParameter("fileName");
			String cmpGoNum=fname.substring(fname.indexOf("_")+1,fname.lastIndexOf("_"));
			String UPLOAD_DIRECTORY = "C:/Files/";
			//String UPLOAD_DIRECTORY = "\\\\10.100.100.41\\f$\\Application_Downloads\\NREGS_Web\\GO\\";
			if (ServletFileUpload.isMultipartContent(request)) {
				try {
					String userName=(String)session.getAttribute("username");
					//Maximum File Number
					
					List<org.apache.commons.fileupload.FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
					for (org.apache.commons.fileupload.FileItem item : multiparts) {
						if (!item.isFormField()) {
							File file = new File(UPLOAD_DIRECTORY+fname);
					    	if(file.delete()){
								System.out.println(file.getName() + " is deleted!");
							}else{
								System.out.println("Delete operation is failed.");
							}
					    	ArrayList<ArrayList<String>> resultList=new ArrayList<ArrayList<String>>();
							resultList=NBdao.getMaxFileNumber(userName, gonumber);
							MaxFileNo=String.format("%03d",Integer.parseInt( resultList.get(0).get(0) )+1);
							fname2 = new File(item.getName()).getName();
							fname = fname.substring(0,fname.lastIndexOf(".")+1)+fname2.substring(fname2.lastIndexOf(".")+1);;
							item.write(new File(UPLOAD_DIRECTORY + File.separator+ fname));
						}else if (item.isFormField() && item.getFieldName().equals("category")) {			                
							category = item.getString();			               
			            }else if (item.isFormField() && item.getFieldName().equals("gonumber")) {			                
							gonumber = item.getString();
							if(!gonumber.equals(cmpGoNum)){
								ArrayList<ArrayList<String>> resultList=new ArrayList<ArrayList<String>>();
								resultList=NBdao.getMaxFileNumber(userName, gonumber);
								MaxFileNo=String.format("%03d",Integer.parseInt( resultList.get(0).get(0) )+1);
								fname = userName+"_"+gonumber+"_"+MaxFileNo+"."+fname.substring(fname.lastIndexOf(".") + 1);
							}
			            }else if (item.isFormField() && item.getFieldName().equals("godate")) {			                
							goDate = item.getString();			               
			            }else if (item.isFormField() && item.getFieldName().equals("subject")) {			                
							subject = item.getString();			               
			            }
					}
					result=NBdao.updateGoData(category,gonumber,goDate,subject,fname,userName,seqNumber);
					PrintWriter out = response.getWriter();
					String json = new Gson().toJson(result);
			        out.println(json.toString());
			        out.close();
					
				} catch (Exception ex) {
					request.setAttribute("Error", "Failed to upload file" + ex);
				}
	 
			}else {
				request.setAttribute("Error","Failed to upload file");
				
			}
			
        }
		if (lStrAction != null && lStrAction.equals("displayGoDetails")) {
			String userName=(String)session.getAttribute("username");
			Common_engDAO cmDAO=new Common_engDAOImpl(); 
			ArrayList<ArrayList<String>> spryearList = new  ArrayList<ArrayList<String>>();
				spryearList=cmDAO.getFinancialYear();
			
			ArrayList<ArrayList<String>> resultList=new  ArrayList<ArrayList<String>>();
			resultList = NBdao.getGOUploadData(Integer.toString(calendar.get(Calendar.YEAR)),userName);
			request.setAttribute("resultList",resultList);
			request.setAttribute("yearList",spryearList);
			lStrreturnPage="goDetails";
		}
		//Ajax call for GO Details
		if (lStrAction != null && lStrAction.equals("goDetails")) {
			String year = request.getParameter("year");
			String userName=(String)session.getAttribute("username");
			PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setHeader("Pragma", "no-cache");
	        response.setHeader("Expires", "-1");

	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setHeader("Access-Control-Max-Age", "86400");
	        
	        ArrayList<ArrayList<String>> resultList=new  ArrayList<ArrayList<String>>();
	        resultList = NBdao.getGOUploadData(year,userName);
	        String json = new Gson().toJson(resultList);
	        out.println(json.toString());
	        out.close();
		}
		if (lStrAction != null && lStrAction.equals("goEdit")) {
			String sequenceNumber = request.getParameter("sequenceNumber");
			String userName=(String)session.getAttribute("username");
			PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setHeader("Pragma", "no-cache");
	        response.setHeader("Expires", "-1");

	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setHeader("Access-Control-Max-Age", "86400");
	        
	        ArrayList<ArrayList<String>> resultList=new  ArrayList<ArrayList<String>>();
	        resultList = NBdao.getEditGoData(sequenceNumber,userName);
	        String json = new Gson().toJson(resultList);
	        out.println(json.toString());
	        out.close();
		}
		if (lStrAction != null && lStrAction.equals("deleteGoDetails")) {
			String sequenceNumber = request.getParameter("seqNumber");
			String userName=(String)session.getAttribute("username");
			PrintWriter out = response.getWriter();
	        response.setContentType("text/html");
	        response.setHeader("Cache-control", "no-cache, no-store");
	        response.setHeader("Pragma", "no-cache");
	        response.setHeader("Expires", "-1");

	        response.setHeader("Access-Control-Allow-Origin", "*");
	        response.setHeader("Access-Control-Allow-Methods", "POST");
	        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
	        response.setHeader("Access-Control-Max-Age", "86400");
	        
	        int result=0;
	        result = NBdao.deleteGoDetails(sequenceNumber,userName);
	        String json = new Gson().toJson(result);
	        out.println(json.toString());
	        out.close();
		}
		if (lStrAction != null && lStrAction.equals("workWiseReportNew")) {
			sid = "01";
			String reportName = "";
			String date = "";
			String startDate = "";
			String endDate = "";
			String lwstartDate = "";
			String lwendDate = "";
			String ptype = "";
			String type1 = "";
			String type2 = "";
			SmartCardreport_engDAO sdao = new SmartCardreport_engDAOImpl();
			LandDevelopmentdao Ndao = new LandDevelopmentdaoImpl();
			ArrayList data = new ArrayList();
			ResultList = Ndao.getStartEndDates21i(type);
			if (ResultList.size() > 0) {
				ResultList = (ArrayList) ResultList.get(0);
				startDate = (String) ResultList.get(0);

				endDate = (String) ResultList.get(1);
				// lwstartDate = (String) ResultList.get(2);
				// lwendDate = (String) ResultList.get(3);
			}
			if (request.getParameter("type") != null) {
				type = (String) request.getParameter("type");
			}
			if (session.getAttribute("district_id") != null
					&& session.getAttribute("district_id") != ""
					&& !((String) session.getAttribute("district_id"))
							.equalsIgnoreCase("-1")) {
				did = (String) session.getAttribute("district_id");
				reportName = "districtreport";
			}
			if (session.getAttribute("mandal_id") != null
					&& session.getAttribute("mandal_id") != ""
					&& !((String) session.getAttribute("mandal_id"))
							.equalsIgnoreCase("-1")) {
				mid = (String) session.getAttribute("mandal_id");
				reportName = "mandalreport";
			}
			if (session.getAttribute("panchayat_id") != null
					&& session.getAttribute("panchayat_id") != ""
					&& !((String) session.getAttribute("panchayat_id"))
							.equalsIgnoreCase("-1")) {
				pid = (String) session.getAttribute("panchayat_id");
				reportName = "panchayatreport";
			}
			try {
				if (request.getParameter("id") != null) {
					id = (String) request.getParameter("id");
					idlist = Ndao.getId(id);
					if (idlist.size() >= 1) {
						did = (String) idlist.get(0);
					}
					if (idlist.size() >= 2) {
						mid = (String) idlist.get(1);
					}
					if (idlist.size() >= 3) {
						pid = (String) idlist.get(2);
					}

				}
				request.setAttribute("ID", id);
				String status = "";
				if (did == null || did.equalsIgnoreCase("")
						|| did.equalsIgnoreCase("-1")) {
					reportName = "statereport";
				}

				if (did.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportName = "statereport";
					lStrreturnPage = "R13_4headercommonreportwithRH";
				} else if (!did.equals("-1") && mid.equals("-1")) {
					request.setAttribute("LinkValue", "1");
					reportName = "districtreport";
					lStrreturnPage = "R13_4headercommonreportwithRH";
				} else if (!mid.equals("-1") && pid.equals("-1")) {
					if (type.equalsIgnoreCase("ActionPlan")) {
						request.setAttribute("LinkValue", "-1");
					} else {
						request.setAttribute("LinkValue", "1");
					}
					reportName = "mandalreport";
					lStrreturnPage = "R13_4headercommonreportwithRH";
				} else {
					request.setAttribute("LinkValue", "2");
					request.setAttribute("ReportType", "Panchayat Level Report");
					lStrreturnPage = "R13_CommonRepwithRH";
					reportName = "panchayatreport";
				}
				if (type.equalsIgnoreCase("-1")) {
					request.setAttribute("ReportName","R13.31 D) Work Wise Progress Report (ABSTRACT)");
				}else if (type.equalsIgnoreCase("WHS")) {
						request.setAttribute("ReportName","R13.31 D) Work Wise Progress Report (WHS)");
				}else if (type.equalsIgnoreCase("SMC")) {
						request.setAttribute("ReportName","R13.31 D) Work Wise Progress Report (SMC)");
				}else{
						request.setAttribute("ReportName","R13.31 D) Work Wise Progress Report  (Chettu)");
				}
				
				ArrayList commonList = new ArrayList();

				ArrayList dlist = new ArrayList();
				commonDtls = cDAO.getAllCommonDtls(sid, did, mid, pid,lStryear, lStrmonth);
				request.setAttribute("TopDetails", commonDtls);
				dlist = Ndao.getWorkWiseReportNewHdngs(did, mid, pid, hid, type);
				request.setAttribute("Headings", dlist);
				dlist = Ndao.getWorkWiseReportNewDtls(did, mid, pid, type);
				request.setAttribute("Data", dlist.get(0));
				request.setAttribute("type", type);
				request.setAttribute("actionval", "workWiseReportNew");
				request.setAttribute("RHName", "LandDevelopmentNewRH");
				request.setAttribute("reportname", reportName);
				request.setAttribute("fromdate", ((ArrayList) ((ArrayList) dlist.get(1)).get(0)).get(0) );
				request.setAttribute("enddate", ((ArrayList) ((ArrayList) dlist.get(1)).get(0)).get(1) );
				request.setAttribute("ReportType", "");

			}// End of try
			catch (BaseException be) {
				throw be;
			} // End of catch
			catch (Exception e) {
				throw e;
			}
		}// End of try
			
		
		
		     
		return lStrreturnPage;
	}
	
	
	

}
