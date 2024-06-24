package buyme;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB {
    
    public ApplicationDB() {
    }

    public Connection getConnection() {
        String connectionUrl = "jdbc:mysql://127.0.0.1:3306/auctionsystem?useSSL=true&requireSSL=true";
        Connection connection = null;
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection(connectionUrl, Constants.USERNAME, Constants.PASSWORD);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return connection;
    }
    
    public void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    
    public static void main(String[] args) {
        ApplicationDB dao = new ApplicationDB();
        Connection connection = dao.getConnection();
        
        System.out.println(connection);
        dao.closeConnection(connection);
    }
}

