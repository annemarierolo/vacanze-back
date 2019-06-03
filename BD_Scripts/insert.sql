INSERT INTO LOCATION (LOC_CITY, LOC_COUNTRY) VALUES
('Lebowakgomo','South Africa'),
('Potchefstroom','South Africa'),
('Graaff Reinet','South Africa'),
('Rustenburg','South Africa'),
('Brandfort','South Africa'),
('Vryheid','South Africa'),
('Vereeniging','South Africa'),
('Brits','South Africa'),
('Bethlehem','South Africa'),
('Ubomba','South Africa'),
('Polokwane','South Africa'),
('Springbok','South Africa'),
('Thohoyandou','South Africa'),
('Pietermaritzburg','South Africa'),
('Poffader','South Africa'),
('Carnarvon','South Africa'),
('Kroonstad','South Africa'),
('Alexander Bay','South Africa'),
('Bloemhof','South Africa'),
('Hermanus','South Africa'),
('Bethal','South Africa'),
('Upington','South Africa'),
('Tzaneen','South Africa'),
('Vanhynsdorp','South Africa'),
('Kimberley','South Africa'),
('Chaguaramas','Venezuela'),
('El Dorado','Venezuela'),
('El Manteco','Venezuela'),
('Caracas','Venezuela'),
('Barcelona','Venezuela'),
('Barinas','Venezuela'),
('Barquisimeto','Venezuela'),
('Ciudad Bolivar','Venezuela'),
('Coro','Venezuela'),
('Cumana','Venezuela'),
('Guanare','Venezuela'),
('La Guaira','Venezuela'),
('Los Teques','Venezuela'),
('Maracaibo','Venezuela'),
('Maracay','Venezuela'),
('Maturin','Venezuela'),
('Merida','Venezuela'),
('San Carlos','Venezuela'),
('San Cristobal','Venezuela'),
('San Felipe','Venezuela'),
('San Fernando de Apure','Venezuela'),
('San Juan De Los Morros','Venezuela'),
('Trujillo','Venezuela'),
('Tucupita','Venezuela'),
('Valencia','Venezuela'),
('Puerto Ayacucho','Venezuela'),
('La Asuncion','Venezuela'),
('El Tigre','Venezuela'),
('Ciudad Guayana','Venezuela'),
('Upata','Venezuela'),
('Puerto la Cruz','Venezuela'),
('Anaco','Venezuela'),
('Porlamar','Venezuela'),
('La Esmeralda','Venezuela'),
('Guasdualito','Venezuela'),
('Valle de la Pascua','Venezuela'),
('Zaraza','Venezuela'),
('Altagracia de Orituco','Venezuela'),
('Carora','Venezuela'),
('Puerto Cabello','Venezuela'),
('Maiquetia','Venezuela'),
('Ocumare del Tuy','Venezuela'),
('Calabozo','Venezuela'),
('Acarigua','Venezuela'),
('Cabimas','Venezuela'),
('Santa Rita','Venezuela'),
('San Carlos del Zulia','Venezuela'),
('Machiques','Venezuela'),
('Valera','Venezuela'),
('Punto Fijo','Venezuela'),
('Carupano','Venezuela'),
('Sunbury','Australia'),
('Sydney','Australia'),
('Horsham','Australia'),
('Hughenden','Australia'),
('Northam','Australia'),
('Selkirk','Canada'),
('Lansdowne House','Canada'),
('Paulatuk','Canada'),
('Attawapiskat','Canada'),
('Rimouski','Canada'),
('Grand Prairie','Canada'),
('La Sarre','Canada'),
('Mingan','Canada'),
('Prince Albert','Canada'),
('Moose Jaw','Canada'),
('Powell River','Canada'),
('Pangnirtung','Canada'),
('Nelson','Canada'),
('Peace River','Canada'),
('Cobalt','Canada'),
('New Glasgow','Canada'),
('Arctic Bay','Canada'),
('Burwash Landing','Canada'),
('Saint-Georges','Canada'),
('Vancouver','Canada'),
('Medicine Hat','Canada'),
('Naujaat','Canada'),
('Lethbridge','Canada'),
('Sudbury','Canada'),
('Swift Current','Canada'),
('Regina','Canada'),
('Cornwall','Canada'),
('Taloyoak','Canada'),
('Tuktoyaktuk','Canada'),
('Deer Lake','Canada'),
('London','Canada'),
('Red Lake','Canada'),
('Stephenville','Canada'),
('Ennadai','Canada'),
('Happy Valley - Goose Bay','Canada'),
('Williams Lake','Canada'),
('Prince Rupert','Canada'),
('Chilliwack','Canada'),
('Radisson','Canada'),
('Montreal','Canada'),
('Warrington','United Kingdom'),
('Newbury','United Kingdom'),
('Swindon','United Kingdom'),
('Wick','United Kingdom'),
('Dudley','United Kingdom'),
('Oxford','United Kingdom'),
('Hackney','United Kingdom'),
('Matlock','United Kingdom'),
('Lochgilphead','United Kingdom'),
('Northallerton','United Kingdom'),
('Edinburgh','United Kingdom'),
('Sunderland','United Kingdom'),
('Swansea','United Kingdom'),
('Wokingham','United Kingdom'),
('City of Westminster','United Kingdom'),
('Solihull','United Kingdom'),
('Rochdale','United Kingdom'),
('Hirosaki','Japan'),
('Kure','Japan'),
('Hachinohe','Japan'),
('Matsumoto','Japan'),
('Tokyo','Japan'),
('Chiba','Japan'),
('Fukui','Japan'),
('Fukuoka','Japan'),
('Fukushima','Japan'),
('Gifu','Japan'),
('Hiroshima','Japan'),
('Morioka','Japan'),
('Nagano','Japan'),
('Nagasaki','Japan'),
('Nagoya','Japan'),
('Naha','Japan'),
('Niigata','Japan'),
('Oita','Japan'),
('Okayama','Japan'),
('Osaka','Japan'),
('Otsu','Japan'),
('Sapporo','Japan'),
('Sendai','Japan');
------- grupo 2 ----------

