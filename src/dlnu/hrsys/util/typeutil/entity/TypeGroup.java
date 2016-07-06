package dlnu.hrsys.util.typeutil.entity;

import java.util.ArrayList;

/**
 * 类型组
 *
 * 可以当作 ArrayList<TypeItem> 使用
 */
public class TypeGroup extends ArrayList<TypeItem> {
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        if (!super.equals(o)) return false;

        TypeGroup typeItems = (TypeGroup) o;

        return id == typeItems.id;

    }

    @Override
    public int hashCode() {
        int result = super.hashCode();
        result = 31 * result + id;
        return result;
    }
}
