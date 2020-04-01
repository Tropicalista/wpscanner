component extends="quick.models.BaseEntity" {
    property name="bcrypt" inject="@BCrypt" persistent="false";

    property name="id";
    property name="username";
    property name="email";	
}
