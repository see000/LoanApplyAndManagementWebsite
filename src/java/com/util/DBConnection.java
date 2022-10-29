/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.util;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author seepa
 */
public class DBConnection {
    private static Connection myConnection = null;
    private static String myURL ="jdbc:mysql://localhost/3502project";

    public DBConnection() {
    }
    
    public static Connection getConnection() throws ClassNotFoundException{
        if(myConnection!=null){
            return myConnection;
        }else try {
            Class.forName("com.mysql.jdbc.Driver");
            myConnection = DriverManager.getConnection(myURL, "root", "admin");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return myConnection;
    }
    
    public void closeConnection() throws ClassNotFoundException{
            try {
                myConnection.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
    }
}
