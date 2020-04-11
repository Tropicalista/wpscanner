component extends="quick.models.BaseEntity" {

    property name="id";
    property name="url";
    property name="plugins";
    property name="themes";

	function getMemento() {
       return {
       		"url" = this.getUrl()
       };
    }

}
