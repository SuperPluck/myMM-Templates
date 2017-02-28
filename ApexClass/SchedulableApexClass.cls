public class {{ api_name }} implements Schedulable {

	public void schedule(Datetime date, String jobName) {
		String sch = date.format('ss mm HH dd MM ? yyyy');
		String jobID = System.schedule(jobName, sch, this);
	}

	public void execute(SchedulableContext sc) {
		//MyBatchClass b = new MyBatchClass();
		//database.executebatch(b);
	}
}