component extends="quick.models.BaseEntity" {

    property name="id";
    property name="url";
    property name="name";
    property name="description";

    function themes() {
        return hasMany( "Theme" );
    }

    function plugins() {
        return hasMany( "Plugin" );
    }

	function getMemento() {
       return {
       		id = this.getId(),
       		name = this.getName()
       };
    }

}
