package dlnu.hrsys.util;

import com.sun.istack.internal.Nullable;
import dlnu.hrsys.util.typeutil.dao.TypeDAO;
import dlnu.hrsys.util.typeutil.entity.TypeGroup;
import dlnu.hrsys.util.typeutil.entity.TypeItem;

/**
 * 类型工具类
 *
 * Created by hu60 on 2016-06-29.
 */

public class TypeUtil {
    public static final int TYPE_SEX = 1;
    public static final int TYPE_HIRE = 2;
    public static final int TYPE_HR = 3;
    public static final int TYPE_POLITICS_STATUS = 4;
    public static final int TYPE_NATIONALITY = 5;
    public static final int TYPE_BLOOD = 6;
    public static final int TYPE_MARITAL_STATUS = 7;
    public static final int TYPE_EDUCATION_STATUS = 8;
    public static final int TYPE_DEGREE = 9;
    public static final int TYPE_JOB = 10;
    public static final int TYPE_DEPARTMENT = 11;
    public static final int TYPE_LEAVE_REASON = 12;

    //正式员工
    public static final int TYPE_NORMAL_EMPLOYEE = 3;
    //试用期员工
    public static final int TYPE_PROBATION_EMPLOYEE = 4;

    private static TypeUtil instance = null;

    private TypeDAO dao = null;

    private TypeUtil() throws DBUtil.DBException {
        dao = new TypeDAO();
    }

    public static TypeUtil getInstance() throws DBUtil.DBException {
        if (instance == null) {
            instance = new TypeUtil();
        }

        return instance;
    }
    
    public static String getItemName(int itemId) throws DBUtil.DBException {
    	return getInstance().getItem(itemId).getName();
    }

    @Nullable
    public TypeItem getItem(int itemId) {
        return dao.getItemById(itemId);
    }

    @Nullable
    public TypeGroup getGroup(int groupId) {
        return dao.getGroupById(groupId);
    }

    public TypeGroup getSexGroup() {
        return getGroup(TYPE_SEX);
    }

    public TypeGroup getHireTypeGroup() {
        return getGroup(TYPE_HIRE);
    }

    public TypeGroup getHrTypeGroup() {
        return getGroup(TYPE_HR);
    }

    public TypeGroup getPoliticsStatusGroup() {
        return getGroup(TYPE_POLITICS_STATUS);
    }

    public TypeGroup getNationalityGroup() {
        return getGroup(TYPE_NATIONALITY);
    }

    public TypeGroup getBloodTypeGroup() {
        return getGroup(TYPE_BLOOD);
    }

    public TypeGroup getMaritalStatusGroup() {
        return getGroup(TYPE_MARITAL_STATUS);
    }

    public TypeGroup getEducationStatusGroup() {
        return getGroup(TYPE_EDUCATION_STATUS);
    }

    public TypeGroup getDegreeGroup() {
        return getGroup(TYPE_DEGREE);
    }

    public TypeGroup getJobTypeGroup() {
        return getGroup(TYPE_JOB);
    }

    public TypeGroup getDepartmentGroup() {
        return getGroup(TYPE_DEPARTMENT);
    }

    public TypeGroup getLeaveReasonGroup() {
        return getGroup(TYPE_LEAVE_REASON);
    }
    
    public TypeGroup getLeaveDepartmentGroup() {
        return dao.getLeaveDepartments();
    }

    public TypeGroup getLeaveJobGroup() {
        return dao.getLeaveJobs();
    }

    public TypeGroup getDepartments() {
        return dao.getDepartments();
    }

    public TypeGroup getJobs() {
        return dao.getJobs();
    }
}
