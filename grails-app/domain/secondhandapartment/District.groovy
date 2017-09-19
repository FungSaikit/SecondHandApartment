package secondhandapartment

class District {
    String districtName

    static belongsTo = [city: City]
    static hasMany = [houses: House, housingProject: HousingProject]

    static constraints = {
        districtName unique: true
        city nullable: true
    }

    String toString(){
        return districtName
    }
}
