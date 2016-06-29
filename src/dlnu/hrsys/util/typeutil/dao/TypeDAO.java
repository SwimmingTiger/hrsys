package dlnu.hrsys.util.typeutil.dao;

import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.typeutil.entity.TypeItem;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by hu60 on 2016-06-29.
 */
public class TypeDAO {
    private Connection conn = null;

    public TypeDAO() throws DBUtil.DBException {
        conn = DBUtil.getConn();
    }

    public TypeItem getItemById(int id) {
        TypeItem item = null;

        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM type_item WHERE id = ?");
            pst.setInt(1, id);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                item = new TypeItem();
                item.setId(id);
                item.setName(rs.getString("name"));
                item.setGroupId(rs.getInt("group_id"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }
}