INSERT INTO Role (rol_name)
VALUES ('Cliente');

INSERT INTO Role (rol_name)
VALUES ('Administrador');

INSERT INTO Role (rol_name)
VALUES ('Checkin');

INSERT INTO Role (rol_name)
VALUES ('Reclamo');

INSERT INTO Role (rol_name)
VALUES ('Cargador');

INSERT INTO Users(use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('9784673', 'admin@vacanze.com', 'Virtuoso', 'Francisco', MD5('admin123'));

INSERT INTO Users(use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('10754927', 'checkin@vacanze.com', 'Gomes', 'Francisco', MD5('checkin123'));

INSERT INTO Users(use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('12345678', 'reclamo@vacanze.com', 'Omar', 'Jorge', MD5('reclamo123'));

INSERT INTO Users(use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('8654826', 'cargador@vacanze.com', 'Salazar', 'Marcos', MD5('cargador123'));

INSERT INTO Users(use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('20766589', 'cliente@vacanze.com', 'Martinez', 'Carlos', MD5('cliente123'));

INSERT INTO USERS (use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('23613704', 'larry.page@vacanze.com', 'Page', 'Larry', MD5('google'));

INSERT INTO USERS (use_document_id, use_email, use_last_name, use_name, use_password)
VALUES ('23613704', 'reggaebob@vacanze.com', 'Marley', 'Bob', MD5('jah'));

INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (2, 1 );
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (3, 2);
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (4, 3);
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (5, 4);
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (1, 5);
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (1, 6);
INSERT INTO User_Role(usr_rol_id, usr_use_id) VALUES (1, 7);

-------------------------------Grupo 3---------------------------------------------------
INSERT INTO public.Plane(
	pla_autonomy, pla_isActive, pla_capacity, pla_loadingCap, pla_model)
	VALUES (100,true, 50, 1000, 'Boeing 1');
INSERT INTO public.Plane(
	pla_autonomy, pla_isActive, pla_capacity, pla_loadingCap, pla_model)
	VALUES (150,true, 40, 1000, 'Boeing 2');
INSERT INTO public.Plane(
	pla_autonomy, pla_isActive, pla_capacity, pla_loadingCap, pla_model)
	VALUES (111,true, 30, 1000, 'Boeing 3');
INSERT INTO public.Plane(
	pla_autonomy, pla_isActive, pla_capacity, pla_loadingCap, pla_model)
	VALUES (200,true, 50, 2000, 'Boeing 4');
INSERT INTO public.Plane(
	pla_autonomy, pla_isActive, pla_capacity, pla_loadingCap, pla_model)
	VALUES (80,true, 10, 1000, 'Boeing 5');

--------------Grupo 5 --------------------------------------------
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Toyota','Corolla',3,true,55,'aa11ab1','auto1.jpg',1);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('VolksWagen','Golf',3,false,70.5,'aa11ab2','auto2.jpg',1);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Honda','Civic',3,true,40,'aa12ab1','auto3.jpg',2);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Ford','Fusion',3,false,60,'aa12ab2','auto4.jpg',2);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Ford','F-150',4,true,80,'aa13ab1','auto5.jpg',3);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Honda','Civic',3,false,50.2,'aa13ab2','auto6.jpg',3);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Toyota','Camry',3,true,60,'aa14ab1','auto7.jpg',4);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Honda','Accord',3,false,54,'aa14ab2','auto8.jpg',4);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Honda','CR-V',3,true,55,'aa15ab1','auto9.jpg',5);
INSERT INTO AUTOMOBILE(AUT_MAKE,AUT_MODEL,AUT_CAPACITY,AUT_ISACTIVE,AUT_PRICE,AUT_LICENSE,AUT_PICTURE,AUT_LOC_FK)
VALUES('Chevrolet','Silverado',5,false,69.8,'aa15ab2','auto10.jpg',5);

------- grupo 6 ----------

INSERT INTO hotel (hot_name, hot_room_qty, hot_room_capacity, hot_is_active,
                   hot_address_specs, hot_room_price, hot_website, hot_phone, hot_picture,
                   hot_stars, hot_loc_fk)
VALUES	('Prueba 1', 30, 4, true, 'Alguna direccion, algun lugar', 234.5, null, null, null, 4, 1),
		('Prueba 2', 40, 2, true, 'Alguna direccion, algun lugar', 500.5, null, '+58 4253 2732', null, 5, 10),
		('Prueba 3', 40, 2, true, 'Alguna direccion, algun lugar', 500.5, null, '+58 4253 2732', null, 5, 10),
		('Posada Los Caracas', 8, 6, true, 'Playa la Punta', 150.5, null, null, null, 3, 37),
		('Hotel Tanaguarena', 8, 6, true, 'Al frente de playa escondida', 400.5, null, null, null, 4, 37),
		('Posada Los Cocos', 8, 6, true, 'Playa Los Cocos', 400.5, null, null, null, 3, 37),
		('Hotel Otro País', 8, 6, true, 'Playa Otro País', 400.5, null, null, null, 3, 37),
		('Pelua Surf Hotel', 8, 6, true, 'Playa Pelua papa, la original', 400.5, null, null, null, 3, 37),
		('Posada Anare', 8, 6, true, '...', 400.5, null, null, null, 3, 37),
		('Secret Spot Hotel', 8, 6, true, 'Secret Spot La Guaira', 400.5, null, null, null, 3, 37),
        ('Puerto Cabello Surf House', 12, 4, true, 'El Palito', 225.5, null, '+58 414 1100085', null, 4, 65),
        ('Carabobo Surfer', 12, 4, true, '...', 225.5, null, '+58 414 1100085', null, 4, 65),
        ('Carabobo Hotel', 12, 4, true, '...', 225.5, null, '+58 414 1100085', null, 4, 65),
        ('Posada De Doña Barbara', 12, 4, true, 'Arepera Doña Barbara', 225.5, null, '+58 414 1100085', null, 4, 76),
        ('Carupano Hotel', 12, 4, true,	 '...', 225.5, null, '+58 414 1100085', null, 5, 76),
        ('Purto Hotel', 12, 4, true, 'Puerto', 225.5, null, '+58 414 1100085', null, 4, 56),
        ('Posada Puerto La Cruz', 12, 4, true, 'Puerto', 225.5, null, '+58 414 1100085', null, 4, 56),
        ('Tokyo Hotel', 12, 4, true, 'Rock Band', 225.5, null, '+58 414 1100085', null, 4, 143),
        ('Tokyo Sushi', 12, 4, true, 'Sushi Sushi', 225.5, null, '+58 414 1100085', null, 4, 143),
        ('Osaka Hotel', 12, 4, true, '...', 225.5, null, '+58 414 1100085', null, 4, 158),
        ('Hotel Gioli', 12, 4, true, 'San Ignacio', 270.5, null, '+58 414 1100085', null, 4, 29),
		('Hotel Dallas', 12, 4, true, 'Chacaito', 300.5, null, '+58 414 1100085', null, 4, 29),
		('Hotel Renaissance', 12, 4, true, 'Los Palos Grandes', 5000.5, null, '+58 414 1100085', null, 4, 29),
		('Hotel Caracas', 12, 4, true, 'Caracas', 225.5, null, '+58 414 1100085', null, 4, 29),
		('Hotel Oxford', 12, 4, true, 'Oxford', 2100.5, null, '+58 414 1100085', null, 4, 127),
		('Sydney Hotel', 12, 4, true, 'Sydney', 1300.5, null, '+58 414 1100085', null, 4, 78),
		('Gold Coast Hotel', 12, 4, true, 'Sydney', 2125.5, null, '+58 414 1100085', null, 4, 78);

------- grupo 7 ----------
INSERT INTO restaurant(res_name, res_capacity , res_isactive, res_qualify, res_specialty, 
res_price, res_businessname, res_picture, res_descr, res_tlf, res_loc_fk, res_address_specs) 
VALUES	('Pescado Frito', 50, default, 5,'Carite', 100, 'sam', null, 'Pescado Frito', '04141100085', 37, 'Naiguata'),
	('Paellon', 50, default, 5,'Paella', 100, 'sam', null, 'Paella', '04141100085', 37, 'Naiguata'),
	('Pescado Burger', 50, default, 5,'Hamburguesa', 100, 'sam', null, 'Hamburguesa', '04141100085', 37, 'Naiguata'),
	('Empanadas Finas', 50, default, 5,'Empanadas', 100, 'sam', null, 'Empanadas', '04141100085', 37, 'Tanaguarena'),
	('Paellon', 50, default, 5,'Paella', 100, 'sam', null, 'Paella', '04141100085', 37, 'Naiguata'),
	('Mama Pancha', 50, default, 5,'Arepa', 100, 'sam', null, 'Arepa', '04141100085', 65, 'Puerto Cabello'),
	('Pepito Gloton', 50, default, 5,'Pepito', 100, 'sam', null, 'Pepito', '04141100085', 65, 'Puerto Cabello'),
	('Parrillita', 50, default, 5,'Parrilla', 100, 'sam', null, 'Parrilla', '04141100085', 65, 'Puerto Cabello'),
	('Criollo', 50, default, 5,'Arepa', 100, 'sam', null, 'Arepa', '04141100085', 65, 'Puerto Cabello'),
	('Empana', 50, default, 5,'Empanadas', 100, 'sam', null, 'Empanadas', '04141100085', 76, 'Carupano'),
	('La Doña', 50, default, 5,'Pabellon', 100, 'sam', null, 'Pabellon', '04141100085', 76, 'Carupano'),
	('BurguerKing', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 56, 'Puerto La Cruz'),
	('Macdonald', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 56, 'Puerto La Cruz'),
	('Wendy', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Cuadra contigo', '04141100085', 56, 'Puerto La Cruz'),
	('KFC', 50, default, 5,'Pollo', 100, 'sam', null, 'Pollo', '04141100085', 56, 'Puerto La Cruz'),
	('Sushi shu', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 143, 'Tokyo'),
	('Sushishi', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 143, 'Tokyo'),
	('Sushi fu', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 143, 'Tokyo'),
	('KFC', 50, default, 5,'Pollo', 100, 'sam', null, 'Pollo', '04141100085', 143, 'Tokyo'),
	('Sushi shu', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 158, 'Osaka'),
	('Sushishi', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 158, 'Osaka'),
	('Sushi fu', 50, default, 5,'Sushi', 100, 'sam', null, 'Sushi', '04141100085', 158, 'Osaka'),
	('Macdonald', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 158, 'Osaka'),
	('Macdonald', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 127, 'Oxford'),
	('Wendy', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Cuadra contigo', '04141100085', 127, 'Oxford'),
	('KFC', 50, default, 5,'Pollo', 100, 'sam', null, 'Pollo', '04141100085', 127, 'Oxford'),
	('Macdonald', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 78, 'Sydney'),
	('Wendy', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Cuadra contigo', '04141100085', 78, 'Sydney'),
	('KFC', 50, default, 5,'Pollo', 100, 'sam', null, 'Pollo', '04141100085', 78, 'Sydney'),
	('Macdonald', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Hamburguesas', '04141100085', 29, 'Caracas'),
	('Wendy', 50, default, 5,'Hamburguesas', 100, 'sam', null, 'Cuadra contigo', '04141100085', 29, 'Caracas'),
	('KFC', 50, default, 5,'Pollo', 100, 'sam', null, 'Pollo', '04141100085', 29, 'Caracas'),
	('Avila Burguer', 50, default, 5,'Hamburguesa', 100, 'sam', null, 'Hamburguesa', '04141100085', 29, 'Caracas');

--------------Grupo 8 ---------------------------------------------
INSERT INTO Ship(shi_id, shi_name, shi_capacity ,shi_loadingcap, shi_model,shi_line, shi_picture ) VALUES (default, 'concordia', 100, 1000, 'Modelo1','Linea1', '1.jpg' );
INSERT INTO Ship(shi_id, shi_name, shi_capacity ,shi_loadingcap, shi_model,shi_line, shi_picture ) VALUES (default, 'Lmao', 500, 2000, 'Modelo2','Linea2', '3.jpg' );
Insert Into Cruise(cru_id,cru_shi_fk,cru_departuredate,cru_arrivaldate,cru_price,cru_loc_arrival,cru_loc_departure) values (default,2,'2019/2/11','2019/2/12',2000,1,2);

-------------Grupo 9 ------------------------------------
INSERT INTO CLAIM (cla_title,cla_descr,cla_status)values('Mi primer reclamo','perdi mi maleta negra, nunca aparecio cuando llegue a mi destino','ABIERTO');
INSERT INTO CLAIM (cla_title,cla_descr,cla_status)values('equipaje de mano','deje en el asiento de el avion mi equipaje de mano es color rojo con puntos negros','ABIERTO');
INSERT INTO CLAIM (cla_title,cla_descr,cla_status)values('equipaje dejado en la sala de espera ','Hola, deje mi equipaje en la sala de espera del aeropuerto intermacional de maiquetia, era un bolso pequeno aproximadamente de 30 cm','ABIERTO');
INSERT INTO CLAIM (cla_title,cla_descr,cla_status)values('mi vuelo se retraso','Buenas noches, mi vuelo se retraso pero el personal me comenta que mi equipaje lo mandaron a otro avion pero no saben en cual. Les agradezco pronta respuesta','ABIERTO');

INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ) VALUES('EXTRAVIADO','maleta negra para mi prueba unitaria');
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ) VALUES('EXTRAVIADO','maleta negra');
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ,BAG_CLA_FK) VALUES('EXTRAVIADO','maleta roja con puntos negros',2);
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ,BAG_CLA_FK) VALUES('EXTRAVIADO','maleta pequeña aproximadamente 20 kg color negra',3);
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ,BAG_CLA_FK) VALUES('EXTRAVIADO','maleta azul tamaño medio',4);
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ,BAG_CLA_FK) VALUES('EXTRAVIADO','maleta vinotinto con logo de la FVF',4);
INSERT INTO BAGGAGE (BAG_STATUS,BAG_DESCR ,BAG_CLA_FK) VALUES('EXTRAVIADO','maleta rosada con dibujos de niña',1);


