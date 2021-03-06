public class {{ api_name }} implements Database.Batchable<SObject>, Schedulable{

    public void schedule(Datetime d, String jobName) {
        String sch = d.format('ss mm HH dd MM ? yyyy');
        String jobID = System.schedule(jobName, sch, this);
    }

    public void execute(SchedulableContext context){
        Database.executeBatch(this);
    }

    public Iterable<SObject> start(Database.BatchableContext BC) {
        return (Iterable<SObject>)Database.getQueryLocator('SELECT Id FROM Account');
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
    
    }
    
    public void finish(Database.BatchableContext BC) {
        
    }
}