package SecondHandApartment

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import secondhandapartment.Province

//@Transactional(readOnly = false)
class ProvinceController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Province.list(params), model:[provinceCount: Province.count()]
    }

    def show(Province province) {
        respond province
    }

    def create() {
        respond new Province(params)
    }

    @Transactional
    def save(Province province) {
        if (province == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (province.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond province.errors, view:'create'
            return
        }

        province.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'province.label', default: 'Province'), province.id])
                redirect province
            }
            '*' { respond province, [status: CREATED] }
        }
    }

    def edit(Province province) {
        respond province
    }

    @Transactional
    def update(Province province) {
        if (province == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (province.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond province.errors, view:'edit'
            return
        }

        province.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'province.label', default: 'Province'), province.id])
                redirect province
            }
            '*'{ respond province, [status: OK] }
        }
    }

    @Transactional
    def delete(Province province) {

        if (province == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        province.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'province.label', default: 'Province'), province.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'province.label', default: 'Province'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
