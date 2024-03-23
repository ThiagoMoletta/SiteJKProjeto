
package br.com.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class ConexaoDAO {
    
    
   public Connection conexaoBD() throws ClassNotFoundException {
       Connection con =null;
       try {
           Class.forName("com.mysql.cj.jdbc.Driver");           
           String url = "jdbc:mysql://localhost:3307/sitejkprojeto?user=thiagomoletta&password=thiagomoletta123&serverTimezone=UTC";

           con = DriverManager.getConnection(url);
       } catch (SQLException e) {
           
       }
       return con;
   }
   
   
    
}
