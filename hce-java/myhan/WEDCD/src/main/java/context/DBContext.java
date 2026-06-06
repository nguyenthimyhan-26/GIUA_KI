package context;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBContext {

    private static final String URL =
            "jdbc:sqlserver://127.0.0.1:1433;"
            + "databaseName=LaptopStore;"
            + "encrypt=true;"
            + "trustServerCertificate=true";

    private static final String USER = "sa";

    private static final String PASS = "Vietnam@123";

    public static Connection getConnection() {

        try {

            Class.forName(
                    "com.microsoft.sqlserver.jdbc.SQLServerDriver"
            );

            return DriverManager.getConnection(
                    URL,
                    USER,
                    PASS
            );

        } catch (Exception e) {

            e.printStackTrace();

        }

        return null;
    }
}