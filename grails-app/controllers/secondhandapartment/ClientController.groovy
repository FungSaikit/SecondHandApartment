package secondhandapartment

import grails.converters.JSON

class ClientController {

    def index() {
        render(view: "index")
    }

    def getAllHouse(){
        render SecondHandHouse.getAll() as JSON
    }

    def createSecondHandHouse(String houseTitle, String houseOwner, String city, String agentId, String price){
        def newHouse = new House(houseTitle: houseTitle, houseOwner: houseOwner, city: city, agentId: agentId, price: price)
        newHouse.save()
        render "create success!"
    }

    def login(){
        render "This is client login page!"
    }
}
