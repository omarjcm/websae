#@(#) websae.sql
CREATE DATABASE IF NOT EXISTS websae;
USE websae;

CREATE TABLE Titulo
(
	id_titulo INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (50) NOT NULL,
	abreviatura CHAR (10) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tipo_Pregunta
(
	id_tipo_pregunta INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (250) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tipo_Material
(
	id_tipo_material INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (60) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tipo_Evento
(
	id_tipo_evento INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (50) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tipo_Empresa
(
	id_tipo_empresa INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (40) NOT NULL,
	descripcion CHAR (100) NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Rol
(
	id_rol INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (50) NOT NULL,
	descripcion CHAR (100) NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Pais
(
	id_pais INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (50) NOT NULL,
	continente ENUM ('Asia','Europe','North America','Africa','Oceania','Antarctica','South America') NOT NULL,
	region CHAR (26) NOT NULL,
	area_superficie FLOAT (10,2) NOT NULL,
	anio_independencia SMALLINT (6) NULL,
	poblacion INTEGER NOT NULL,
	expectativa_vida FLOAT (3,1) NULL,
	gnp FLOAT (10,2) NULL,
	gnpold FLOAT (10,2) NULL,
	nombre_local CHAR (45) NOT NULL,
	forma_gobierno CHAR (45) NOT NULL,
	cabeza_estado CHAR (60) NULL,
	capital INTEGER NULL,
	code CHAR (2) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Grupo_Investigacion
(
	id_grupo_investigacion INTEGER NOT NULL PRIMARY KEY,
	nombre_grupo CHAR (50) NOT NULL,
	objetivo_grupo TEXT NOT NULL,
	logo_direccion CHAR (100) NULL,
	pagina_web CHAR (100) NULL,
	telefono CHAR (16) NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Categoria
(
	id_categoria INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (80) NOT NULL,
	#indicador de estado
	estado INTEGER NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Cargo
(
	id_cargo INTEGER NOT NULL PRIMARY KEY,
	cargo CHAR (50) NOT NULL,
	#indicador de estado
	estado INT NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Opcion_Menu
(
	id_opcion_menu INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (30) NULL,
	link CHAR (100) NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

#<html>
#  <head>
#    
#  </head>
#  <body>
#    <p>
#      Persona que se suscribe al portal y se obtiene de ella sus datos, se 
#      relaciona con <b>Rol_Usuario</b> para asignarle roles dentro del 
#      sistema, con <b>Empresa_Usuario</b> para indicar la empresa o 
#      universidad en la cual labora o estudia, y con <b>Registro</b> para 
#      tener constancia del registro a los eventos que realicen los Grupos de 
#      Investigaci&#243;n.
#    </p>
#  </body>
#</html>
CREATE TABLE Usuario
(
	#identificador del objeto Usuario dentro del portal
	id_usuario INTEGER NOT NULL PRIMARY KEY,
	#N�mero de c�dula para personas de Ecuador o n�mero de pasaporte para extranjeros.
	identificacion CHAR (16) NOT NULL,
	#Debido a que puede ser CI (Nacional), CI (Extranjera) o No. de pasaporte.
	tipo_identificacion CHAR NOT NULL,
	#Nombre del usuario
	nombre CHAR (50) NOT NULL,
	#Apellido del usuario
	apellido CHAR (50) NOT NULL,
	#Email del usuario
	correo CHAR (50) NOT NULL,
	#Clave del usuario
	clave CHAR (15) NOT NULL,
	#fecha (dd,mm,aaaa) en que naci� el usuario
	fecha_nacimiento DATE NULL,
	#Direcci�n de domicilio del usuario
	direccion CHAR (50) NULL,
	#sexo del usuario (masculino o femenino)
	genero CHAR NOT NULL,
	#Tel�fono convencional del usuario
	telefono CHAR (20) NULL,
	#N�mero de tel�fono celular del usuario
	celular CHAR (16) NULL,
	#si el usuario estudia o trabaja.
	actividad CHAR NULL,
	#Informaci�n acerca del perfil profesional que ha llevado el usuario.
	hoja_vida TEXT NULL,
	#Ruta a la imagen de la foto del usuario.
	foto_direccion CHAR (20) NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_titulo INTEGER NULL,
	FOREIGN KEY(ref_titulo) REFERENCES Titulo (id_titulo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Subcategoria
(
	id_subcategoria INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (50) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_categoria INTEGER NOT NULL,
	FOREIGN KEY(ref_categoria) REFERENCES Categoria (id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Evento
(
	id_evento INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (250) NOT NULL,
	lugar CHAR (100) NOT NULL,
	objetivo TEXT NOT NULL,
	descripcion TEXT NOT NULL,
	dirigido TEXT NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	slogan CHAR (100) NOT NULL,
	direccion_grafico CHAR (50) NULL,
	descripcion_registro TEXT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_tipo_evento INTEGER NULL,
	FOREIGN KEY(ref_tipo_evento) REFERENCES Tipo_Evento (id_tipo_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Ciudad
(
	id_ciudad INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (35) NOT NULL,
	distrito CHAR (20) NOT NULL,
	poblacion INTEGER NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_pais INTEGER NOT NULL,
	FOREIGN KEY(ref_pais) REFERENCES Pais (id_pais)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tipo_Empresa_Cargo
(
	id_tipo_empresa_cargo INTEGER NOT NULL,
	ref_tipo_empresa INTEGER NULL,
	ref_cargo INTEGER NULL,
	FOREIGN KEY(ref_cargo) REFERENCES Cargo (id_cargo),
	FOREIGN KEY(ref_tipo_empresa) REFERENCES Tipo_Empresa (id_tipo_empresa)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Submenu
(
	id_submenu INTEGER NOT NULL PRIMARY KEY,
	ref_opcion_menu INTEGER NULL,
	ref_submenu INTEGER NULL,
	FOREIGN KEY(ref_submenu) REFERENCES Opcion_Menu (id_opcion_menu),
	FOREIGN KEY(ref_opcion_menu) REFERENCES Opcion_Menu (id_opcion_menu)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Subevento_Evento
(
	id_subevento_evento INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_evento INTEGER NULL,
	ref_subevento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_subevento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Subcategoria_Evento
(
	id_subcategoria_evento INTEGER NOT NULL PRIMARY KEY,
	porcentaje_descuento FLOAT (9,2) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_subcategoria INTEGER NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_subcategoria) REFERENCES Subcategoria (id_subcategoria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Rol_Usuario
(
	id_rol_usuario INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_rol INTEGER NULL,
	ref_usuario INTEGER NOT NULL,
	FOREIGN KEY(ref_usuario) REFERENCES Usuario (id_usuario),
	FOREIGN KEY(ref_rol) REFERENCES Rol (id_rol)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Organizador
(
	id_organizador INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_grupo_investigacion INTEGER NULL,
	ref_evento INTEGER NOT NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_grupo_investigacion) REFERENCES Grupo_Investigacion (id_grupo_investigacion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Material
(
	id_material INTEGER NOT NULL PRIMARY KEY,
	precio FLOAT (9,2) NOT NULL,
	cantidad_entregar INTEGER NOT NULL,
	descripcion CHAR (150) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_tipo_material INTEGER NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_tipo_material) REFERENCES Tipo_Material (id_tipo_material)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Fecha_Evento
(
	id_fecha_evento INTEGER NOT NULL PRIMARY KEY,
	fecha DATE NOT NULL,
	#indicador de estado
	estado INT,
	ref_evento INTEGER NOT NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Faq
(
	id_faq INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Empresa
(
	id_empresa INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (50) NOT NULL,
	direccion CHAR (60) NULL,
	telefono CHAR (16) NULL,
	codigo_postal CHAR (10) NULL,
	fax CHAR (16) NULL,
	logo_direccion CHAR (100) NULL,
	pagina_web CHAR (50) NULL,
	siglas CHAR (100) NULL,
	#indicador de estado
	estado INTEGER NOT NULL,
	ref_ciudad INTEGER NULL,
	ref_tipo_empresa INTEGER NULL,
	FOREIGN KEY(ref_tipo_empresa) REFERENCES Tipo_Empresa (id_tipo_empresa),
	FOREIGN KEY(ref_ciudad) REFERENCES Ciudad (id_ciudad)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Convocatoria
(
	id_convocatoria INTEGER NOT NULL PRIMARY KEY,
	descripcion TEXT NOT NULL,
	ruta_formato CHAR (100) NOT NULL,
	fecha_max_presentacion_art DATE NOT NULL,
	fecha_max_evaluacion_art DATE NOT NULL,
	fecha_max_aceptacion_art DATE NOT NULL,
	fecha_max_correccion_art DATE NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Categoria_Evento
(
	id_categoria_evento INTEGER NOT NULL PRIMARY KEY,
	precio FLOAT (9,2) NOT NULL,
	fecha_inicio DATE NOT NULL,
	fecha_fin DATE NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_categoria INTEGER NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_categoria) REFERENCES Categoria (id_categoria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Articulo
(
	id_articulo INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (250) NOT NULL,
	resumen TEXT NOT NULL,
	palabras_claves CHAR (100) NULL,
	direccion_articulo CHAR (255) NOT NULL,
	fecha_publicacion DATE NOT NULL,
	comentario_autor TEXT NULL,
	descarga CHAR (11) NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Menu_Evento
(
	id_menu_evento Integer NOT NULL PRIMARY KEY,
	ref_evento INTEGER NOT NULL,
	ref_opcion_menu INTEGER NULL,
	FOREIGN KEY(ref_opcion_menu) REFERENCES Opcion_Menu (id_opcion_menu),
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tema
(
	id_tema INTEGER NOT NULL PRIMARY KEY,
	nombre CHAR (100) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_convocatoria INTEGER NOT NULL,
	FOREIGN KEY(ref_convocatoria) REFERENCES Convocatoria (id_convocatoria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Registro
(
	id_registro INTEGER NOT NULL PRIMARY KEY,
	fecha_registro DATE NOT NULL,
	valor_total_registro FLOAT (9,2) NOT NULL,
	aprobar_descuento INTEGER NOT NULL,
	asistencia INTEGER NOT NULL,
	pagado INTEGER NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_categoria_evento INTEGER NULL,
	ref_subcategoria_evento INTEGER NULL,
	ref_evento INTEGER NULL,
	ref_rol_usuario INTEGER NULL,
	ref_usuario INTEGER NULL,
	FOREIGN KEY(ref_rol_usuario) REFERENCES Rol_Usuario (id_rol_usuario),
	FOREIGN KEY(ref_usuario) REFERENCES Usuario (id_usuario),
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_categoria_evento) REFERENCES Categoria_Evento (id_categoria_evento),
	FOREIGN KEY(ref_subcategoria_evento) REFERENCES Subcategoria_Evento (id_subcategoria_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Pregunta_Faq
(
	id_pregunta_faq INTEGER NOT NULL PRIMARY KEY,
	pregunta CHAR (200) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_faq INTEGER NOT NULL,
	FOREIGN KEY(ref_faq) REFERENCES Faq (id_faq)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Evaluador_Articulo
(
	id_evaluador_articulo INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_evaluador_articulo INTEGER NULL,
	FOREIGN KEY(ref_evaluador_articulo) REFERENCES Rol_Usuario (id_rol_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Evaluacion
(
	id_evaluacion INTEGER NOT NULL PRIMARY KEY,
	mensaje TEXT NOT NULL,
	descripcion TEXT NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_convocatoria INTEGER NULL,
	FOREIGN KEY(ref_convocatoria) REFERENCES Convocatoria (id_convocatoria)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Empresa_Usuario
(
	id_empresa_usuario INTEGER NOT NULL PRIMARY KEY,
	telefono_oficina CHAR (16) NULL,
	fax_oficina CHAR (16) NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_cargo INTEGER NULL,
	ref_empresa INTEGER NULL,
	ref_usuario INTEGER NULL,
	FOREIGN KEY(ref_usuario) REFERENCES Usuario (id_usuario),
	FOREIGN KEY(ref_empresa) REFERENCES Empresa (id_empresa),
	FOREIGN KEY(ref_cargo) REFERENCES Cargo (id_cargo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Conferencista_Evento
(
	id_conferencista_evento INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_rol_usuario INTEGER NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento),
	FOREIGN KEY(ref_rol_usuario) REFERENCES Rol_Usuario (id_rol_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Autor_Articulo
(
	id_autor_articulo INTEGER NULL PRIMARY KEY,
	autor_principal INTEGER NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_articulo INTEGER NOT NULL,
	ref_rol_usuario INTEGER NULL,
	FOREIGN KEY(ref_articulo) REFERENCES Articulo (id_articulo),
	FOREIGN KEY(ref_rol_usuario) REFERENCES Rol_Usuario (id_rol_usuario)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Auspicio
(
	id_auspicio INTEGER NOT NULL PRIMARY KEY,
	monto FLOAT (9,2) NULL,
	descripcion TEXT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_empresa INTEGER NULL,
	ref_evento INTEGER NULL,
	FOREIGN KEY(ref_empresa) REFERENCES Empresa (id_empresa),
	FOREIGN KEY(ref_evento) REFERENCES Evento (id_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Actividad
(
	id_actividad INTEGER NOT NULL PRIMARY KEY,
	hora_inicio TIME NOT NULL,
	hora_fin TIME NOT NULL,
	actividad CHAR (200) NOT NULL,
	expositor CHAR (100) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_fecha_evento INTEGER NOT NULL,
	FOREIGN KEY(ref_fecha_evento) REFERENCES Fecha_Evento (id_fecha_evento)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Menu
(
	id_menu INTEGER NOT NULL PRIMARY KEY,
	ref_opcion_menu INTEGER NULL,
	ref_rol_usuario INTEGER NOT NULL,
	FOREIGN KEY(ref_rol_usuario) REFERENCES Rol_Usuario (id_rol_usuario),
	FOREIGN KEY(ref_opcion_menu) REFERENCES Opcion_Menu (id_opcion_menu)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Tema_Articulo
(
	id_tema_articulo INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_tema INTEGER NULL,
	ref_articulo INTEGER NULL,
	FOREIGN KEY(ref_articulo) REFERENCES Articulo (id_articulo),
	FOREIGN KEY(ref_tema) REFERENCES Tema (id_tema)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Seccion
(
	id_seccion INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (250) NOT NULL,
	descripcion TEXT NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_evaluacion INTEGER NULL,
	FOREIGN KEY(ref_evaluacion) REFERENCES Evaluacion (id_evaluacion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Respuesta_Faq
(
	id_respuesta_faq INTEGER NOT NULL PRIMARY KEY,
	respuesta TEXT NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_pregunta_faq INTEGER NOT NULL,
	FOREIGN KEY(ref_pregunta_faq) REFERENCES Pregunta_Faq (id_pregunta_faq)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Material_Registro
(
	id_material_registro INTEGER NOT NULL PRIMARY KEY,
	cantidad_adicional INT NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_registro INTEGER NULL,
	ref_material INTEGER NULL,
	FOREIGN KEY(ref_material) REFERENCES Material (id_material),
	FOREIGN KEY(ref_registro) REFERENCES Registro (id_registro)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Conferencista_Evento_Articulo
(
	id_conferencista_evento_articulo INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_conferencista_evento INTEGER NULL,
	ref_articulo INTEGER NULL,
	FOREIGN KEY(ref_conferencista_evento) REFERENCES Conferencista_Evento (id_conferencista_evento),
	FOREIGN KEY(ref_articulo) REFERENCES Articulo (id_articulo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Pregunta
(
	id_pregunta INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (250) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_seccion INTEGER NULL,
	ref_tipo_pregunta INTEGER NULL,
	FOREIGN KEY(ref_tipo_pregunta) REFERENCES Tipo_Pregunta (id_tipo_pregunta),
	FOREIGN KEY(ref_seccion) REFERENCES Seccion (id_seccion)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Evaluacion_Tema_Articulo
(
	id_evaluacion_tema_articulo INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_evaluacion INTEGER NULL,
	ref_tema_articulo INTEGER NULL,
	ref_evaluador_articulo INTEGER NOT NULL,
	FOREIGN KEY(ref_evaluacion) REFERENCES Evaluacion (id_evaluacion),
	FOREIGN KEY(ref_evaluador_articulo) REFERENCES Evaluador_Articulo (id_evaluador_articulo),
	FOREIGN KEY(ref_tema_articulo) REFERENCES Tema_Articulo (id_tema_articulo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Respuesta
(
	id_respuesta INTEGER NOT NULL PRIMARY KEY,
	#indicador de estado
	estado INT NOT NULL,
	ref_evaluacion_tema_articulo INTEGER NULL,
	FOREIGN KEY(ref_evaluacion_tema_articulo) REFERENCES Evaluacion_Tema_Articulo (id_evaluacion_tema_articulo)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE Alternativa
(
	id_alternativa INTEGER NOT NULL PRIMARY KEY,
	titulo CHAR (250) NOT NULL,
	#indicador de estado
	estado INT NOT NULL,
	ref_pregunta INTEGER NULL,
	FOREIGN KEY(ref_pregunta) REFERENCES Pregunta (id_pregunta)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
