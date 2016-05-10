package bean;
import java.io.Serializable;
public class LoginBean implements Serializable {
	String userName="";
	  public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	String password="";
        String userRights="";
	  public String getuserRights() {
		return userRights;
	}
	public void setuserRights(String userRights) {
		this.userRights = userRights;
	}
         String ImageID="";
	  public String getImageID() {
		return ImageID;
	}
	public void setImageID(String ImageID) {
		this.ImageID = ImageID;
	}
         String Image="";
	  public String getImage() {
		return Image;
	}
	public void setImage(String Image) {
		this.Image = Image;
	}
        String user="";
	  public String getuser() {
		return user;
	}
	public void setuser(String user) {
		this.user = user;
	}
}
