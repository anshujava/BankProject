/*
 * NewServlet.java
 *
 * Created on February 19, 2011, 10:26 PM
 */

package servlet;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.*;
import generalClass.*;
import commonFunction.*;

/**
 *
 * @author anshuman
 * @version
 */
public class NewServlet extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
       System.out.println("in servlet");
		String msg = "";
		String UserId="";
                GeneralBean cfun=new GeneralBean();
		HttpSession sUser = request.getSession(true);
                CryptoLibrary cl = new CryptoLibrary();
		try{
			 	            
			 
                                 LoginBean Objlogin = new LoginBean();
                                 UserDetail Objuser = new UserDetail();
				 String pw=request.getParameter("txtpassword");	
                                 String encryptPWD=cl.encrypt(pw);
                                 System.err.println("new servlet pwd->"+pw);
                                 System.err.println("new servlet encryptPWD->"+encryptPWD);
				 Objlogin.setUserName(request.getParameter("txtuserName"));
				 Objlogin.setPassword(encryptPWD);
				 msg = Objuser.CheckLogin(Objlogin);
				 UserId=Objuser.LoginUserID(Objlogin);
				 System.err.println("Messg in else"+msg);
			 
			
			if(msg!="")
				{	
				HttpSession sMsg = request.getSession(true);
	            //System.err.println(sUserDept.getId());
	            
				sMsg.setAttribute("msg",msg);
				sUser.setAttribute("UserId", UserId);
				String L_url1=response.encodeRedirectURL("./login.jsp?");
				response.sendRedirect(L_url1);	
       			
			}
			else
			{
				
                                sUser.setAttribute("UserId", UserId);
                               
	                        String pwdUserId = (String)sUser.getAttribute("UserId");
                                String changed_paswword_status = Objuser.changePwdStatus(pwdUserId);
                                 if(changed_paswword_status.equalsIgnoreCase("YES"))
                                 {
                                    sUser.setAttribute("UserId", UserId);
                                    String L_url1=response.encodeRedirectURL("./newPassword.jsp");
				    response.sendRedirect(L_url1);	
                                 }else{
                                sUser.setAttribute("UserId", UserId);
				String L_url1=response.encodeRedirectURL("./mainpage.jsp");
				response.sendRedirect(L_url1);	
                                 }
			}	
			
			
		}
		catch(Exception e)
		{
			System.err.println("Exception in sLogin Servlet:-"+e.getMessage());
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
