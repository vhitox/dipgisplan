package dipgisplan

class Area {

    String nombre
    static constraints = {
        nombre nullable: false
    }

    static hasMany = [usuarios: Usuario]
}
