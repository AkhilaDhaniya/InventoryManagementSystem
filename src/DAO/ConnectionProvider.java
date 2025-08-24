/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author ACER
 */
public class ConnectionProvider {
    public static Connection getCon(){
        try{
           //It dynamically loads the driver class into memory at runtime, so the driver gets registered with the JDBC DriverManager.
           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory_db?useSSL=false","root","root");
        }
        catch(Exception e){
           System.out.println(e);
           return null;
        }
        return null;
    }
    
}
