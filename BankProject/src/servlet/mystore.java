package servlet;

import generalClass.UserDetail;
import java.io.File;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;

import commonFunction.*;

/**
 * Servlet implementation class for Servlet: mystore
 *
 */
 public class mystore extends javax.servlet.http.HttpServlet implements javax.servlet.Servlet {
    /* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#HttpServlet()
	 */
	public mystore() {
		super();
	}   	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}  	
	
	/* (non-Java-doc)
	 * @see javax.servlet.http.HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("In store servlet");
		     GeneralBean cfun = new GeneralBean();
		     String temp= cfun.getGenerateId("IMAGEID");
           System.out.println("image--->"+request.getParameter("fileInput"));
		    
          System.out.println("id--->"+temp);
          LoginBean objDetail = new LoginBean();
          objDetail.setImageID(temp);
          objDetail.setImage(request.getParameter("fileInput"));
          UserDetail udet = new UserDetail();
          String strpath=request.getParameter("fileInput");
          String filepath=strpath.substring(strpath.lastIndexOf("\\")+1);
          System.out.println("***"+filepath);
          udet.addImage(objDetail,filepath);
          
           String L_url1=response.encodeRedirectURL("newViewImage.jsp");
           response.sendRedirect(L_url1);	

		
	}
	catch(Exception e)
	{
		System.err.println("Exception in AddStoreImage"+e.getMessage());
	}
	}   	  	    
}