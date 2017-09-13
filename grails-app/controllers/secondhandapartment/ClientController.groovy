package secondhandapartment

class ClientController {

    def index(String houseId) {
//        def p = new SecondHandHouse(houseTitle: '珠江新城3房2厅150方，一共有20套', houseOwner: '梁炜坤', agentId: 'lwk', city: '广州', price: '8888888' )
//        p.save()
        SecondHandHouse.get(houseId)
        render(view: "index")
    }

    def login(){
        render "This is client login page!"
    }
}
