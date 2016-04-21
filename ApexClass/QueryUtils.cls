public class QueryUtils {
	
	/*returns a query string with all fields in a fieldset*/
	public static String getFieldSetQuery(String objectName, String fieldSetName, String filters) {
		
		String fields = '';
		for(Schema.FieldSetMember fs : Schema.getGlobalDescribe().get(objectName).getDescribe().FieldSets.getMap().get(fieldSetName).getFields()) fields += fs.getFieldPath()+', ';

		return 'SELECT ' + fields + 'Id, Name FROM ' + objectName + (String.isNotEmpty(filters) ? ' WHERE '+filters : '');
	}

	/*returns a query string with all the updateable fields of the object*/
	public static String getAllFieldQuery(String objectName, String filters) {

        String fields = '';
        Map<String, Schema.SObjectField> fMap = Schema.getGlobalDescribe().get(objectName).getDescribe().Fields.getMap();

        for(Schema.SObjectField field : fMap.values()){
        	Schema.DescribeFieldResult fd = field.getDescribe();
        	if(fd.isUpdateable()) fields += fd.getName() + ', ';
        }
        fields = fields.substring(0,fields.lastIndexOf(','));
        
        return 'SELECT ' + fields + ' FROM ' + objectName + (String.isNotEmpty(filters) ? ' WHERE '+filters : '');
    }

    /*returns a query string with child records*/
	public static String getChildQuery(String objectName, String chidlRelationshipName, List<String> parentFields, List<String> chidlFields, String filters) {

		String pfString = '';
		if(!parentFields.isEmpty()) for(String f : parentFields) pfString += f+', ';

		String cfString = '';
		if(!chidlFields.isEmpty()) for(String f : chidlFields) cfString += f+', ';

		return 'SELECT ' + pfString + 'Id, (SELECT ' + cfString + ' Id FROM ' + chidlRelationshipName + ') FROM ' + objectName + (String.isNotEmpty(filters) ? ' WHERE '+filters : '');
	}

}