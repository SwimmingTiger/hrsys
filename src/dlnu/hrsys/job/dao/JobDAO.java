package dlnu.hrsys.job.dao;

import dlnu.hrsys.job.entity.Job;

import java.util.List;

public interface JobDAO {
	//增加岗位
	public boolean addJob(Job j);
	//删除岗位
	public boolean delJob(int id);
	//修改岗位
	public boolean updJob(Job j);
	//查询1（按岗位类型）
	public List findJobByType_id(int type_id);
	//查询2（按岗位id）
	public Job findJobById(int type_id);
	//查询3（按岗位名）
	public List findJobByName(String name);
	//查询4（所有）
	public List findJobAll();
	//搜索岗位
	List searchJobs(String name, int type_id);

}
