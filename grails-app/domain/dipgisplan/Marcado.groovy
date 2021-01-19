package dipgisplan

class Marcado {
    Date entrada
    Date salida
    static constraints = {
        entrada nullable: true
        salida nullable: true
    }
    static belongsTo = [usuario: Usuario]
}
