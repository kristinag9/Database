package database;

import java.sql.*;

public class Rooms {
    public static void main(String[] args) {
        Connection myConnection;
        Statement myStatement;
        ResultSet myResultSet;
        String query = "SELECT * FROM FN71840.AUDIT_ROOM";

        try {
            myConnection = DriverManager.getConnection("jdbc:db2://62.44.108.24:50000/SAMPLE",
                    "db2admin", "db2admin");
            myStatement = myConnection.createStatement();
            myResultSet = myStatement.executeQuery(query);
            while(myResultSet.next()) {
                String ctime_reg = myResultSet.getString("CTIME_REG");
                String text = myResultSet.getString("TEXT");
                System.out.printf("%s: %s, %s: %s\n", "CTIME_REG", ctime_reg, "TEXT",text);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
