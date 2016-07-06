package dlnu.hrsys.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * 数据库连接工具类
 *
 * Created by hu60 on 2016-06-29.
 */
public class DBUtil {
    private static Connection conn = null; //数据库连接
    private static final String driver = "com.mysql.jdbc.Driver";
    private static final String host = "localhost";
    private static final String database = "hrsys";
    private static final String username = "root";
    private static final String password = "";

    public static Connection getConn() throws DBException {
        try {
            if (conn == null) {
                Class.forName(driver);
                String dbUrl = "jdbc:mysql://" + host + "/" + database + "?useUnicode=true&characterEncoding=UTF-8";
                conn = DriverManager.getConnection(dbUrl, username, password);
            }

            return conn;

        } catch (ClassNotFoundException ex) {
            //驱动未找到
            throw new DBException("JDBC驱动程序 " + driver + " 未找到！");
        } catch (SQLException ex) {
            throw new DBException("连接数据库失败：" + ex.getMessage());
        }
    }

    public static class DBException extends Exception {
        public DBException(String msg) {
            super(msg);
        }
    }
}
