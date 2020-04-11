component extends="BaseEntity" {

    property name="bcrypt" inject="@BCrypt" persistent="false";

    property name="id";
    property name="firstName" column="first_name";
    property name="lastName" column="last_name";
    property name="email";
    property name="password";
    property name="createdDate" column="created_date";
    property name="modifiedDate" column="modified_date";
    property name="lastLoggedIn" column="last_logged_in";

    public User function retrieveUserByUsername( required string email ){
        return newEntity().where( "email", arguments.email ).firstOrFail();
    }

    public User function retrieveUserById( required numeric id ){
        return newEntity().findOrFail( arguments.id );
    }

    function setPassword( password ) {
        assignAttribute( "password", bcrypt.hashPassword( password ) );
    }

    public boolean function isValidCredentials( required string email, required string password ){
        var user = newEntity().where( "email", arguments.email ).first();
        //dump(newEntity().where( "email", arguments.email ).first());
        //abort;
        if ( isNUll( user ) ) {
            return false;
        }
        return bcrypt.checkPassword( arguments.password, user.getPassword() );
    }

}