------- grupo 10 ----------
-- Cliente Generico --
INSERT INTO Travel(tra_name, tra_descr, tra_use_fk, tra_ini, tra_end)
VALUES ('Surf Trip', 'Surf trip arroud Vnzla', 5, '2019-06-10', '2019-07-10');
INSERT INTO Travel(tra_name, tra_descr, tra_use_fk, tra_ini, tra_end)
VALUES ('Family', 'Sushi Vacation', 5, '2019-08-10', '2019-09-10');
-- Cliente Larry Page -- 
INSERT INTO Travel(tra_name, tra_descr, tra_use_fk, tra_ini, tra_end)
VALUES ('Business Trip', 'About businnes, I am busy', 6, '2019-10-10', '2019-11-10');
-- Cliente Bob Marley -- 

-- Surf Trip --
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (1,37); -- La Guaira
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (1,65); -- Puerto Cabello
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (1,76); -- Carupano
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (1,56); -- Puerto La Cruz
-- Sushi Vacation -- 
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (2,143); -- Tokyo
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (2,158); -- Osaka
-- Bussines Trip --
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (3,127); -- Oxford
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (3,78); -- Sydney
INSERT INTO TRA_LOC (tl_tra_fk, tl_loc_fk) VALUES (3,29); -- Caracas

