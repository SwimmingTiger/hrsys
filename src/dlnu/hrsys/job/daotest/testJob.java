package dlnu.hrsys.job.daotest;

import java.util.Iterator;
import java.util.List;

import dlnu.hrsys.job.dao.JobDAO;
import dlnu.hrsys.job.entity.Job;
import dlnu.hrsys.job.factory.JobDAOFactory;
import dlnu.hrsys.util.DBUtil.DBException;

public class testJob {

	public static void main(String[] args) {
		// TODO 自动生成的方法存根
		try {
			JobDAO jd = JobDAOFactory.getJobDAO();
			Job j = new Job("高级工程师",10,10);
			 //测试addUser功能
			
			/*boolean flag = jd.addJob(j);
			System.out.println(flag);*/
			
			//测试删除
			
			/*boolean flag = jd.delJob(2);
			System.out.println(flag);*/
			
			//测试修改(不存在的id返回也是true)
			/*Job j1 = new Job(7,"高级工程师",30,30);
			boolean flag2 = jd.updJob(j1);
			System.out.println(flag2);
			//测试查找（type_id）
			List al = null;
			al = jd.findJobByType_id(4);
			Iterator it = al.iterator();
			if(!it.hasNext())
				System.out.println("it don't has next");
				while(it.hasNext()){
					Job job1 = (Job)it.next();
					System.out.println(" type_id is: "+job1.getType_id());

				}*/
				//测试查找（ID）
				/*Job job2 = null;
				job2 = jd.findJobById(4);
				
				if(job2.getId()==0){
					System.out.println("the job is not exist!");
				}else{
	
						System.out.println("the job id is: "+job2.getId());

				}*/
			//测试查找3（岗位名模糊查找）
			/*List al = null;
			al = jd.findJobByName("清");
			Iterator it = al.iterator();
			if(!it.hasNext())
				System.out.println("it don't has next");
				while(it.hasNext()){
					Job job1 = (Job)it.next();
					System.out.println(" the job name is: "+job1.getName());

				}*/
			
			//测试查找4
			/*List al = null;
			al = jd.findJobAll();
			Iterator it = al.iterator();
			if(!it.hasNext())
				System.out.println("it don't has next");
				while(it.hasNext()){
					 Job job2 = (Job)it.next();
					System.out.println(" the job id is: "+job2.getType_id());
	
*/
					
		} catch (DBException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}

	}

}
