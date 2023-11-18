/* Base de Datos - Tombat */

/* Jugadores */
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Alex",20,"correo1@gmail.com","Bulbasaur","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Josh",20,"correo2@gmail.com","Pikachu","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Gabriel",20,"correo3@gmail.com","Squirtle","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Hineill",19,"correo4@gmail.com","Psyduck","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Santiago",20,"correo5@gmail.com","Nidoking","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Jampi",20,"correo6@gmail.com","Charmander","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Mayte",19,"correo7@gmail.com","Jigglypuff","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Alvaro",29,"correo8@gmail.com","Eevee","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Stuardo",32,"correo9@gmail.com","Snorlax","olA23$",0,0,"En paz",0);
insert into jugador(nombre,edad,correo,usuario,contrasena,horasDelDia,diasDesdeCreacion,estado,alimentoTotal) values("Minaya",28,"correo10@gmail.com","Dragonite","olA23$",0,0,"En paz",0);

update jugador set contrasena = sha2(contrasena,256) where idJugador>0;