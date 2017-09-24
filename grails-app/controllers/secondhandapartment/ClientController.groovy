package secondhandapartment

import grails.converters.JSON

class ClientController {

    def index() {
        render(view: "index")
    }

    def login(){
        render(view: "login")
    }

    def secondhandhouse(){
        render(view: "secondhandhouse")
    }

}
