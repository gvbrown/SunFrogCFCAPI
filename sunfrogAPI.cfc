
component accessors="true"{
	property name="apiUserProfile" type="string";
	property name="apiUserEmail" type="string";
	property name="apiPassword" type="string";
	property name="apiKey" type="string";
	property name="apiNumber" type="string";

	public void function init(
		required string apiUserProfile, 
		required string apiUserEmail, 
		required string apiPassword, 
		required string apiKey, 
		required string apiNumber) {

			/* init function */ 
		
			this.setApiUserProfile(arguments.apiUserProfile); 
			this.setApiUserEmail(arguments.apiUserEmail); 
			this.setApiPassword(arguments.apiPassword); 
			this.setApiKey(arguments.apiKey); 
			this.setApiNumber(arguments.apiNumber); 

	}

	public array function startBatch() {
		/* creates a new batch */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/Orders/'&apiUserProfile&'/startBatch.json';
        httpRsp = new http(); 
        httpRsp.setMethod('POST'); 
        
        httpRsp.setURL(apiUrl); 
        httpRsp.setUsername(apiNumber); 
        httpRsp.setPassword(apiKey); 
        
        httpRsp.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpRsp.addParam(type="formfield",name="password",value=apiPassword);
        httpRsp.addParam(type="formfield",name="iAgree",value="1");
        httpResult = httpRsp.send().getPrefix();

        return deserializeJson(httpResult.filecontent); 
    }

    public array function clearBatch(batchid) {
        /* method to clear an existing batch  */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/Orders/'&apiUserProfile&'/clearBatch.json';
        httpRsp = new http(); 
        httpRsp.setMethod('POST'); 
        
        httpRsp.setURL(apiUrl); 
        httpRsp.setUsername(apiNumber); 
        httpRsp.setPassword(apiKey); 
        
        httpRsp.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpRsp.addParam(type="formfield",name="password",value=apiPassword);
        httpRsp.addParam(type="formfield",name="iAgree",value="1");
        httpRsp.addParam(type="formfield",name="batchid",value=batchid);
        httpResult = httpRsp.send().getPrefix();
        
        return deserializeJson(httpResult.filecontent); 
    }

    public array function finalizeBatch(batchid) {
        /* method to finalize batch */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/Orders/'&apiUserProfile&'/finalizeBatch.json';
        httpRsp = new http(); 
        httpRsp.setMethod('POST'); 
        
        httpRsp.setURL(apiUrl); 
        httpRsp.setUsername(apiNumber); 
        httpRsp.setPassword(apiKey); 
        
        httpRsp.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpRsp.addParam(type="formfield",name="password",value=apiPassword);
        httpRsp.addParam(type="formfield",name="iAgree",value="1");
        httpRsp.addParam(type="formfield",name="batchid",value=batchid);
        httpResult = httpRsp.send().getPrefix();
        
        return deserializeJson(httpResult.filecontent); 
    }

    public array function endBatch(batchid) {
        /* method to end a batch */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/Orders/'&apiUserProfile&'/endBatch.json';
        httpRsp = new http(); 
        httpRsp.setMethod('POST'); 
        
        httpRsp.setURL(apiUrl); 
        httpRsp.setUsername(apiNumber); 
        httpRsp.setPassword(apiKey); 
        
        httpRsp.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpRsp.addParam(type="formfield",name="password",value=apiPassword);
        httpRsp.addParam(type="formfield",name="iAgree",value="1");
        httpRsp.addParam(type="formfield",name="transactionid",value="internal");
        httpRsp.addParam(type="formfield",name="batchid",value=batchid);
        httpResult = httpRsp.send().getPrefix();
        
        return deserializeJson(httpResult.filecontent); 
    }

    public array function getOrderStatus(required number orderid, required string email) {
        /* method to clear an existing batch  */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/Tracking/locate.json';
        httpRsp = new http(); 
        httpRsp.setMethod('POST'); 
        
        httpRsp.setURL(apiUrl); 
        httpRsp.setUsername(apiNumber); 
        httpRsp.setPassword(apiKey); 
        
        httpRsp.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpRsp.addParam(type="formfield",name="password",value=apiPassword);
        httpRsp.addParam(type="formfield",name="iAgree",value="1");
        httpRsp.addParam(type="formfield",name="orderid",value=orderid);
        httpRsp.addParam(type="formfield",name="email",value=email);
        httpResult = httpRsp.send().getPrefix();
        
        return deserializeJson(httpResult.filecontent); 
    }

    public array function createMockup(mockupObj) {
        /* method to create a mockup based on a derived object */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/mockups/'&apiUserProfile&'/addMockup.json';
        httpCreate = new http(); 
        httpCreate.setMethod('POST'); 
        httpCreate.setURL(apiUrl); 
        httpCreate.setUsername(apiNumber); 
        httpCreate.setPassword(apiKey); 

        httpCreate.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpCreate.addParam(type="formfield",name="password",value=apiPassword);
        httpCreate.addParam(type="formfield",name="iAgree",value="1");
        httpCreate.addParam(type="formfield",name="sizeByPass",value="1");


        if (structKeyExists(mockupObj,"aiFile")) {        
            httpCreate.addParam(type="formfield",name="aiFile",value=mockupObj["aiFile"]);
            httpCreate.addParam(type="formfield",name="imageFile",value=mockupObj["imageFile"]);
        }
        
        if (structKeyExists(mockupObj,"aiFileBack") && structKeyExists(mockupObj,"imageFileBack")) {
            httpCreate.addParam(type="formfield",name="aiFileBack",value=mockupObj["aiFileBack"]);
            httpCreate.addParam(type="formfield",name="imageFileBack",value=mockupObj["imageFileBack"]);
        }
        
        httpCreate.addParam(type="formfield",name="mockupType",value=mockupObj["mockupType"]);
        httpCreate.addParam(type="formfield",name="color",value=mockupObj["Color"]);

        httpCreateResult = httpCreate.send().getPrefix();   
        return deserializeJson(httpCreateResult.filecontent); 
    }


    public array function createMockupVariant(mockupObj) {
        /* method to create a mockup variant based on an object */ 
        apiUrl = 'https://api.sunfrogshirts.com/v1/mockups/'&apiUserProfile&'/addColor.json';
        httpCreate = new http(); 
        httpCreate.setMethod('POST'); 
        httpCreate.setURL(apiUrl); 
        httpCreate.setUsername(apiNumber); 
        httpCreate.setPassword(apiKey); 

        httpCreate.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpCreate.addParam(type="formfield",name="password",value=apiPassword);
        httpCreate.addParam(type="formfield",name="iAgree",value="1");
        httpCreate.addParam(type="formfield",name="sizeByPass",value="1");

        if (structKeyExists(mockupObj,"aiFile")) {        
            httpCreate.addParam(type="formfield",name="aiFile",value=mockupObj["aiFile"]);
            httpCreate.addParam(type="formfield",name="imageFile",value=mockupObj["imageFile"]);
        }
        
        if (structKeyExists(mockupObj,"aiFileBack") && structKeyExists(mockupObj,"imageFileBack")) {
            httpCreate.addParam(type="formfield",name="aiFileBack",value=mockupObj["aiFileBack"]);
            httpCreate.addParam(type="formfield",name="imageFileBack",value=mockupObj["imageFileBack"]);
        }
        
        httpCreate.addParam(type="formfield",name="mockupType",value=mockupObj["mockupType"]);
        httpCreate.addParam(type="formfield",name="color",value=mockupObj["Color"]);
		httpCreate.addParam(type="formfield",name="group",value=mockupObj["mockupGroupId"]);
        
        httpCreateResult = httpCreate.send().getPrefix();   
        return deserializeJson(httpCreateResult.filecontent); 
    }    

    public array function addOrder(
        required number batchid, 
        required string email, 
        required string name, 
        required string address1, 
        string address2, 
        required string city, 
        required string state, 
        required string shippingZipCode, 
        required string country, 
        string memo, 
        required array orderItems ) {

        apiUrl = 'https://api.sunfrogshirts.com/v1/Orders/'&apiUserProfile&'/addOrder.json';
        httpOrderBatch = new http(); 
        httpOrderBatch.setMethod('POST'); 
        httpOrderBatch.setURL(apiUrl); 
        httpOrderBatch.setUsername(apiNumber); 
        httpOrderBatch.setPassword(apiKey); 

        httpOrderBatch.addParam(type="formfield",name="username",value=apiUserEmail); 
        httpOrderBatch.addParam(type="formfield",name="password",value=apiPassword);
        httpOrderBatch.addParam(type="formfield",name="iAgree",value="1");
        httpOrderBatch.addParam(type="formfield",name="sizeByPass",value="1");
        httpOrderBatch.addParam(type="formfield",name="batchid",value=batchid);

        /* build the customer form fields */ 
        httpOrderBatch.addParam(type="formfield",name="email",value=arguments.email);
        httpOrderBatch.addParam(type="formfield",name="name",value=arguments.name);
        httpOrderBatch.addParam(type="formfield",name="address1",value=arguments.address1);
        httpOrderBatch.addParam(type="formfield",name="address2",value=arguments.address2);
        httpOrderBatch.addParam(type="formfield",name="city",value=arguments.city);
        httpOrderBatch.addParam(type="formfield",name="state",value=arguments.state);
        httpOrderBatch.addParam(type="formfield",name="shippingZipCode",value=arguments.shippingZipCode);
        httpOrderBatch.addParam(type="formfield",name="country",value=arguments.country);
        httpOrderBatch.addParam(type="formfield",name="memo",value=arguments.memo);

        for (var thisItem = 1; thisItem <= arrayLen(orderItems); thisItem++ ) {    
            httpOrderBatch.addParam(type="formfield",name="m_"&thisItem,value=orderItems[thisItem]['mockupid']);
            httpOrderBatch.addParam(type="formfield",name="size_"&thisItem,value=orderItems[thisItem]['size']);
            httpOrderBatch.addParam(type="formfield",name="quantity_"&thisItem,value=orderItems[thisItem]['quantity']);
        }

        httpResult = httpOrderBatch.send().getPrefix();
        return deserializeJSON(httpResult.filecontent); 
    }

    public struct function createOrderItem(
        required number mockupid, 
        required number quantity, 
        required string size) {

        /* function to create a new mockup object for simplified object handling */ 
        
        orderItem = structNew();
        orderItem["mockupID"] = arguments.mockupID; 
        orderItem["quantity"] = arguments.quantity; 
        orderItem["size"] = arguments.size;

        return orderItem; 
    }


    public struct function createMockupObj(
    	required number mockupGroupID, 
    	required any color, 
    	required any mockupType, 
    	string imageFile, 
    	string aiFile, 
    	string imageFileBack, 
    	string aiFileBack) {

    	/* function to create a new mockup object for simplified object handling */ 
    	
    	mockupObj = structNew();
    	mockupObj["mockupGroupID"] = arguments.mockupGroupID; 
    	mockupObj["color"] = arguments.color; 
		mockupObj["mockupType"] = arguments.mockupType;
		mockupObj["imageFile"] = arguments.imageFile;
		mockupObj["aiFile"] = arguments.aiFile;
		mockupObj["imageFileBack"] = arguments.imageFileBack;
		mockupObj["aiFileBack"] = arguments.aiFileBack;

		return mockupObj; 
    }

}