------- grupo 11 ----------


------- grupo 12 ----------


------- grupo 13 ----------
	
INSERT INTO res_roo(rr_checkindate, rr_checkoutdate, rr_timestamp, rr_use_fk, rr_hot_fk)
VALUES	('2019-06-12', '2019-06-13', '2019-06-11', 5, 4),
	('2019-06-14', '2019-06-15', '2019-06-13', 5, 5),
	('2019-06-17', '2019-06-18', '2019-06-16', 5, 12),
	('2019-06-25', '2019-06-26', '2019-06-24', 5, 15),
	('2019-07-2', '2019-07-8', '2019-07-1', 5, 17),
	('2019-08-12', '2019-08-13', '2019-08-11', 5, 18),
	('2019-09-19', '2019-09-21', '2019-09-18', 6, 22),
	('2019-09-23', '2019-09-22', '2019-09-21', 6, 25),
	('2019-09-5', '2019-09-7', '2019-09-3', 6, 27);

------- grupo 14 ----------

INSERT INTO res_rest(rr_date, rr_num_ppl, rr_timestamp, rr_use_fk, rr_res_fk)
VALUES	('2019-06-12', 3, '2019-06-11', 5, 1), 
		('2019-06-14', 3, '2019-06-13', 5, 2), 
		('2019-06-17', 3, '2019-06-16', 5, 6), 
		('2019-06-22', 3, '2019-06-21', 5, 11),
		('2019-06-29', 3, '2019-06-28', 5, 15),
		('2019-08-14', 3, '2019-08-13', 5, 16),
		('2019-08-22', 3, '2019-08-21', 5, 20),
		('2019-09-14', 3, '2019-09-13', 6, 25),
		('2019-09-29', 3, '2019-09-28', 6, 27),
		('2019-10-2', 3, '2019-10-1', 6, 33);



