package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.*;
import commonFunction.GeneralBean;
import generalClass.UserDetail;
import generalClass.bookDetail;

/**
 * Servlet implementation class bookServlet
 */
public class bookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public bookServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			System.out.println("In bookServlet servlet");
		    book bookBean = new book();
		    bookDetail det = new bookDetail();
		    String myid=request.getParameter("myid");
		    System.out.println("myid=="+myid);
		    System.out.println(request.getParameter("hidval"));
		    if(request.getParameter("hidval").equalsIgnoreCase("Update")){
	        	
        	bookBean.setBookName(request.getParameter("bookName"));
		    bookBean.setBookAuthorName(request.getParameter("bookAuthor"));
		    bookBean.setId(request.getParameter("id"));
		    det.UpdateBookDetail(bookBean);
			    
	        }else if(request.getParameter("hidval").equalsIgnoreCase("Add"))
	        {
		    bookBean.setBookName(request.getParameter("txtBookName"));
		    bookBean.setBookAuthorName(request.getParameter("txtBookAuthorName"));
		    det.InsertBookDetailTable(bookBean);
            
	        }else if(request.getParameter("hidval").equalsIgnoreCase("Delete"))
	        {
	        	
	        	det.Delete(request.getParameter("myid"));
	        }else{
	        	String L_url1=response.encodeRedirectURL("./add_edit_delete_search/list.jsp");
	            response.sendRedirect(L_url1);	
	        }
	        String L_url1=response.encodeRedirectURL("./add_edit_delete_search/list.jsp");
            response.sendRedirect(L_url1);	
		
	}
	catch(Exception e)
	{
		System.err.println("Exception in bookServlet"+e.getMessage());
	}
	}   	  	    
}