component extends="quick.models.BaseEntity" {
    
    property name="id";
    property name="slug";
    property name="name" column="theme_name";
    property name="author";
    property name="authorUri" column="author_uri";
    property name="version" sqltype="cf_sql_varchar";
    property name="themeUri" column="theme_uri";
    property name="description";
    property name="screenshot";
    property name="license";
    property name="tags";
    property name="referralUrl" column="referral_url";
    property name="hits" default="1";
    property name="hasReferral";
    property name="repository";

    function getThemeUri(){
        if( len( variables.referralUrl ) ){
            return variables.referralUrl;
        }
        return variables.themeUri;
    }

    function getHasReferral(){
        if( len( variables.referralUrl ) ){
            return true;
        }
        return false;
    }

    function getReferralUrl( value ){

        if( ! len( retrieveAttribute( "referralUrl" ) ) ){
            return variables.themeUri
        }

        return retrieveAttribute( "referralUrl" );
    }

    function provider() {
        return belongsTo( "Provider" );
    }

}