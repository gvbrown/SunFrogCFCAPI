<cfscript> 
	/* global authentication settings */ 
    apiUserProfile = application.apiUserProfile;  	// user profileid 
    apiUserEmail = application.apiUserEmail;  		// user email
    apiPassword = application.apiPassword; 			// user password

    apiKey = application.apiKey;					// dev api key
    apiNumber = application.apiNumber; 				// dev api number

	sfapi=CreateObject("component","sunfrogAPI");
	
	// call to init the properties of the sfapi object 
	sfapi.init(apiUserProfile = apiUserProfile, apiUserEmail = apiUserEmail, apiPassword = apiPassword, apiKey = apiKey, apiNumber = apiNumber); 


	getOrderStatusResponse = sfapi.getOrderStatus(orderid=7841062, email='geoff@sunfrog.com'); 
	writeDump(getOrderStatusResponse);  


</cfscript>