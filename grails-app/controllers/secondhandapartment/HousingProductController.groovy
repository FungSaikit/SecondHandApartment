package SecondHandApartment

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import secondhandapartment.HousingProduct

//@Transactional(readOnly = true)
class HousingProductController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HousingProduct.list(params), model:[housingProductCount: HousingProduct.count()]
    }

    def show(HousingProduct housingProduct) {
        respond housingProduct
    }

    def create() {
        respond new HousingProduct(params)
    }

    @Transactional
    def save(HousingProduct housingProduct) {
        if (housingProduct == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (housingProduct.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond housingProduct.errors, view:'create'
            return
        }

        housingProduct.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'housingProduct.label', default: 'HousingProduct'), housingProduct.id])
                redirect housingProduct
            }
            '*' { respond housingProduct, [status: CREATED] }
        }
    }

    def edit(HousingProduct housingProduct) {
        respond housingProduct
    }

    @Transactional
    def update(HousingProduct housingProduct) {
        if (housingProduct == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (housingProduct.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond housingProduct.errors, view:'edit'
            return
        }

        housingProduct.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'housingProduct.label', default: 'HousingProduct'), housingProduct.id])
                redirect housingProduct
            }
            '*'{ respond housingProduct, [status: OK] }
        }
    }

    @Transactional
    def delete(HousingProduct housingProduct) {

        if (housingProduct == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        housingProduct.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'housingProduct.label', default: 'HousingProduct'), housingProduct.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'housingProduct.label', default: 'HousingProduct'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
