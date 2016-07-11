package dlnu.hrsys.department.entity;

import java.sql.Date;

public class Department {
	private int id;
	private String name;
	private int typeId;
	private String phone;
	private String fax;
	private String des;
	private int parentId;
	private Date dateFound;
	
	public Department(){
		fax = "无";
		des = "无";
		parentId = -1;
	}
	
	public Department(String name, int typeId, String phone, String fax,
			String des, int parentId, Date dateFound){
		this.name = name;
		this.typeId = typeId;
		this.phone = phone;
		this.fax = fax;
		this.des = des;
		this.parentId = parentId;
		this.dateFound = dateFound;
}
	
	public Department(int id, String name, int typeId, String phone, String fax,
						String des, int parentId, Date dateFound){
		this.id = id;
		this.name = name;
		this.typeId = typeId;
		this.phone = phone;
		this.fax = fax;
		this.des = des;
		this.parentId = parentId;
		this.dateFound = dateFound;
	}

	public int getId() {
		return this.id;
	}
	public String getName() {
		return this.name;
	}
	public int getTypeId() {
		return this.typeId;
	}
	public String getPhone() {
		return this.phone;
	}
	public String getFax() {
		return this.fax;
	}
	public int getParentId() {
		return this.parentId;
	}
	public String getDesc() {
		return this.des;
	}
	public Date getFoundDate() {
		return this.dateFound;
	}
	
	public void setId(int id) {
		this.id = id;
	}		
	public void setName(String name) {
		this.name = name;
	}	
	public void setTypeId(int type_id) {
		this.typeId = type_id;
	}	
	public void setPhone(String phone) {
		this.phone = phone;
	}	
	public void setFax(String fax) {
		this.fax = fax;
	}	
	public void setDesc(String desc) {
		this.des = desc;
	}	
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}	
	public void setFoundDate(Date date) {
		this.dateFound =  date;
	}
}
