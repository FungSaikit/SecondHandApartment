package secondhandapartment

class ClientController {

    def index() {
        println "it's in the client index now!"
        [ houseList: SecondHandHouse.list() ]
        render(view: "index")
    }

    def login(){
        render "This is client login page!"
    }
}