-- -----------------------------------------------------------------------------------------------------------

INSERT INTO tra_res (tr_travel_fk, tr_res_roo_fk, tr_res_fli_fk, tr_res_rest_fk, tr_res_aut_fk, tr_res_cru_fk, tr_type)
VALUES	(1, 1, null, null, null, null, 'HOTEL'), -- La Guaira
	(1, 3, null, null, null, null, 'HOTEL'), -- Puerto Cabello
	(1, 4, null, null, null, null, 'HOTEL'), -- Carupano
	(1, 5, null, null, null, null, 'HOTEL'), -- Puerto La Cruz
	(2, 6, null, null, null, null, 'HOTEL'), -- Tokyo
	(3, 7, null, null, null, null, 'HOTEL'), -- Caracas
	(3, 8, null, null, null, null, 'HOTEL'), -- Oxford
	(3, 9, null, null, null, null, 'HOTEL'), -- Sydney
	
	(1, null, null, 1, null, null, 'RESTAURANT'), -- La Guaira
	(1, null, null, 2, null, null, 'RESTAURANT'), -- La Guaira
	(1, null, null, 3, null, null, 'RESTAURANT'), -- Puerto Cabello
	(1, null, null, 4, null, null, 'RESTAURANT'), -- Carupano
	(1, null, null, 5, null, null, 'RESTAURANT'), -- Puerto La Cruz
	(2, null, null, 6, null, null, 'RESTAURANT'), -- Tokyo
	(2, null, null, 7, null, null, 'RESTAURANT'), -- Osaka
	(3, null, null, 8, null, null, 'RESTAURANT'), -- Oxford	
	(3, null, null, 9, null, null, 'RESTAURANT'), -- Sydney
	(3, null, null, 10, null, null, 'RESTAURANT'); -- Caracas

Insert Into Cruise(cru_id,cru_shi_fk,cru_departuredate,cru_arrivaldate,cru_price,cru_loc_arrival,cru_loc_departure) values (default,2,'2019/2/11','2019/2/12',2000,1,2);

