component extends="quick.models.BaseEntity" {
    
    property name="id";
    property name="slug";
    property name="theme_name";
    property name="author";
    property name="author_uri";
    property name="version";
    property name="theme_uri";
    property name="description";
    property name="screenshot";
    property name="license";
    property name="tags";
    property name="referralUrl" column="referral_url";
    property name="hits" default="1";
    property name="has_referral";
    property name="repository";

    function getTheme_Uri(){
        if( len( variables.referralUrl ) ){
            return variables.referralUrl;
        }
        return variables.theme_uri;
    }

    function getHasReferral(){
        if( len( variables.referral_url ) ){
            return true;
        }
        return false;
    }

    function getReferralUrl( value ){

        if( ! len( retrieveAttribute( "referralUrl" ) ) ){
            return variables.theme_uri
        }

        return retrieveAttribute( "referralUrl" );
    }

    function provider() {
        return belongsTo( "Provider" );
    }

}