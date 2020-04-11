component extends="quick.models.BaseEntity" accessors="true" {
    
    property name="id";
    property name="slug";
    property name="name";
    property name="author";
    property name="download_link";
    property name="description";
    property name="homepage";
    property name="screenshot";
    property name="referral_url";
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

}