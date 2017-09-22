package secondhandapartment

class Agent {
    String name
    String job
    String photoUrl
    String phoneNumber
    int point

    static hasMany = [houses: House]
    static belongsTo = [district: District]
    static constraints = {
        name nullable: false
        job nullable: true
        phoneNumber nullable: true
        district nullable: true
        photoUrl nullable: true
        point()
    }
}
