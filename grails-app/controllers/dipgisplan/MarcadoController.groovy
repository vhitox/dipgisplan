package dipgisplan

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class MarcadoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [marcadoInstanceList: Marcado.list(params), marcadoInstanceTotal: Marcado.count()]
    }

    def create() {
        [marcadoInstance: new Marcado(params)]
    }

    def save() {
        def marcadoInstance = new Marcado(params)
        if (!marcadoInstance.save(flush: true)) {
            render(view: "create", model: [marcadoInstance: marcadoInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'marcado.label', default: 'Marcado'), marcadoInstance.id])
        redirect(action: "show", id: marcadoInstance.id)
    }

    def show() {
        def marcadoInstance = Marcado.get(params.id)
        if (!marcadoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "list")
            return
        }

        [marcadoInstance: marcadoInstance]
    }

    def edit() {
        def marcadoInstance = Marcado.get(params.id)
        if (!marcadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "list")
            return
        }

        [marcadoInstance: marcadoInstance]
    }

    def update() {
        def marcadoInstance = Marcado.get(params.id)
        if (!marcadoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (marcadoInstance.version > version) {
                marcadoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'marcado.label', default: 'Marcado')] as Object[],
                          "Another user has updated this Marcado while you were editing")
                render(view: "edit", model: [marcadoInstance: marcadoInstance])
                return
            }
        }

        marcadoInstance.properties = params

        if (!marcadoInstance.save(flush: true)) {
            render(view: "edit", model: [marcadoInstance: marcadoInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'marcado.label', default: 'Marcado'), marcadoInstance.id])
        redirect(action: "show", id: marcadoInstance.id)
    }

    def delete() {
        def marcadoInstance = Marcado.get(params.id)
        if (!marcadoInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "list")
            return
        }

        try {
            marcadoInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'marcado.label', default: 'Marcado'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def marcarEntrada(){
        def user = springSecurityService.currentUser
        withForm {
            def marcado = new Marcado(entrada: new Date(), usuario: user)
            if(marcado.save()){
                println("MARCADO EXITOSO!")
            }else{
                println("MARCADO FALLIDO!")
            }
            redirect(controller: 'usuario', action: 'home')
        }.invalidToken{
            render "Cargando ..."
            redirect(controller: 'usuario', action: 'home')
        }
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def marcarSalida(){
        def marcado = Marcado.get(params.id)
        marcado.salida = new Date()
        marcado.save()
        redirect(controller: 'usuario', action: 'hastamanana')
    }

    @Secured(['ROLE_ADMIN','ROLE_JEFE'])
    def historialMarcado(){
        def user = springSecurityService.currentUser
        def marcados = Marcado.findAll().reverse()
        def filterDay = marcados.groupBy {it.entrada.format("dd/MM/yyyy")}
        [marcadosList:filterDay]
    }
}
