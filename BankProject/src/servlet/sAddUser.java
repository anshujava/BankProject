/*
 * sAddUser.java
 *
 * Created on February 18, 2011, 8:59 PM
 */

package servlet;

import java.io.*;
import java.net.*;
import javax.servlet.http.HttpSession;
import javax.servlet.*;
import javax.servlet.http.*;
import commonFunction.*;
import bean.*;
import generalClass.*;
import java.util.Date;
import java.text.SimpleDateFormat;
/**
 *
 * @author anshuman
 * @version
 */
public class sAddUser extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
                 Date todaysDate = new java.util.Date();
                 SimpleDateFormat formatter = new SimpleDateFormat("dd-MMM-yyyy HH:mm:ss");
                 String formattedDate = formatter.format(todaysDate);
                 String message="";
		 HttpSession session = request.getSession(true);
                 userBean user = new userBean();
                 UserDetail udet = new UserDetail();
                 GeneralBean cfun = new GeneralBean();
                 CryptoLibrary cl = new CryptoLibrary();
                 AllDetail alldet = new AllDetail();
                 LoginBean lbean=new LoginBean();
         try 
         {
            String str=request.getParameter("hidValue");
            if(str.equalsIgnoreCase("add"))
		{
            String temp= cfun.getGenerateId("CUSTOMER_ID"); 
            user.setfirstName(request.getParameter("txtcFName"));
            user.setlastName(request.getParameter("txtclName"));
            user.setgender(request.getParameter("cgender"));
            user.setloginName(request.getParameter("txtuName"));
            String pwd=request.getParameter("txtPassword");
            String pwdEncrypt=cl.encrypt(pwd);
            System.out.println("pwdEncrypt in adduser servlet"+pwdEncrypt);
            user.setpassword(pwdEncrypt);
            user.setdob(request.getParameter("cdt"));
            user.setaddress(request.getParameter("txtAddress"));        
            user.setcity(request.getParameter("txtCity")); 
            user.setstate(request.getParameter("txtState"));
            user.setpin(request.getParameter("txtPin"));
            user.settelephone(request.getParameter("txtTelephone"));
            user.setfax(request.getParameter("txtFax"));
            user.setemail(request.getParameter("txtcEmail"));
            user.setrole(request.getParameter("cboRole"));
            user.setcreated_date(formattedDate);
            user.setcustomer_id(temp);
            user.setcreatedBy(request.getParameter("userId"));
            user.setaccNum(request.getParameter("txtAccNum"));
            user.setaccType(request.getParameter("cboAcctype"));
            user.setammount(request.getParameter("txtAmmount"));
            user.setaccStatus(request.getParameter("status"));
            user.setmotherName(request.getParameter("txtMoName"));
            String Rights=udet.Rights(request.getParameter("cboRole"));
            System.out.println("insert Rights--->"+Rights);
            user.setRights(Rights);
           
           lbean.setImage(request.getParameter("Image"));
           String strpath=request.getParameter("Image");
           System.out.println("1***"+strpath);
           String filepath=strpath.substring(strpath.lastIndexOf("\\")+1);
           System.out.println("2***"+filepath);
          
            //message=udet.AddUserTable(user);
            message=alldet.AddUserTable(user,lbean,filepath);
      	 if(message!="")
			{	
      		HttpSession sMessage = request.getSession(true);
            //System.out.println(sUserDept.getId());
            
      		sMessage.setAttribute("message",message);
			
			String L_url1=response.encodeRedirectURL("addNewuser.jsp");
			response.sendRedirect(L_url1);	
			
		}
		else
		{
			
			String L_url1=response.encodeRedirectURL("addNewuser.jsp");
			response.sendRedirect(L_url1);	
		}	
            
            }
            else{
                
            user.setfirstName(request.getParameter("txtcFName"));
            user.setlastName(request.getParameter("txtclName"));
            user.setgender(request.getParameter("cgender"));
           // user.setloginName(request.getParameter("txtuName"));
            user.setdob(request.getParameter("cdt"));
            user.setaddress(request.getParameter("txtAddress"));        
            user.setcity(request.getParameter("txtCity")); 
            user.setstate(request.getParameter("txtState"));
            user.setpin(request.getParameter("txtPin"));
            user.settelephone(request.getParameter("txtTelephone"));
            user.setfax(request.getParameter("txtFax"));
            user.setemail(request.getParameter("txtcEmail"));
            user.setrole(request.getParameter("cboRole"));
            user.setcreated_date(formattedDate);
            user.setcreatedBy(request.getParameter("userId"));
            user.setaccType(request.getParameter("cboAcctype"));
            user.setammount(request.getParameter("txtAmmount"));
            user.setaccStatus(request.getParameter("status"));
            user.setcustomer_id(request.getParameter("custId"));
            user.setmotherName(request.getParameter("txtMoName"));
             String amtype="Update";
            user.setammountType(amtype);
            String Rights=udet.Rights(request.getParameter("cboRole"));
            System.out.println("update Rights--->"+Rights);
            user.setRights(Rights);
           lbean.setImageID(request.getParameter("ImgId"));
           lbean.setImage(request.getParameter("Image"));
           String strpath=request.getParameter("Image");
           System.out.println("1***"+strpath);
           String filepath=strpath.substring(strpath.lastIndexOf("\\")+1);
           System.out.println("2***"+filepath);
            message=udet.updateAddUserTable(user,lbean,filepath);
      	 if(message!="")
			{	
      		HttpSession sMessage = request.getSession(true);
            //System.out.println(sUserDept.getId());
            
      		sMessage.setAttribute("message",message);
			
			String L_url1=response.encodeRedirectURL("editUser.jsp");
			response.sendRedirect(L_url1);	
			
		}
		else
		{
			
			String L_url1=response.encodeRedirectURL("editUser.jsp");
			response.sendRedirect(L_url1);	
		}	
            }
                    
    }
         catch(Exception ex){
         System.out.println("Exception in ADDUSER servlet"+ex.getMessage());    
         }
    }
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }
    
    /** Returns a short description of the servlet.
     */
    public String getServletInfo() {
        return "Short description";
    }
    // </editor-fold>
}
