package secondhandapartment

class City {
    String cityName

    static belongsTo = [provinve: Province]
    static hasMany = [districts: District]

    static constraints = {
        cityName unique: true
        provinve nullable: true
        districts nullable: true
    }

    String toString(){
        return cityName
    }
}
