component extends="quick.models.BaseEntity" accessors="true" {
    
    property name="id";
    property name="slug";
    property name="name";
    property name="author";
    property name="author_uri";
    property name="download_link";
    property name="description";
    property name="homepage";
    property name="screenshot";
    property name="referralUrl" column="referral_url";
    property name="hits" default="1";
    property name="repository";
    property name="lastFoundOn";
    property name="createdDate" readonly="true";
    property name="updatedDate";

    function isChecked() {
        return len( getName() ) ? true : false;
    }

    function provider() {
        return belongsTo( "Provider@admin" );
    }

    function getHomepage(){
        if( ! len( retrieveAttribute( "homepage" ) ) ){
            var res = createObject("java", "java.util.regex.Pattern")
                        .compile('(?<=")(.*)(?=")')
                        .matcher( retrieveAttribute( "author_uri" ) );
            while (res.find()){
                return res.group();
            }
        }
        return retrieveAttribute( "homepage" );
    }

    function getReferralUrl( value ){

        if( ! len( retrieveAttribute( "referralUrl" ) ) ){
            return getHomepage()
        }

        return retrieveAttribute( "referralUrl" );
    }

}