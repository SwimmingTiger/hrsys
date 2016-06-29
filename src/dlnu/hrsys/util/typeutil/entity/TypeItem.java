package dlnu.hrsys.util.typeutil.entity;

/**
 * 类型条目
 */
public class TypeItem {
    private int id;
    private int groupId;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getGroupId() {
        return groupId;
    }

    public void setGroupId(int groupId) {
        this.groupId = groupId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        TypeItem typeItem = (TypeItem) o;

        return id == typeItem.id;

    }

    public int hashCode() {
        return id;
    }
}