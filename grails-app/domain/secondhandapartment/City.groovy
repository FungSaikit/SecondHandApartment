package secondhandapartment

class City {
    String cityName

    static belongsTo = [province: Province]
    static hasMany = [districts: District]

    static constraints = {
        cityName()
        province()
        cityName unique: true
        province nullable: true
        districts nullable: true
    }

    String toString(){
        return cityName
    }
}
