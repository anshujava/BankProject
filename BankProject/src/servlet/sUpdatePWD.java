/*
 * sUpdatePWD.java
 *
 * Created on March 6, 2011, 1:36 AM
 */

package servlet;

import java.io.*;
import java.net.*;

import javax.servlet.*;
import javax.servlet.http.*;
import bean.*;
import generalClass.*;
/**
 *
 * @author anshuman
 * @version
 */
public class sUpdatePWD extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
                 LoginBean userRights = new LoginBean();
                 UserDetail udet = new UserDetail();
                  CryptoLibrary cl = new CryptoLibrary();
            try 
         {
              String pw=request.getParameter("txtNewPassWord");	
              String encryptPWD=cl.encrypt(pw);
              String Status="NO";
              String userID=request.getParameter("userID");
              userRights.setPassword(encryptPWD);
              udet.updatePwd(userID,userRights,Status);
              String L_url1=response.encodeRedirectURL("./login.jsp");
              response.sendRedirect(L_url1);
                 }
                 catch(Exception ex){
                    System.out.println("Exception in sUpdatePWD servlet"+ex.getMessage());  
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
