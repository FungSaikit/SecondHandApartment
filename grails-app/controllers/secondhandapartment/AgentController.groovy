package SecondHandApartment

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional
import secondhandapartment.Agent

//@Transactional(readOnly = true)
class AgentController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Agent.list(params), model:[agentCount: Agent.count()]
    }

    def show(Agent agent) {
        respond agent
    }

    def create() {
        respond new Agent(params)
    }

    @Transactional
    def save(Agent agent) {
        if (agent == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (agent.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond agent.errors, view:'create'
            return
        }

        agent.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'agent.label', default: 'Agent'), agent.id])
                redirect agent
            }
            '*' { respond agent, [status: CREATED] }
        }
    }

    def edit(Agent agent) {
        respond agent
    }

    @Transactional
    def update(Agent agent) {
        if (agent == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        if (agent.hasErrors()) {
            transactionStatus.setRollbackOnly()
            respond agent.errors, view:'edit'
            return
        }

        agent.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'agent.label', default: 'Agent'), agent.id])
                redirect agent
            }
            '*'{ respond agent, [status: OK] }
        }
    }

    @Transactional
    def delete(Agent agent) {

        if (agent == null) {
            transactionStatus.setRollbackOnly()
            notFound()
            return
        }

        agent.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'agent.label', default: 'Agent'), agent.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'agent.label', default: 'Agent'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
