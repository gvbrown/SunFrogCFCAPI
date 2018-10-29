
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

	public array function createBatch() {
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
        writeDump(httpCreateResult.fileContent);      
        return deserializeJson(httpCreateResult.filecontent); 
    }


    public array function createMockupVariant(mockupObj) {
        /* method to create a mockup based on a derived object */ 
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
        writeDump(httpCreateResult.fileContent);      
        return deserializeJson(httpCreateResult.filecontent); 
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
