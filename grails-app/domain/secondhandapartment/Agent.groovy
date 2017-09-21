package secondhandapartment

class Agent {
    String name
    String job
    String province
    String city
    String district
    String photoUrl
    String phoneNumber
    int point

    static hasMany = [houses: House]
    static constraints = {
        name nullable: false
        job nullable: false
        phoneNumber nullable: false
        province nullable: false
        city nullable: false
        district nullable: false
        photoUrl nullable: false
        point()
    }
}
