import dipgisplan.Area
import dipgisplan.Rol
import dipgisplan.Usuario
import dipgisplan.UsuarioRol

class BootStrap {

    def init = { servletContext ->
        /*def rolAdmin = new Rol(authority: "ROLE_ADMIN").save()
        def rolFuncionario = new Rol(authority: "ROLE_FUNCIONARIO").save()
        def rolJefe = new Rol(authority: "ROLE_JEFE").save()
        def useradmin = new Usuario(nombreCompleto: "Erick Castillo", username: "erick", password: "123456", enabled: true).save()
        def adminRol = new UsuarioRol(usuario: useradmin, rol: rolAdmin).save()
        def area1 = new Area(nombre: "Comunicación").save()
        def area2 = new Area(nombre: "Sistemas de Información").save()
        def area3 = new Area(nombre: "Contabilidad").save()
        def area4 = new Area(nombre: "Postgrado").save()
        def area5 = new Area(nombre: "Interaccion Social").save()
        def area6 = new Area(nombre: "Investigación").save()
        def area7 = new Area(nombre: "Administrativa").save()
        def area8 = new Area(nombre: "Archivo").save()*/
    }
    def destroy = {
    }
}
