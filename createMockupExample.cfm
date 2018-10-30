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
	
	// define the properties of this mockup object 
	mockupGroupid = 0; 
	color = 20; 
	mockupType = 8; 
	imageFile = 'https://api.sunfrogshirts.com/sunfrogshirt.jpg';
	aiFile = 'https://api.sunfrogshirts.com/sunfroglogo.png'; 
	imageFileBack = ''; 
	aiFileBack = '';  

	// Create a New Mockup Object
	mockupObj = sfapi.createMockupObj(
    	mockupGroupid = mockupGroupid, 
    	color = color, 
    	mockupType = mockupType, 
    	imageFile = imageFile, 
    	aiFile = aiFile, 
    	imageFileBack = imageFileBack, 
    	aiFileBack = aiFileBack); 

	// send the mockup object to the API for processing (uses /mockups/addMockup endpoint )
	mockupCreateResponse = sfapi.createMockup(mockupObj);
	writeDump(mockupCreateResponse); 
	/* 
		** Create Mockup Response ** 

		GROUP & M PARAMETERS
		The GROUP parameter is useful for creating variations based on a design.  
		Variants are created as a child of the group. 
		
		The M parameter is a reference to the created variant, which is used 
		when creating orders. Whenever possible, store these values in relation
		to your own designs and variants, as they can be reused in subsequent 
		orders for the same design and style. 

		CREATING VARIANTS 
		To create variants, we reference the groupid from the response, 
		and add different type and color options.  
		Colors and types can be passed as numeric values or strings

	*/ 
	
	// Define the properties of the variant  
	mockupGroupid = mockupCreateResponse[1]['group'];; 
	color = 'red'; 
	mockupType = 8; 
	imageFile = 'https://api.sunfrogshirts.com/sunfrogshirt.jpg';
	aiFile = 'https://api.sunfrogshirts.com/sunfroglogo.png'; 
	imageFileBack = ''; 
	aiFileBack = '';  

	// Create a New Mockup Object
	mockupObjVariant = sfapi.createMockupObj(
    	mockupGroupid = mockupGroupid, 
    	color = color, 
    	mockupType = mockupType, 
    	imageFile = imageFile, 
    	aiFile = aiFile, 
    	imageFileBack = imageFileBack, 
    	aiFileBack = aiFileBack); 

	// pass the variant object to the createMockupVariant function ( uses /mockups/addColor endpoint )
	mockupVariantCreateResponse = sfapi.createMockupVariant(mockupObjVariant);

	/* 
		Add Color Response 
		Similar to the addMockup response, the addColor endpoint will return the parameter "m", which 
		is used to reference this particular variant in the future. 

	*/

	writeDump(mockupVariantCreateResponse); 

</cfscript>