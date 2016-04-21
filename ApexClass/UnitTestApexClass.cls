@isTest
private class {{ api_name }} {
	
	static {
		//initilize static variables
	}

	@testSetup static void createData() {
		// call data creating classes and other setup
		// data created here must be queried in order 
		// to be accessed on test methods
	}
	
	static testMethod void test_method_one() {
		// Implement test code
	}
	
}