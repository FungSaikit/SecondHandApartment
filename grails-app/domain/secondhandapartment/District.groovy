package secondhandapartment

class District {
    String districtName

    static belongsTo = [city: City]
    static hasMany = [houses: House, houseingProduct: HousingProduct]

    static constraints = {
        districtName()
        city()
        districtName unique: true
        city nullable: false
        houses nullable: true
        houseingProduct nullable: true
    }

    String toString(){
        return districtName
    }
}
