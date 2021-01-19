package dipgisplan

class Usuario {

	transient springSecurityService

	String nombreCompleto
	byte[] foto
	String username
	String password
	boolean enabled
	boolean accountExpired
	boolean accountLocked
	boolean passwordExpired

	static constraints = {
		username blank: false, unique: true
		password blank: false
		nombreCompleto nullable: false, maxSize: 500
		area nullable:true
		foto nullable:true, maxSize: 1024 * 1024 * 10
	}

	static belongsTo = [area: Area]
	static hasMany = [actividades: Actividad, marcados: Marcado]

	static mapping = {
		password column: '`password`'
	}

	Set<Rol> getAuthorities() {
		UsuarioRol.findAllByUsuario(this).collect { it.rol } as Set
	}

	def beforeInsert() {
		encodePassword()
	}

	def beforeUpdate() {
		if (isDirty('password')) {
			encodePassword()
		}
	}

	protected void encodePassword() {
		password = springSecurityService.encodePassword(password)
	}
}
