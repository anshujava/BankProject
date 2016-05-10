/*
 * pdfMini.java
 *
 * Created on February 25, 2011, 12:51 AM
 */

package servlet;

import java.awt.Color;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.rmi.PortableRemoteObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lowagie.text.Element;
import com.lowagie.text.Cell;
import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.Paragraph;
import com.lowagie.text.Table;
import com.lowagie.text.pdf.PdfWriter;
import generalClass.*;
import java.util.*;
/**
 *
 * @author anshuman
 * @version
 */
public class pdfItemized extends HttpServlet {
    
    /** Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     */
    protected void processRequest(HttpServletRequest req, HttpServletResponse resp)
    throws ServletException, IOException {
       
      try{ 
        String UserID=req.getParameter("userId");
        String fromDate=req.getParameter("from");
        String endDate=req.getParameter("end");
        String x = getServletContext().getRealPath("/");
        String xx = x+"itemizedst.pdf";
        PrintWriter out;
        String title= "Statement";
        resp.setContentType("text/html");		
        Document document = new Document();
        PdfWriter.getInstance(document, new FileOutputStream(xx));  
        document.open();
        document.add(new Paragraph("Statement Between:" +req.getParameter("txtstartdt")+" To "+req.getParameter("txtenddt")+"", new Font(Font.TIMES_NEW_ROMAN, 14, Font.BOLD))); 
        document.add(new Paragraph(" "));
        document.add(new Paragraph("Name  :  "+req.getParameter("fName")+" "+req.getParameter("lName")+""));
        document.add(new Paragraph("Account No  :  "+req.getParameter("accNo")));
        out =resp.getWriter();
        Table aTable = new Table(4);
	aTable.setPadding(2);
        aTable.setSpacing(0);
        aTable.setWidth(113);
        Cell cell=new Cell();
        cell = new Cell(new Paragraph("Date & Time", new Font(Font.TIMES_NEW_ROMAN, 12, Font.BOLD)));
        cell.setGrayFill(0.75f);
        cell.setHorizontalAlignment(Element.ALIGN_CENTER);
        cell.setNoWrap(true);      
        cell.setColspan(1);
        aTable.addCell(cell);


         cell = new Cell(new Paragraph("Transaction Type", new Font(Font.TIMES_NEW_ROMAN, 12, Font.BOLD)));
         cell.setGrayFill(0.75f);
         cell.setHorizontalAlignment(Element.ALIGN_CENTER);
         cell.setNoWrap(true);      
         cell.setColspan(1);
         aTable.addCell(cell);
         
         cell = new Cell(new Paragraph("Ammount", new Font(Font.TIMES_NEW_ROMAN, 12, Font.BOLD)));
         cell.setGrayFill(0.75f);
         cell.setHorizontalAlignment(Element.ALIGN_CENTER);
         cell.setNoWrap(true);      
         cell.setColspan(1);
         aTable.addCell(cell);
         
         cell = new Cell(new Paragraph("Balance", new Font(Font.TIMES_NEW_ROMAN, 12, Font.BOLD)));
         cell.setGrayFill(0.75f);
         cell.setHorizontalAlignment(Element.ALIGN_CENTER);
         cell.setNoWrap(true);      
         cell.setColspan(1);
         aTable.addCell(cell);
    	 
          Vector vReq=new Vector();
          UserDetail udet = new UserDetail();
          vReq= udet.itemizedStatement(UserID,fromDate,endDate);

          for(int i=0;i<vReq.size();i++)
          {
          String temp[]=new String[20];
          temp = (String[])vReq.get(i);
          cell = new Cell(temp[0]);
          cell.setNoWrap(true);
          cell.setColspan(1);
          aTable.addCell(cell);

          cell = new Cell(temp[1]);			 
          cell.setNoWrap(true);
          cell.setColspan(1);
          aTable.addCell(cell);
          
          cell = new Cell(temp[2]);			 
          cell.setNoWrap(true);
          cell.setColspan(1);
          aTable.addCell(cell);
          
          cell = new Cell(temp[3]);			 
          cell.setNoWrap(true);
          cell.setColspan(1);
          aTable.addCell(cell);
          }
          
          document.add(aTable);
          document.add(new Paragraph("Available Balance  :  "+req.getParameter("avlBal")));
          out =resp.getWriter();
          document.close();
          resp.sendRedirect("itemizedst.pdf");
          out.close();
          }
       catch(Exception ex){
       System.out.println("Exception in pdfMini->"+ex.getMessage());
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
