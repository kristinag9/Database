package database;

import java.sql.*;

public class Guests {
    public static void main(String[] args) {
        Connection myConnection;
        Statement myStatement;
        ResultSet myResultSet;
        String query = "SELECT * FROM FN71840.GUESTS_AGE_NAME";

        try {
            myConnection = DriverManager.getConnection("jdbc:db2://62.44.108.24:50000/SAMPLE",
                    "db2admin", "db2admin");
            myStatement = myConnection.createStatement();
            myResultSet = myStatement.executeQuery(query);
            while(myResultSet.next()) {
                String egn = myResultSet.getString("EGN");
                String name = myResultSet.getString("NAME");
                int age = myResultSet.getInt("AGE");
                String phone = myResultSet.getString("PHONE_NUMBER");
                System.out.printf("%s: %s, %s: %s, %s: %d, %s: %s\n", "EGN", egn, "NAME", name, "AGE", age,
                        "PHONE_NUMBER", phone);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
