package secondhandapartment

class User {
    String username
    String password
    String userEmail
    String phoneNumber
    String userGender

    static constraints = {
        username(unique: true)
        password()
        userGender()
        userEmail(email: true)
        phoneNumber()
    }

    @Override
    String toString() {
        return username
    }
}
