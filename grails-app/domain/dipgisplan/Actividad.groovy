package dipgisplan

class Actividad {

    Date horaInicio
    Date horaFin
    String descripcion
    String coordinacion
    String observaciones
    String tipo
    static constraints = {
        horaInicio blank: false, nullable: false
        horaFin blank: false, nullable: false
        descripcion nullable: false, maxSize: 5000
        coordinacion nullable: true, maxSize: 5000
        observaciones nullable: true, maxSize: 5000
        tipo nullable: true, inList: ["Regular","Imprevisto"]
        usuario nullable: false
    }

    static belongsTo = [usuario: Usuario]
}
