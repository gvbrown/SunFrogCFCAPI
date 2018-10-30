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

	// create the batch, and get the batchid 	
	createBatchResponse = sfapi.startBatch(); 
	batchid = createBatchResponse[1]['batchid']; 

	// for simplicity, we create an array of orderitems, 
	// and pass the array to the addOrder method 
	orderItems = arrayNew(1); 
	orderItems[1] = sfapi.createOrderItem(mockupid = 1361649566, size='L', quantity=1); 
	orderItems[2] = sfapi.createOrderItem(mockupid = 1361649566, size='XL', quantity=1); 
	
	/* 
		ADD ORDER 
		add order will return the orderid, which can be used for tracking after the batch is ended. 
	*/
	addOrderResponse = sfapi.addOrder(
        batchid = batchid, 
        email = 'geoff@sunfrog.com', 
        name = 'SunFrog Shirts', 
        address1 = '1782 ORourke Blvd', 
        address2 = '', 
        city = 'Gaylord', 
        state = 'MI', 
        shippingZipCode='49735', 
        country = 'United States', 
        memo='', 
        orderItems = orderItems ); 

	writeDump(addOrderResponse); 

	/* 
		FINALIZE BATCH 
	 	when the batch is complete, finalize it. 
	 	Finalizing the batch will finalize the batch cost 
	*/ 
	finalizeBatchResponse = sfapi.finalizeBatch(batchid); 
	writeDump(finalizeBatchResponse); 

	/* 
		END BATCH 
		end batch will send the order to production and close the batch 
	*/ 
	endBatchResponse = sfapi.endBatch(batchid); 
	writeDump(endBatchResponse); 

</cfscript>