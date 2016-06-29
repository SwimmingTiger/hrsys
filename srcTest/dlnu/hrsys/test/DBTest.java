package dlnu.hrsys.test;

import dlnu.hrsys.util.DBUtil;
import junit.framework.TestCase;

import java.sql.Connection;

/**
 * 数据库连接单元测试
 *
 * Created by hu60 on 2016-06-29.
 */
public class DBTest extends TestCase {
    public void testConn() {
        try {
            Connection conn = DBUtil.getConn();
            System.out.println(conn);
            assertTrue(true);
        } catch (DBUtil.DBException e) {
            e.printStackTrace();
            assertTrue(false);
        }
    }
}
