/*
 * user.java
 *
 * Created on February 19, 2011, 6:12 PM
 *
 * To change this template, choose Tools | Template Manager
 * and open the template in the editor.
 */

package bean;
import java.io.Serializable;
/**
 *
 * @author anshuman
 */
public class userBean implements Serializable{
         String firstName="";
	  public String getfirstName() {
		return firstName;
	}
	public void setfirstName(String firstName) {
		this.firstName = firstName;
	}

         String lastName="";
	  public String getlastName() {
		return lastName;
	}
	public void setlastName(String lastName) {
		this.lastName = lastName;
	}
        
        String gender="";
	  public String getgender() {
		return gender;
	}
	public void setgender(String gender) {
		this.gender = gender;
	}
        String loginName="";
	  public String getloginName() {
		return loginName;
	}
	public void setloginName(String loginName) {
		this.loginName = loginName;
	}
        
        String motherName="";
	  public String getmotherName() {
		return motherName;
	}
	public void setmotherName(String motherName) {
		this.motherName = motherName;
	}
        String dob="";
	  public String getdob() {
		return dob;
	}
	public void setdob(String dob) {
		this.dob = dob;
	}
       String address="";
	  public String getaddress() {
		return address;
	}
	public void setaddress(String address) {
		this.address = address;
	}
        String city="";
	  public String getcity() {
		return city;
	}
	public void setcity(String city) {
		this.city = city;
	}
        String state="";
	  public String getstate() {
		return state;
	}
	public void setstate(String state) {
		this.state = state;
	}
        String pin="";
	  public String getpin() {
		return pin;
	}
	public void setpin(String pin) {
		this.pin = pin;
	}
        String telephone="";
	  public String gettelephone() {
		return telephone;
	}
	public void settelephone(String telephone) {
		this.telephone = telephone;
	}
        String fax="";
	  public String getfax() {
		return fax;
	}
	public void setfax(String fax) {
		this.fax = fax;
	}
        String email="";
	  public String getemail() {
		return email;
	}
	public void setemail(String email) {
		this.email = email;
	}
        String role="";
	  public String getrole() {
		return role;
	}
	public void setrole(String role) {
		this.role = role;
	}
        String created_date="";
	  public String getcreated_date() {
		return created_date;
	}
	public void setcreated_date(String created_date) {
		this.created_date = created_date;
	}
        String customer_id="";
	  public String getcustomer_id() {
		return customer_id;
	}
	public void setcustomer_id(String customer_id) {
		this.customer_id = customer_id;
	}
        String createdBy="";
	  public String getcreatedBy() {
		return createdBy;
	}
	public void setcreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
        String accNum="";
	  public String getaccNum() {
		return accNum;
	}
	public void setaccNum(String accNum) {
		this.accNum = accNum;
	}
        String accType="";
	  public String getaccType() {
		return accType;
	}
	public void setaccType(String accType) {
		this.accType = accType;
	}
        String ammount="";
	  public String getammount() {
		return ammount;
	}
	public void setammount(String ammount) {
		this.ammount = ammount;
	}
        String accStatus="";
	  public String getaccStatus() {
		return accStatus;
	}
	public void setaccStatus(String accStatus) {
		this.accStatus = accStatus;
	}
        
        String fromAccno="";
	  public String getfromAccno() {
		return fromAccno;
	}
	public void setfromAccno(String fromAccno) {
		this.fromAccno = fromAccno;
	}
        String toAccno="";
	  public String gettoAccno() {
		return toAccno;
	}
	public void settoAccno(String toAccno) {
		this.toAccno = toAccno;
	}
        String depositAmmount="";
	  public String getdepositAmmount() {
		return depositAmmount;
	}
	public void setdepositAmmount(String depositAmmount) {
		this.depositAmmount = depositAmmount;
	}
        String depositdAmmount="";
	  public String getdepositdAmmount() {
		return depositdAmmount;
	}
	public void setdepositdAmmount(String depositdAmmount) {
		this.depositdAmmount = depositdAmmount;
	}
        String ammountType="";
	  public String getammountType() {
		return ammountType;
	}
	public void setammountType(String ammountType) {
		this.ammountType = ammountType;
	}
        String withdrawAmmount="";
	  public String getwithdrawAmmount() {
		return withdrawAmmount;
	}
	public void setwithdrawAmmount(String withdrawAmmount) {
		this.withdrawAmmount = withdrawAmmount;
	}
        String Rights="";
	  public String getRights() {
		return Rights;
	}
          public void setRights(String Rights) {
		this.Rights = Rights;
	}
          
          String password="";
	  public String getpassword() {
		return password;
	}
	public void setpassword(String password) {
		this.password = password;
	}
	
        private String OPwd;
        public String getOPwd()
	{
		return OPwd;
	}
	
	public void setOPwd(String password)
    {
  	  
  	  OPwd=password;
    }
        public String checkOpwd(String strPwd){
	   System.out.println("strPwd   : "+strPwd);
	   System.out.println("OPwd     : "+OPwd);
		if(strPwd.trim().equals(OPwd.trim()))
		
			return "true";
			System.out.println("Value     True           : ");
		return "false";
	}
}
