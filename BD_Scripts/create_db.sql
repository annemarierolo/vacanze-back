DROP USER IF EXISTS "vacanza";

CREATE USER "vacanza" WITH
    LOGIN
    SUPERUSER
    INHERIT
    CREATEDB
    CREATEROLE
    ENCRYPTED PASSWORD 'vacanza'
    NOREPLICATION;

CREATE DATABASE "vacanza"
    WITH
    OWNER = "vacanza"
    ENCODING = 'UTF8'
    LC_COLLATE = 'C'
    LC_CTYPE = 'UTF-8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

----------------------------------grupo 9-------------------------------------------

CREATE SEQUENCE SEQ_RECLAMO
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;
  
CREATE TABLE RECLAMO(
    rec_id integer,
    rec_titulo varchar(30) NOT NULL,
    rec_descr varchar(30) NOT NULL,
    rec_status varchar(20) CHECK (rec_status ='ABIERTO' OR rec_status='CERRADO' OR rec_status='ESPERA'), 
    CONSTRAINT pk_reclamo PRIMARY KEY(rec_id)
    --CONSTRAINT pf_equipaje FOREIGN KEY (rec_equi_id) REFERENCES JUGADOR(equi_id) ON DELETE CASCADE ON UPDATE CASCADE, 
);

-------------AGREGAR RECLAMO-----------------

CREATE OR REPLACE FUNCTION AgregarReclamo(
    _titulo VARCHAR(20), 
    _descripcion VARCHAR(30),
    _status VARCHAR(30)
    ) 
RETURNS integer AS
$$
BEGIN

   INSERT INTO RECLAMO(rec_id ,rec_titulo, rec_descr, rec_status) VALUES
    (nextval('SEQ_RECLAMO'), _titulo, _descripcion, _status);
   RETURN currval('SEQ_RECLAMO');
END;
$$ LANGUAGE plpgsql;

---------MODIFICAR RECAMO-----------------
CREATE OR REPLACE FUNCTION ModificarReclamoStatus( 
    _idReclamo integer,
    _status VARCHAR(35))
RETURNS integer AS
$$
BEGIN

   UPDATE RECLAMO SET rec_status= _status
    WHERE (rec_id = _idReclamo);
   RETURN _idReclamo;
END;
$$ LANGUAGE plpgsql;
-- modificar el titulo del reclamo
CREATE OR REPLACE FUNCTION ModificarReclamoTitulo( 
	_idReclamo integer,
    _titulo VARCHAR(35))
RETURNS integer AS
$$
BEGIN

   UPDATE RECLAMO SET rec_titulo= _titulo
	WHERE (rec_id = _idReclamo);
   RETURN _idReclamo;
END;
$$ LANGUAGE plpgsql;
-------------------------------------ELIMAR RECLAMO-----------------------------
CREATE OR REPLACE FUNCTION EliminarReclamo(_idReclamo integer)
RETURNS void AS
$$
BEGIN

    DELETE FROM RECLAMO 
    WHERE (rec_id = _idReclamo);

END;
$$ LANGUAGE plpgsql;

--------------------------CONSULTAR LOGROS CANTIDAD PENDIENTE--------------------
CREATE OR REPLACE FUNCTION ConsultarUnReclamo(_idReclamo integer)
RETURNS TABLE
  (id integer,
   Titulo VARCHAR(30),
   Descripcion VARCHAR(30),
   Status VARCHAR(30)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    rec_id, rec_titulo,rec_descr, rec_status
    FROM RECLAMO WHERE rec_id = _idReclamo;
END;
$$ LANGUAGE plpgsql;

------------------------------------fin de grupo 9---------------------------------

CREATE TABLE Lugar (
  l_id SERIAL,
  l_tipo CHAR(1) NOT NULL,
  l_nombre VARCHAR(100) NOT NULL,
  fk_lugar INTEGER,
  CONSTRAINT pk_lugar PRIMARY KEY (l_id),
  CONSTRAINT check_tipo CHECK(l_tipo in ('P','C')) ---- P de pais y C de ciudad ------
);

CREATE TABLE Hotel (
                       hot_id                SERIAL,
                       hot_nombre            VARCHAR(100) NOT NULL,
                       hot_cant_habitaciones INTEGER      NOT NULL,
                       hot_activo            BOOLEAN      NOT NULL DEFAULT TRUE,
                       hot_telefono          VARCHAR(20)  NOT NULL,
                       hot_sitio_web         VARCHAR(100),
                       hot_fk_lugar          INTEGER      NOT NULL,
                       CONSTRAINT pk_hotel PRIMARY KEY (hot_id),
                       CONSTRAINT fk_hotel_lugar FOREIGN KEY (hot_fk_lugar) REFERENCES Lugar (l_id)
);

CREATE SEQUENCE SEQ_AUTOMOVIL
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;
  
CREATE TABLE AUTOMOVIL(
    aut_id integer,
    aut_make varchar(30) NOT NULL,
    aut_model varchar(30) NOT NULL,
    aut_capacity integer not null,
    aut_isActive BOOLEAN,
    aut_licence varchar(30) not null,
    aut_price integer not null,

    CONSTRAINT pk_automovil PRIMARY KEY(aut_id)

);
-------------AGREGAR AUTO-----------------

CREATE OR REPLACE FUNCTION AgregarAutomovil(
    _make VARCHAR(20), 
    _model VARCHAR(30),
    _capacity integer,
    _status BOOLEAN,
    _licence varchar(30),
    _price integer
    ) 
RETURNS integer AS
$$
BEGIN

   INSERT INTO AUTOMOVIL(aut_id,aut_make,aut_model,aut_capacity,aut_isActive,aut_licence,aut_price) VALUES
    (nextval('SEQ_AUTOMOVIL'), _make, _model,_capacity,_status,_licence,_price);
   RETURN currval('SEQ_AUTOMOVIL');
END;
$$ LANGUAGE plpgsql;
-------------------------------------------------------------------------------------------