/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Database;
import java.util.Properties;
import java.sql.* ;
import java.io.* ;
/**
 *
 * @author ACER
 */
public class ConnectionFactory {
    static final String driver = "com.mysql.cj.jdbc.Driver";
    static final String url = "jdbc:mysql://localhost:3306/inventory_db";
    static String username;
    static String password;
    
    Properties prop;
    Connection conn =null;
    
    ResultSet rs=null;
    
    public ConnectionFactory(){
        //handle the configuration settings(DB connection) using Properties class of util package
        //for that load the xml file tht has usename and passwd
        try{
            prop=new Properties();
            prop.loadFromXML(new FileInputStream("lib/DBCredentials.xml"));//put inside try catch to catch any possible ecxception
            //and not just throw
        }
        catch(IOException e){
            e.printStackTrace();
        }
        username=prop.getProperty("username");
        password=prop.getProperty("password");
        //we can establiish connection here itself but im gonna do it outside
    }
    //method to connet to db
    public Connection getConn() {
        try {
            Class.forName(driver);
            conn = DriverManager.getConnection(url, username, password);
            System.out.println("Connected successfully.");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return conn;
    }
    //Login verification using checkLogin method
    public boolean checklogin(String username, String password, String userType){
        String query = "SELECT * FROM users WHERE username = ? AND password = ? AND usertype = ? ";
        try{
            Connection conn=getConn();
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, password);
            ps.setString(3, userType);
            rs=ps.executeQuery();
            if(rs.next())
                return true;
        }
        catch(SQLException e){
        }
        return false;
    }
}

