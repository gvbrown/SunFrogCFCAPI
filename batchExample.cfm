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
	
	// start a batch 
	batchStruct = sfapi.createBatch();

	// get the batchid of the current batch
	// if another batch is active, this will grab the latest batchid
	// if this is not desired behavior, close the batch before processing 
	// messageDeveloper in the return json will indicate the batch status
	batchid = batchStruct[1]['batchid'];

	
</cfscript>