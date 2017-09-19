package SecondHandApartment

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import secondhandapartment.District

//@Transactional(readOnly = true)
class DistrictController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond District.list(params), model:[districtCount: District.count()]
    }

    def show(District district) {
        respond district
    }

    def create() {
        respond new District(params)
    }

    @Transactional
    def save(District district) {
        if (district == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (district.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond district.errors, view:'create'
            return
        }

        district.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'district.label', default: 'District'), district.id])
                redirect district
            }
            '*' { respond district, [status: CREATED] }
        }
    }

    def edit(District district) {
        respond district
    }

    @Transactional
    def update(District district) {
        if (district == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (district.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond district.errors, view:'edit'
            return
        }

        district.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'district.label', default: 'District'), district.id])
                redirect district
            }
            '*'{ respond district, [status: OK] }
        }
    }

    @Transactional
    def delete(District district) {

        if (district == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        district.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'district.label', default: 'District'), district.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'district.label', default: 'District'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
