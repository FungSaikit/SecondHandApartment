package secondhandapartment

class House {
    String houseTitle
    String houseOwner
    String agentId
    int housePrice
    int like
    Boolean isSecondHandHouse
    /*二手房为true， 出租房为false*/
    String houseDetail
    String houseUsage
    /*用途*/
    String houseType
    /*类型*/
    String houseAddress
    /*位置*/
    String houseFloor
    /*楼层*/
    String houseBuildingArea
    /*建筑面积*/
    String houseInsideArea
    /*套内面积*/
    String houseConstructionTime
    /*建筑时间*/
    String houseDirection
    /*朝向*/
    String houseDecoration
    /*装修*/
    String housePropertyRight
    /*产权*/
    String houseCertificate
    /*证件*/
    String houseStatus
    /*现状*/
    String houseFurniture
    /*家具*/
    String houseElectricalEquipment
    /*电器*/

    static belongsTo = [district: District, housingProduct: HousingProduct]

    static constraints = {
        houseTitle blank: false
        houseOwner nullable: false
        housePrice nullable: true
        agentId nullable: true
    }

    String toString(){
        return houseTitle
    }
}
