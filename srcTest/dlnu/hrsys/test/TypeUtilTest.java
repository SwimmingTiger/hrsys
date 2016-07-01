package dlnu.hrsys.test;

import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.TypeUtil;
import dlnu.hrsys.util.typeutil.entity.TypeGroup;
import dlnu.hrsys.util.typeutil.entity.TypeItem;
import junit.framework.TestCase;

import java.sql.Connection;

/**
 * 数据库连接单元测试
 *
 * Created by hu60 on 2016-06-29.
 */
public class TypeUtilTest extends TestCase {
    private TypeUtil util = null;

    public void setUp() throws DBUtil.DBException {
        util = TypeUtil.getInstance();
    }

    public void testFindItem() {
        TypeItem item = util.getItem(1);

        assertTrue(item != null);

        assertEquals(item.getName(), "男");
    }

    public void testFindGroup() {
        TypeGroup group = util.getGroup(1);

        assertTrue(group != null);

        assertEquals(group.getName(), "性别");
    }

    public void testFindSexGroup() {
        TypeGroup group = util.getSexGroup();

        assertTrue(group != null);

        assertEquals(group.getName(), "性别");
        assertEquals(group.size(), 2);

        TypeItem item1 = group.get(0);
        TypeItem item2 = group.get(1);

        assertTrue(item1 != null && item2 != null);
        assertEquals(item1.getName(), "女");
        assertEquals(item2.getName(), "男");
    }

    public void testFindDegreeGroup() {
        TypeGroup group = util.getDegreeGroup();

        assertTrue(group != null);

        assertEquals(group.getName(), "学位");
        assertEquals(group.size(), 6);

        for (TypeItem item : group) {
            assertTrue(item != null);
            //System.out.println(item.getName());
        }
    }
}
