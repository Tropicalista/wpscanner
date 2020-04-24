component accessors="true" implements="cbvalidation.models.validators.IValidator" singleton {

	property name="name";
	
	UrlValidator function init(){
		name = "Url";	
		return this;
	}

	/**
	* Will check if an incoming value validates
	* @validationResult.hint The result object of the validation
	* @target.hint The target object to validate on
	* @field.hint The field on the target object to validate on
	* @targetValue.hint The target value to validate
	* @validationData.hint The validation data the validator was created with
	*/
	boolean function validate(
		required any validationResult,
		required any target,
		required string field,
		any targetValue,
		any validationData,
		struct rules
	){		
		var parsedUrl = createObject( "java", "java.net.URL" ).init( arguments.targetValue );

		var domain = parsedUrl.getHost();

		// Simple Tests
		if( find( ".", arguments.targetValue) AND len( domain ) AND createObject( "java", "com.google.common.net.InternetDomainName" ).from( domain ).hasPublicSuffix() ){
			return true;
		}

		var args = {message="'#arguments.targetValue#' is not a valid url",field=arguments.field,validationType=getName(),validationData=arguments.validationData};
		var error = validationResult.newError(argumentCollection=args).setErrorMetadata({url=arguments.validationData});
		validationResult.addError( error );
		return false;
	}
	
	/**
	* Get the name of the validator
	*/
	string function getName(){
		return name;
	}

}