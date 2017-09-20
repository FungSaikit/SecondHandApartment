/*这个类是楼盘类*/

package secondhandapartment

class HousingProduct {
    String name
    String buildingType
    String developer
    String propertyManagementCompany //物业管理公司
    String facility //配套设施
    String area //面积
    String address
    String usageType //用途
    String traffic

    static hasMany = [houses: House]
    static belongsTo = [district: District]

    static constraints = {
        name()
        district()
        developer()
        propertyManagementCompany()
        buildingType()
        area()
        facility()
        address()
        usageType()
        traffic()
        houses nullable: true
    }

    String toString(){
        return name
    }
}
