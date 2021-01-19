package dipgisplan

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN'])
class ActividadController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def springSecurityService
    def index() {
        redirect(action: "list", params: params)
    }

    def list() {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [actividadInstanceList: Actividad.list(params), actividadInstanceTotal: Actividad.count()]
    }

    def create() {
        [actividadInstance: new Actividad(params)]
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def save() {
        def actividadInstance = new Actividad(params)
        if (!actividadInstance.save(flush: true)) {
            render(view: "create", model: [actividadInstance: actividadInstance])
            return
        }

		flash.message = message(code: 'default.created.message', args: [message(code: 'actividad.label', default: 'Actividad'), actividadInstance.id])
        if (org.codehaus.groovy.grails.plugins.springsecurity.SpringSecurityUtils.ifAnyGranted('ROLE_FUNCIONARIO')){
            redirect(controller: 'actividad', action: 'misActividades')
            return
        }
        redirect(action: "show", id: actividadInstance.id)
    }

    def show() {
        def actividadInstance = Actividad.get(params.id)
        if (!actividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "list")
            return
        }

        [actividadInstance: actividadInstance]
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def edit() {
        def actividadInstance = Actividad.get(params.id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "list")
            return
        }

        [actividadInstance: actividadInstance]
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def update() {
        def actividadInstance = Actividad.get(params.id)
        if (!actividadInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "list")
            return
        }

        if (params.version) {
            def version = params.version.toLong()
            if (actividadInstance.version > version) {
                actividadInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'actividad.label', default: 'Actividad')] as Object[],
                          "Another user has updated this Actividad while you were editing")
                render(view: "edit", model: [actividadInstance: actividadInstance])
                return
            }
        }

        actividadInstance.properties = params

        if (!actividadInstance.save(flush: true)) {
            render(view: "edit", model: [actividadInstance: actividadInstance])
            return
        }

		flash.message = message(code: 'default.updated.message', args: [message(code: 'actividad.label', default: 'Actividad'), actividadInstance.id])
        //redirect(action: "show", id: actividadInstance.id)
        redirect(action: "misActividades")
    }

    def delete() {
        def actividadInstance = Actividad.get(params.id)
        if (!actividadInstance) {
			flash.message = message(code: 'default.not.found.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "list")
            return
        }

        try {
            actividadInstance.delete(flush: true)
			flash.message = message(code: 'default.deleted.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
			flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'actividad.label', default: 'Actividad'), params.id])
            redirect(action: "show", id: params.id)
        }
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def misActividades(){
        def user = springSecurityService.currentUser
        def actividades = Actividad.findAllByUsuario(user)
        def hoy = new Date().format("dd/MM/yyyy")
        [actividadInstanceList: actividades.findAll {it.horaInicio.format("dd/MM/yyyy") == hoy}, usuario: user]
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def createMiActividad(){
        def user = springSecurityService.currentUser
        [actividadInstance: new Actividad(params), usuario: user]
    }

    @Secured(['ROLE_JEFE','ROLE_ADMIN'])
    def suActividad(){
        def usuario = Usuario.get(params.id)
        def actividades = Actividad.findAllByUsuario(usuario)
        [actividadInstanceList: actividades, usuario: usuario]
    }

    @Secured(['ROLE_FUNCIONARIO'])
    def historial(){
        def user = springSecurityService.currentUser
        def actividades = Actividad.findAllByUsuario(user)
        def actividadesOrder = actividades.reverse()
        [fechas: actividadesOrder.groupBy {it.horaInicio.format("dd/MM/yyyy")}, usuario:user]
    }
}
