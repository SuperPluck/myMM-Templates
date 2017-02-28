public class {{ api_name }} implements Database.Batchable<sObject>, Database.AllowsCallouts, Database.Stateful {
	
	String query;
	
	public {{ api_name }}() {
		
	}
	
	public Iterable<SObject> start(Database.BatchableContext BC) {
		return (Iterable<SObject>)Database.getQueryLocator(query);
	}

   	public void execute(Database.BatchableContext BC, List<sObject> scope) {
	
	}
	
	public void finish(Database.BatchableContext BC) {
		
	}
	
}