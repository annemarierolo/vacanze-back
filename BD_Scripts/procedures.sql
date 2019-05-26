------- grupo 2 ----------
CREATE OR REPLACE FUNCTION GetRoles()
RETURNS TABLE
  (id integer,
   nombre VARCHAR(50)
  )
AS
$$
BEGIN
  RETURN QUERY SELECT *
  FROM Role;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetRolesForUser(user_id integer)
    RETURNS TABLE
            (id integer,
             nombre VARCHAR(50)
            )
AS
$$
BEGIN
    RETURN QUERY SELECT role.* FROM Role AS role, User_Role 
    WHERE usr_rol_id = role.rol_id AND usr_use_id = user_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetEmployees()
RETURNS TABLE
    (id integer, 
    documentId VARCHAR(50),
    name VARCHAR(50), 
    lastname VARCHAR(50), 
    email VARCHAR(50))
AS
$$
    BEGIN
        RETURN QUERY SELECT DISTINCT use_id, use_document_id, use_name, use_last_name, use_email 
        FROM Users, User_Role WHERE use_id = usr_use_id AND usr_rol_id <> 1;
    END;
$$ LANGUAGE plpgsql;

------- grupo 6 ----------
CREATE OR REPLACE FUNCTION ConsultarHoteles()
RETURNS TABLE
  (id integer,
   nombre VARCHAR(100),
   cantHuespedes INTEGER,
   status BOOLEAN,
   telefono VARCHAR(20),
   sitioweb VARCHAR(100),
   ciudad VARCHAR(100)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    H.hot_id, H.hot_nombre,H.hot_capHuesped, H.hot_statusActivo,H.hot_telefono,H.hot_sitio_web, L.l_nombre
    FROM Hotel AS H, Lugar AS L WHERE L.l_id = H.fk_lugar;
END;
$$ LANGUAGE plpgsql;

------------------------------------ grupo 8 --------------------------------------

---------Agregar Ship-------------------
CREATE OR REPLACE FUNCTION AddShip( 
  _shi_name VARCHAR(20),
  _shi_capacity INTEGER,
  _shi_loadingcap INTEGER,
  _shi_model VARCHAR(20),
  _shi_line VARCHAR(30),
  _shi_picture VARCHAR
  ) 
RETURNS integer AS
$$
BEGIN

   INSERT INTO Ship(shi_name, shi_capacity ,shi_loadingcap, shi_model,
                    shi_line, shi_picture ) VALUES
    ( _shi_name, _shi_capacity, _shi_loadingcap, _shi_model, _shi_line, _shi_picture );
   RETURN currval('SEQ_SHIP');
END;
$$ LANGUAGE plpgsql;

-------Agregar Crucero--------------------

CREATE OR REPLACE FUNCTION AddCruise( 
  _cru_shi_fk INTEGER,
  _cru_departuredate TIMESTAMP,
  _cru_arrivaldate TIMESTAMP,
  _cru_price DECIMAL
  ) 
RETURNS integer AS
$$
BEGIN

   INSERT INTO Cruise(cru_shi_fk, cru_departuredate, cru_arrivaldate, cru_price ) VALUES
    ( _cru_shi_fk, _cru_departuredate, _cru_arrivaldate, _cru_price );
   RETURN currval('SEQ_CRU');
END;
$$ LANGUAGE plpgsql;

--------Eliminar Ship--------------------
CREATE OR REPLACE FUNCTION DeleteShip(_shi_id integer)
RETURNS void AS
$$
BEGIN

    DELETE FROM Ship 
    WHERE (shi_id = _shi_id);

END;
$$ LANGUAGE plpgsql;
--------Eliminar Cruise------------------
CREATE OR REPLACE FUNCTION DeleteCruise(_cru_id integer)
RETURNS void AS
$$
BEGIN

    DELETE FROM Cruise 
    WHERE (cru_id = _cru_id);

END;
$$ LANGUAGE plpgsql;
--------Modificar Ship-------------------
CREATE OR REPLACE FUNCTION ModifyShipIsActive( 
    _shi_id integer,
    _shi_isactive boolean)
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_isactive= _shi_isactive
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipName( 
    _shi_id integer,
    _shi_name VARCHAR(20))
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_name= _shi_name
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipCapacity( 
    _shi_id integer,
    _shi_capacity integer)
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_capacity= _shi_capacity
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipLoadingcap( 
    _shi_id integer,
    _shi_loadingcap integer)
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_loadingcap= _shi_loadingcap
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipModel( 
    _shi_id integer,
    _shi_model VARCHAR(20))
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_model= _shi_model
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipLine( 
    _shi_id integer,
    _shi_line VARCHAR(30))
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_line= _shi_line
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyShipPicture( 
    _shi_id integer,
    _shi_picture VARCHAR)
RETURNS integer AS
$$
BEGIN

   UPDATE Ship SET shi_picture= _shi_picture
    WHERE (shi_id = _shi_id);
   RETURN _shi_id;
END;
$$ LANGUAGE plpgsql;

--------Modificar Cruise-----------------

CREATE OR REPLACE FUNCTION ModifyCruiseDepartureDate( 
    _cru_id integer,
    _cru_departuredate TIMESTAMP)
RETURNS integer AS
$$
BEGIN

   UPDATE Cruise SET cru_departuredate= _cru_departuredate
    WHERE (cru_id = _cru_id);
   RETURN _cru_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyCruiseArrivalDate( 
    _cru_id integer,
    _cru_arrivaldate TIMESTAMP)
RETURNS integer AS
$$
BEGIN

   UPDATE Cruise SET cru_arrivaldate= _cru_arrivaldate
    WHERE (cru_id = _cru_id);
   RETURN _cru_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyCruisePrice( 
    _cru_id integer,
    _cru_price DECIMAL)
RETURNS integer AS
$$
BEGIN

   UPDATE Cruise SET cru_price= _cru_price
    WHERE (cru_id = _cru_id);
   RETURN _cru_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION ModifyCruiseShip( 
    _cru_id integer,
    _cru_shi_fk integer)
RETURNS integer AS
$$
BEGIN

   UPDATE Cruise SET cru_shi_fk= _cru_shi_fk
    WHERE (cru_id = _cru_id);
   RETURN _cru_id;
END;
$$ LANGUAGE plpgsql;

--------Consultar Ship-------------------
CREATE OR REPLACE FUNCTION GetShip(_shi_id integer)
RETURNS TABLE
  (id integer,
   name VARCHAR(30),
   status VARCHAR(30),
   capacity(people) VARCHAR(30),
   capacity(tonnes) VARCHAR(30),
   model VARCHAR(30),
   cruise_line VARCHAR(30)

  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    shi_id, shi_name, shi_isactive, shi_capacity, shi_loadingcap, shi_model, shi_line
    FROM Ship WHERE shi_id = _shi_id;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GetShipPic(_shi_id integer)
RETURNS VARCHAR
AS
$$
BEGIN
    RETURN QUERY SELECT
    shi_picture
    FROM Ship WHERE shi_id = _shi_id;
END;
$$ LANGUAGE plpgsql;
--------Consultar Cruise-----------------

CREATE OR REPLACE FUNCTION GetCruise(_cru_id integer)
RETURNS TABLE
  (id integer,
   ship VARCHAR(30),
   departure_date VARCHAR(30),
   arrival_date VARCHAR(30),
   price VARCHAR(30)

  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    cru_id, cru_shi_fk, cru_departuredate, cru_arrivaldate, cru_price
    FROM Cruise WHERE cru_id = _cru_id;
END;
$$ LANGUAGE plpgsql;
------------------------------------fin de grupo 8---------------------------------

-- grupo 9 -----------------------------------------
-------------AGREGAR Claim-----------------

CREATE OR REPLACE FUNCTION AddClaim(
    _cla_title VARCHAR(20), 
    _cla_description VARCHAR(30)
    ) 
RETURNS integer AS
$$
BEGIN

   INSERT INTO Claim(cla_title, cla_descr, cla_status) VALUES
    ( _cla_title, _cla_description, 'ABIERTO');
   RETURN currval('SEQ_Claim');
END;
$$ LANGUAGE plpgsql;

---------MODIFICAR Reclamo-----------------
CREATE OR REPLACE FUNCTION ModifyClaimStatus( 
    _cla_id integer,
    _cla_status VARCHAR(35))
RETURNS integer AS
$$
BEGIN

   UPDATE Claim SET cla_status= _cla_status
    WHERE (cla_id = _cla_id);
   RETURN _cla_id;
END;
$$ LANGUAGE plpgsql;
-- modificar el titulo del reclam y la descripcion
CREATE OR REPLACE FUNCTION ModifyClaimTitle( 
	_cla_id integer,
    _cla_title VARCHAR(35),
	_cla_descr VARCHAR(30))
RETURNS integer AS
$$
BEGIN

   UPDATE Claim SET cla_title= _cla_title and cla_descr= _cla_descr
	WHERE (cla_id = _cla_id);
   RETURN _cla_id;
END;
$$ LANGUAGE plpgsql;
-------------------------------------ELIMAR Reclamo-----------------------------

CREATE OR REPLACE FUNCTION DeleteClaim(_cla_id integer)
RETURNS void AS
$$
BEGIN

    DELETE FROM Claim 
    WHERE (cla_id = _cla_id);

END;
$$ LANGUAGE plpgsql;
--------------------------CONSULTAR Claim--------------------
CREATE OR REPLACE FUNCTION GetClaim(_cla_id integer)
RETURNS TABLE
  (id integer,
   title VARCHAR(30),
   descr VARCHAR(30),
   status VARCHAR(30)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    cla_id, cla_title,cla_descr, cla_status
    FROM ClaimWHERE WHERE cla_id = _cla_id;
END;
$$ LANGUAGE plpgsql;

--------------------------CONSULTAR Claim--------------------
CREATE OR REPLACE FUNCTION GetClaimBaggage(_cla_id integer)
RETURNS TABLE
  (id integer,
   title VARCHAR(30),
   descr VARCHAR(30),
   status VARCHAR(30)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    cla_id, cla_title,cla_descr, cla_status
    FROM Claim WHERE cla_id = _cla_id;
END;
$$ LANGUAGE plpgsql;

--------------------------CONSULTAR Claim--------------------
CREATE OR REPLACE FUNCTION GetClaimDocumentPasaport(_cla_id integer)
RETURNS TABLE
  (id integer,
   title VARCHAR(30),
   descr VARCHAR(30),
   status VARCHAR(30)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    cla_id, cla_title,cla_descr, cla_status
    FROM Claim WHERE cla_id = _cla_id;
END;
$$ LANGUAGE plpgsql;

--------------------------CONSULTAR Claim--------------------
CREATE OR REPLACE FUNCTION GetClaimDocumentCedula(_cla_id integer)
RETURNS TABLE
  (id integer,
   title VARCHAR(30),
   descr VARCHAR(30),
   status VARCHAR(30)
  )
AS
$$
BEGIN
    RETURN QUERY SELECT
    cla_id, cla_title,cla_descr, cla_status
    FROM Claim WHERE cla_id = _cla_id;
END;
$$ LANGUAGE plpgsql;



------------------------------------fin de grupo 9---------------------------------
