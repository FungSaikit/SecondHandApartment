package secondhandapartment

class Province {
    String provinceName

    static hasMany = [citys: City]

    static constraints = {
        provinceName nullable: false
        provinceName unique: true
    }

    String toString(){
        return provinceName
    }
}
