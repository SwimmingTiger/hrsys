package dlnu.hrsys.util.typeutil.dao;

import com.sun.istack.internal.Nullable;
import dlnu.hrsys.util.DBUtil;
import dlnu.hrsys.util.typeutil.entity.TypeGroup;
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

    @Nullable
    public TypeItem getItemById(int itemId) {
        TypeItem item = null;

        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM type_item WHERE id = ?");
            pst.setInt(1, itemId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                item = new TypeItem();
                item.setId(itemId);
                item.setName(rs.getString("name"));
                item.setGroupId(rs.getInt("group_id"));
            }

            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return item;
    }

    @Nullable
    public TypeGroup getGroupById(int groupId) {
        TypeGroup group = null;

        try {
            PreparedStatement pst = conn.prepareStatement("SELECT * FROM type_group WHERE id = ?");
            pst.setInt(1, groupId);

            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                group = new TypeGroup();
                group.setId(groupId);
                group.setName(rs.getString("name"));

                PreparedStatement itemPst = conn.prepareStatement("SELECT * FROM type_item WHERE group_id = ?");
                itemPst.setInt(1, groupId);
                ResultSet itemRs = itemPst.executeQuery();

                while (itemRs.next()) {
                    TypeItem item = new TypeItem();
                    item.setId(itemRs.getInt("id"));
                    item.setName(itemRs.getString("name"));
                    item.setGroupId(groupId);
                    group.add(item);
                }
            }

            pst.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return group;
    }
    
	public TypeGroup getLeaveJobs() {
		TypeGroup group = new TypeGroup();

		try {
			PreparedStatement itemPst = conn
					.prepareStatement("SELECT DISTINCT job FROM employee_leave_record");
			ResultSet itemRs = itemPst.executeQuery();

			while (itemRs.next()) {
				TypeItem item = new TypeItem();
				item.setName(itemRs.getString("job"));
				group.add(item);
			}

			itemPst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return group;
	}
	
	public TypeGroup getLeaveDepartments() {
		TypeGroup group = new TypeGroup();

		try {
			PreparedStatement itemPst = conn
					.prepareStatement("SELECT DISTINCT department FROM employee_leave_record");
			ResultSet itemRs = itemPst.executeQuery();

			while (itemRs.next()) {
				TypeItem item = new TypeItem();
				item.setName(itemRs.getString("department"));
				group.add(item);
			}

			itemPst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return group;
	}
}
