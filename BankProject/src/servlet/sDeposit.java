/*
 * sDeposit.java
 *
 * Created on February 23, 2011, 12:42 AM
 */

package servlet;

import java.io.*;
import java.net.*;
import java.text.*;
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
public class sDeposit extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
                 userBean user = new userBean();
                 UserDetail udet = new UserDetail();
                 GeneralBean cfun = new GeneralBean();
                 
      try 
         {
          
          String str=request.getParameter("txtType");
            if(str.equalsIgnoreCase("Deposite"))
		{
          user.setfromAccno(request.getParameter("txtFromaccNo"));
          user.settoAccno(request.getParameter("cboAccnum"));
          user.setfirstName(request.getParameter("txtcFName"));
          user.setaccType(request.getParameter("txtAcctype"));
          user.setcreated_date(request.getParameter("txtTodayDt"));
          user.setcustomer_id(request.getParameter("txtAccId"));
          
          double temp_oldAmmount=udet.getAmmount(request.getParameter("txtAccId"));
          System.out.println("temp_oldAmmount1-"+temp_oldAmmount);
          
          double depositAmmount=Double.valueOf(request.getParameter("txtAmmount").trim()).doubleValue();
                 
          double total_value=temp_oldAmmount+depositAmmount;
          System.out.println("total Balance2-"+total_value);
         
          String myval1=Double.toString(total_value);
          System.out.println("total Balance3-"+myval1);
          String AmountType="Credited";
          user.setammountType(AmountType);
          user.setdepositdAmmount(request.getParameter("txtAmmount"));
          user.setdepositAmmount(myval1);
          udet.updateAccountBalance(user,AmountType);
          
          double temp_avlAmmount=udet.getAmmount(request.getParameter("userId"));
          System.out.println("from db-"+temp_avlAmmount);
          double avlAmmount=Double.valueOf(request.getParameter("txtAmmount").trim()).doubleValue();
          double total_avlbal;
          total_avlbal=temp_avlAmmount-avlAmmount;
         
          String myavl1=Double.toString(total_avlbal);
          String uId=request.getParameter("userId");
          System.out.println("my balance now-"+myavl1);  
          String ammount_type="Transfered";
          String trasfer_ammount=request.getParameter("txtAmmount");
          udet.updateBalance(myavl1,uId,ammount_type,trasfer_ammount);
          String L_url1=response.encodeRedirectURL("deposit.jsp");
	  response.sendRedirect(L_url1);
            }
            else{
              user.setaccNum(request.getParameter("txtFromaccNo"));
              user.setfirstName(request.getParameter("txtFName"));
              
              user.setcreated_date(request.getParameter("txtTodayDt")) ;
              double temp_oldAmmount=udet.getAmmount(request.getParameter("userId"));
             
              double withdrawAmmount=Double.valueOf(request.getParameter("txtwdAmmount").trim()).doubleValue();
              double total_value;
              total_value=temp_oldAmmount-withdrawAmmount;
              
              String myval1=Double.toString(total_value);
              String AmountType="Withdrawl";
              user.setammountType(AmountType);
              user.setwithdrawAmmount(request.getParameter("txtwdAmmount"));
              user.setdepositAmmount(myval1);
              udet.updateAccountBalance(user,AmountType);
          
              String L_url1=response.encodeRedirectURL("withdraw.jsp");
              response.sendRedirect(L_url1);
            }
     }
     catch(Exception ex){
         System.out.println("Exception in sDeposit servlet"+ex.getMessage());    
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
