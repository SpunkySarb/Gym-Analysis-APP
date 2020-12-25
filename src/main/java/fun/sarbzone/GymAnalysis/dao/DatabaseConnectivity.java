package fun.sarbzone.GymAnalysis.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import fun.sarbzone.GymAnalysis.model.DatasetModel;

public class DatabaseConnectivity {

  private int errorReport;
    
        public int getErrorReport() {
    return errorReport;
}




public void setErrorReport(int errorReport) {
    this.errorReport = errorReport;
}



        static Connection conn = null;
    
        public DatabaseConnectivity() {

            try {
                conn = DriverManager.getConnection(
                        "jdbc:mysql://b73e8b2da097bf:230bb71f@us-cdbr-east-02.cleardb.com/heroku_f4508dd8db2c12e?tcpKeepAlive=true&reconnect=true");


                System.out.println("Log : Connected To Database");
            } catch (SQLException ex) {
                // handle any errors
                System.out.println("SQLException: " + ex.getMessage());
                System.out.println("SQLState: " + ex.getSQLState());
                System.out.println("VendorError: " + ex.getErrorCode());
            }


        } 
  
    
    
        
      public void addData(String userName,int days, int yAxis, String date) {
          
          Statement addStmt = null;

          try {
              addStmt = conn.createStatement();
              addStmt.executeUpdate("INSERT INTO `gymdata` (`username`, `days`, `yaxis`, `date`) VALUES ('"+userName+"', '"+days+"', '"+yAxis+"', '"+date+"');");
              addStmt.close();
            
              setErrorReport(0); // Error report zero if data got inserted
              
          } catch (SQLException ex) {
              // handle any errors
              
              setErrorReport(1); // Error report zero if data got inserted

              
              System.out.println("SQLException: " + ex.getMessage());
              System.out.println("SQLState: " + ex.getSQLState());
              System.out.println("VendorError: " + ex.getErrorCode());
          }
          
          
          
      }
        
        
        
      public ArrayList<DatasetModel> readUserData(String userName) {
          
          ArrayList<DatasetModel> list = new ArrayList<>();
          
          
          Statement stmt = null;
          ResultSet rs = null;

          try {
              stmt = conn.createStatement();
              rs = stmt.executeQuery("SELECT * FROM gymdata where username = '"+userName+"' order by timestamp asc;");

              while (rs.next()) {

                  DatasetModel data = new DatasetModel();
                  
                  data.setUserName(rs.getString("username"));
                  data.setDays(rs.getInt("days"));
                  data.setyAxis(rs.getInt("yaxis"));
                  
                  list.add(data);
                  
                
              }
              stmt.close();
              
          } catch (SQLException ex) {
              // handle any errors
              System.out.println("SQLException: " + ex.getMessage());
              System.out.println("SQLState: " + ex.getSQLState());
              System.out.println("VendorError: " + ex.getErrorCode());
          }
          
        return list;
      }
    
    
    
    
    
}
