package dlnu.hrsys.test;

import dlnu.hrsys.util.DBUtil;
import junit.framework.TestCase;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by hu60 on 2016-06-29.
 */
public class NationalityTest extends TestCase {
    public void testInsertNationality() throws DBUtil.DBException, SQLException {
        List<String> list = new ArrayList<>();
        list.add("汉族");
        list.add("蒙古族");
        list.add("回族");
        list.add("藏族");
        list.add("维吾尔族");
        list.add("苗族");
        list.add("彝族");
        list.add("壮族（僮族）");
        list.add("满族");
        list.add("朝鲜族");
        list.add("达斡尔族");
        list.add("鄂温克族");
        list.add("鄂伦春族");
        list.add("赫哲族");
        list.add("土族");
        list.add("撒拉族");
        list.add("东乡族");
        list.add("保安族");
        list.add("裕固族");
        list.add("哈萨克族");
        list.add("柯尔克孜族");
        list.add("乌孜别克族");
        list.add("塔吉克族");
        list.add("塔塔尔族");
        list.add("锡伯族");
        list.add("俄罗斯族");
        list.add("瑶族");
        list.add("白族（民家）");
        list.add("傣族");
        list.add("哈民族");
        list.add("佤族");
        list.add("傈傈族");
        list.add("纳西族（么些）");
        list.add("拉祜族（倮黑）");
        list.add("景颇族");
        list.add("布朗族（濮曼）");
        list.add("阿昌族");
        list.add("怒族");
        list.add("德昂族（崩龙）");
        list.add("独龙族");
        list.add("普米族");
        list.add("门巴族");
        list.add("布依族（仲家）");
        list.add("水族（水家）");
        list.add("仡佬族");
        list.add("侗族");
        list.add("土家族");
        list.add("羌族");
        list.add("仫佬族");
        list.add("毛南族（毛难）");
        list.add("珞巴族");
        list.add("基诺族");
        list.add("黎族");
        list.add("京族");
        list.add("畲族");
        list.add("高山族");
        list.add("苦聪人");
        list.add("登人");
        list.add("穿青人");
        list.add("瓦乡人（仡熊）");

        Connection conn = DBUtil.getConn();
        PreparedStatement pst = conn.prepareStatement("INSERT INTO type_item(name, group_id) VALUES(?, ?)");

        pst.setInt(2, 5);

        for (String name : list) {
            pst.setString(1, name);
            pst.executeUpdate();
        }
    }
}
