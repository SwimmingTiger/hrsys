package dlnu.hrsys.job.entity;

public class Job {
	private int id;
	private String name;
	private int type_id;
	private int size;
	/**
	 * @param id
	 * @param name
	 * @param type_id
	 * @param size
	 */
	public Job(){
		
	}
	public Job(String name, int type_id, int size) {
		super();
		this.name = name;
		this.type_id = type_id;
		this.size = size;
	}
	public Job(int id,String name, int type_id, int size) {
		super();
		this.id = id;
		this.name = name;
		this.type_id = type_id;
		this.size = size;
	}
	
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
	public int getType_id() {
		return type_id;
	}
	public void setType_id(int type_id) {
		this.type_id = type_id;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	
}
