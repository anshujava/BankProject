/*
 * sUserRights.java
 *
 * Created on March 1, 2011, 7:49 PM
 */

package servlet;

import bean.LoginBean;
import bean.*;
import generalClass.*;
import commonFunction.GeneralBean;
import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;

/**
 *
 * @author anshuman
 * @version
 */
public class sUserRights extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
                 LoginBean userRights = new LoginBean();
                 UserDetail udet = new UserDetail();
                 GeneralBean cfun = new GeneralBean();
                 CryptoLibrary cl = new CryptoLibrary();
         try 
         {
          String str=request.getParameter("hidval");
          if(str.equalsIgnoreCase("allrights"))
		{
          String val1=cfun.CheckVal(request.getParameter("AddUser"))+","+cfun.CheckVal(request.getParameter("EditUser"))+","+cfun.CheckVal(request.getParameter("ViewUserDetail"))+","+cfun.CheckVal(request.getParameter("BalanceEnquiry"))+","+cfun.CheckVal(request.getParameter("Transfer"))+","+cfun.CheckVal(request.getParameter("Withdraw"))+","+cfun.CheckVal(request.getParameter("MiniStatement"))+","+cfun.CheckVal(request.getParameter("ItemizesSratement"))+","+cfun.CheckVal(request.getParameter("UserRights"))+","+cfun.CheckVal(request.getParameter("changePassword"))+",";
          userRights.setuserRights(val1);
          String userId=request.getParameter("userId");
          String role=request.getParameter("role");
          System.out.println("Role in servlet-"+role);
          udet.updateRights(userRights,userId,role);
          
          String L_url1=response.encodeRedirectURL("userRights.jsp");
          response.sendRedirect(L_url1);
          }
          else{
              String pw=request.getParameter("txtNewPassWord");	
              String encryptPWD=cl.encrypt(pw);
              String Status="YES";
              String userID=request.getParameter("userID");
              userRights.setPassword(encryptPWD);
              
              udet.updatePwd(userID,userRights,Status);
              String L_url1=response.encodeRedirectURL("changePassword.jsp");
             response.sendRedirect(L_url1);
          }
         }
         catch(Exception ex){
         System.out.println("Exception in sUserRights servlet"+ex.getMessage());  
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
