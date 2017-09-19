package SecondHandApartment

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import secondhandapartment.HousingProject

//@Transactional(readOnly = true)
class HousingProjectController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond HousingProject.list(params), model:[housingProjectCount: HousingProject.count()]
    }

    def show(HousingProject housingProject) {
        respond housingProject
    }

    def create() {
        respond new HousingProject(params)
    }

    @Transactional
    def save(HousingProject housingProject) {
        if (housingProject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (housingProject.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond housingProject.errors, view:'create'
            return
        }

        housingProject.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'housingProject.label', default: 'HousingProject'), housingProject.id])
                redirect housingProject
            }
            '*' { respond housingProject, [status: CREATED] }
        }
    }

    def edit(HousingProject housingProject) {
        respond housingProject
    }

    @Transactional
    def update(HousingProject housingProject) {
        if (housingProject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (housingProject.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond housingProject.errors, view:'edit'
            return
        }

        housingProject.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'housingProject.label', default: 'HousingProject'), housingProject.id])
                redirect housingProject
            }
            '*'{ respond housingProject, [status: OK] }
        }
    }

    @Transactional
    def delete(HousingProject housingProject) {

        if (housingProject == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        housingProject.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'housingProject.label', default: 'HousingProject'), housingProject.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'housingProject.label', default: 'HousingProject'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
