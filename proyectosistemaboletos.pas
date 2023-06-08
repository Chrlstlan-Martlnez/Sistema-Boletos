program Metro_Caracas;

uses
	crt; //Se importa crt para el uso de clear screen.

var 
	//v Variables Texto v 
	Nombre, Apellido, Cedula, SubEstacionS, SubEstacionD, ConfirCedula, ConfirContra,     //Variables tipo string que ingresará el usuario.
	NombreBoleto, NroBoletoUsuario, Transporte : string;			                           //Variables tipo string que define el programa para mostrarselas al usuario.
	
	MostrarSubestaciones : AnsiString;                                                   //Variable donde se va concatenando las subestaciones elegidas para luego mostrarlas. AnsiString porque permite mas texto.
	
	//v Variables Numeros v
	OpcionUsuario,                                                                        //Eleccion del usuario en la mayoria de menus, dependiendo de la opcion elegida, lo llevará a una u otra parte del programa.
	nBoletos, nBoletosTotal, i, TipoBoleto, nViajesBoleto,                               //Numero de boletos que posee el usuario, boletos comprados por el usuario, iterador para el numero de bolteos, tipo de boleto que comprara el usuario, y numero de viajes del boleto.
	nBoletosSistema, nBoletosUsados,                                                     //Contador para el total de boletos comprados y usados.
	nPagLinea, nPagDatos,                                                                //Sirven para saber cual de las tablas debe mostrar.
	
	ElegirLinea, SalirSistema, CierreSistema, ValidarCedula, ValidarContra, MostrarDatos, //Toman valor de 1 o 0, para determinar si se ejecutan ciertas partes del codigo.
	
	n1, n2a, n2b, n3, n4a, n4b, n5, n6a, n6b, n7, n8a, n8b, n9a, n9b, n9c, n10a, n10b, n10c, //Contadores para saber la cantidad de cada boleto por usuario.
	nLinea1, nLinea2, nLinea3, nLinea4, nLinea5, nLinea6, nLinea7, nLineaMC,                //Contadores para saber la cantidad de usos de cada linea.
	
	ProPa, LDC, LBand, BelloC, PerezB, LCorti, CUniv, Chavez, PlazaS, LaCali, LSimbo, MtCristo, GatoN, Petare, LJardi,    //Contadores para cada una 
	Boleita, AguaS, PaloV, Valle, EMarquez, CAmari, Silencio, Mercado, Wara, Capito, Capuchi, Coche, LFlores, Hoyada,     //de las subestaciones.
	Materni, LRinco, Panteon, PqCara, ZRental, Socorro, BArtes, LPaz, PqCent, PresiM, ColeIng, LYaragua, NCirco, ECristo, //Que seran mostrados 
	PlazaV, Carapita, Teatros, RocaT, SabanaG, Antimano, INCES, Chacaito, Mamera, Artigas, Roose, Chacao, Caricuao,       //en la opcion Ver Sistema.
	BelloM, Ilustres, Altamira, Zoo, Mercedes, Petare2, Miranda, RP_LA, PqSimonB, Abril19, Julio5, Julio24 : integer;
	
	MontoTotal, Pago, DiferenciaPago : real;                    //Variables usadas para el dinero.

const
	ContrasenaSistema = 'metro123';              //Contraseña de acceso al sistema del metro.

begin
	CierreSistema:= 0;                          //Usada para que el programa se mantenga activo hasta que sea cerrado usando la contraseña.
	nBoletosSistema:= 0; nBoletosUsados:= 0;                                                                 //Contadores totales que seran 
	nLinea1:= 0; nLinea2:= 0; nLinea3:= 0; nLinea4:= 0; nLinea5:= 0; nLinea6:= 0; nLinea7:= 0; nLineaMC:= 0; //mostrados en Ver Sistema.
	
	ProPa:=0; LDC:=0; LBand:=0; BelloC:=0; PerezB:=0; LCorti:=0; CUniv:=0; Chavez:=0; PlazaS:=0; LaCali:=0; LSimbo:=0;   //Contadores totales de
	MtCristo:=0; GatoN:=0; Petare:=0; LJardi:=0; Boleita:=0; AguaS:=0; PaloV:=0; Valle:=0; EMarquez:=0; CAmari:=0;       //usos de cada subestacion,
	Silencio:=0; Mercado:=0; Wara:=0; Capito:=0; Capuchi:=0; Coche:=0; LFlores:=0; Hoyada:=0; Materni:=0; LRinco:=0;     //se le asigna 0 al inicio
	Panteon:=0; PqCara:=0; ZRental:=0; Socorro:=0; BArtes:=0; LPaz:=0; PqCent:=0; PresiM:=0; ColeIng:=0; LYaragua:=0;    //del programa y fuera del
	NCirco:=0; ECristo:=0; PlazaV:=0; Carapita:=0; Teatros:=0; RocaT:=0; SabanaG:=0; Antimano:=0; INCES:=0; Chacaito:=0; //bucle principal para
	Mamera:=0; Artigas:=0; Roose:=0; Chacao:=0; Caricuao:=0; BelloM:=0; Ilustres:=0; Altamira:=0; Zoo:=0; Mercedes:=0;   //que no se reinicien
	Petare2:=0; Miranda:=0; RP_LA:=0; PqSimonB:=0; Abril19:=0; Julio5:=0; Julio24:=0;                                    //y se puedan ver en Ver Sistema.

	while CierreSistema= 0 do //Condicion que siempre será verdadera, la unica forma de cerrar el sistema es ingresando la contraseña.
		begin
			n1:= 0; n2a:= 0; n2b:= 0; n3:= 0; n4a:= 0; n4b:= 0; n5:= 0; n6a:= 0; n6b:= 0; n7:= 0; //Asignacion de 0 a la cantidad de boletos que tiene
			n8a:= 0; n8b:= 0; n9a:= 0; n9b:= 0; n9c:= 0; n10a:= 0; n10b:= 0; n10c:= 0;            //nViajesBoleto:= 0; //el usuario, aumentara a medida que elija boletos.
			
			clrscr;
			writeln('Bienvenido a la estacion del metro de Caracas.');
			writeln('Para comprar boletos ingrese 1.');
			writeln('Para ver el sistema ingrese 2.');
			writeln('Para cerrar el sistema ingrese 3.');
			writeln('(Tanto para ver el Sistema como para cerrarlo, se necesita una contrasena de acceso)');
			readln(OpcionUsuario);
			
			if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2) and (OpcionUsuario <> 3)) then                       //Revision de que la opcion 
				repeat                                                                                             //ingresada por el usuario
					writeln('Ingrese una opcion valida. Compra de Boletos=1 Ver Sistema=2 Cerrar Sistema=3');       //es una opcion valida. 
					writeln('(Tanto para ver el Sistema como para cerrarlo, se necesita una contrasena de acceso)'); //Se utiliza en todo el programa.
					write('Ingrese alguna opcion.'); readln(OpcionUsuario);
				until ((OpcionUsuario = 1) or (OpcionUsuario = 2) or (OpcionUsuario = 3));
			
				
			if OpcionUsuario = 1 then          //Se inicia el sistema de compra de boletos.
				begin
					clrscr;
					writeln('Ingrese los siguientes datos:');
					write('Nombre: '); readln(Nombre);
					write('Apellido: '); readln(Apellido);
					write('Cedula: '); readln(Cedula);
					write('Cantidad de Boletos: '); readln(nBoletos);
						
					for i:=1 to nBoletos do                     //Itera segun el numero de boletos ingresado.
						begin
							clrscr;
							writeln('Estos son los tipos de boletos que hay, elija los que desee.');
							writeln('');
							writeln('---------------------------------------------------------------------');
							writeln('|         BOLETOS          |  COLOR  |       COBERTURA       |PRECIO|');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(1)Simple                 |Amarillo |1 viaje en metro       |  1   |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(2)Integrado              |Amarillo |1 viaje en metro       | 1.5  |');
							writeln('|                          |         |1 viaje en bus         |      |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(3)Ida y Vuelta           |Amarillo |2 viajes en metro      |  2   |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(4)Ida y Vuelta Integrado |Amarillo |2 viajes en metro      |  3   |');
							writeln('|                          |         |2 viajes en bus        |      |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(5)Multiabono             |Naranja  |10 viajes en metro     |  10  |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(6)Multiabono Integrado   |Naranja  |10 viajes en metro     |  15  |');
							writeln('|                          |         |10 viajes en bus       |      |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(7)Estudiantil            |Azul     |10 viajes en metro     | 7.5  |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(8)Estudiantil Integrado  |Azul     |10 viajes en metro     |  15  |');
							writeln('|                          |         |20 viajes en bus       |      |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(9)MetroTarjeta           |Rojo     |20 viajes              |  30  |');
							writeln('|                          |         |30 viajes              |      |');
							writeln('|                          |         |40 viajes              |      |');
							writeln('|--------------------------|---------|-----------------------|------|');
							writeln('|(10)MetroTarjeta Integrada|Rojo     |20 viajes(Metro y Bus) |  50  |');
							writeln('|                          |         |30 viajes(Metro y Bus) |      |');
							writeln('|                          |         |40 viajes(Metro y Bus) |      |');
							writeln('---------------------------------------------------------------------');
									
							write('Ingrese el numero correspondiente al tipo de boleto que desea comprar: '); readln(TipoBoleto);
								
							if ((TipoBoleto <> 1) and (TipoBoleto <> 2) and (TipoBoleto <> 3) and (TipoBoleto <> 4) and (TipoBoleto <> 5) 			 //Verificar si la
							and (TipoBoleto <> 6) and (TipoBoleto <> 7) and (TipoBoleto <> 8) and (TipoBoleto <> 9) and (TipoBoleto <> 10)) then //opcion es valida
								repeat
									write('Ingrese una opcion de boleto valida (1-2-3-4-5-6-7-8-9-10).'); readln(TipoBoleto);
								until ((TipoBoleto = 1) or (TipoBoleto = 2) or (TipoBoleto = 3) or (TipoBoleto = 4) or (TipoBoleto = 5) 
								or (TipoBoleto = 6) or (TipoBoleto = 7) or (TipoBoleto = 8) or (TipoBoleto = 9) or (TipoBoleto = 10));		
							
							if (TipoBoleto = 1) or (TipoBoleto = 3) or (TipoBoleto = 5) or (TipoBoleto = 7) then //Si el boleto no tiene parametros que definir.
								begin
									case TipoBoleto of
										1: begin
												NombreBoleto := 'Simple';
												n1 := n1 + 1;
												nViajesBoleto := 1;
											end;
										3: begin
												NombreBoleto := 'Ida y Vuelta';
												n3 := n3 + 1;
												nViajesBoleto := 2;
											end;
										5: begin
												NombreBoleto := 'Multiabono';
												n5 := n5 + 1;
												nViajesBoleto := 10;
											end;
										7: begin
												NombreBoleto := 'Estudiantil';
												n7 := n7 + 1;
												nViajesBoleto := 10;
											end;
										end;
											
									writeln('Tu boleto numero ', i ,' es: ', NombreBoleto, ', con una cantidad de viajes de ', nViajesBoleto, ' en Metro.');
								end
							
							else                //Si el boleto tiene algun parametro que deba ser definido.
								begin
									if (TipoBoleto = 2) or (TipoBoleto = 4) or (TipoBoleto = 6) or (TipoBoleto = 8) then      //Si se debe elegir Metro o Bus.
										begin
											write('El boleto que ha seleccionado tiene cobertura tanto para metro como bus, por favor ingrese el tipo de viaje que desea (Metro: 1, Bus: 2): '); readln(OpcionUsuario);
												
											if (OpcionUsuario <> 1) and (OpcionUsuario <> 2) then
												repeat
													write('Opcion invalida, ingrese 1 para viaje en metro, o ingrese 2 para viaje en bus: '); readln(OpcionUsuario);
												until (OpcionUsuario = 1) or (OpcionUsuario = 2);
												
											case TipoBoleto of
												2: begin
														NombreBoleto := 'Integrado';
														if OpcionUsuario = 1 then n2a := n2a + 1
														else n2b := n2b +1;
														nViajesBoleto := 1;
													end;
												4: begin
														NombreBoleto := 'Ida y Vuelta Integrado';
														if OpcionUsuario = 1 then n4a := n4a + 1
														else n4b := n4b +1;
														nViajesBoleto := 2;
													end;
												6: begin
														NombreBoleto := 'Multiabono Integrado';
														if OpcionUsuario = 1 then n6a := n6a + 1
														else n6b := n6b +1;
														nViajesBoleto := 10;
													end;
												8: begin
														NombreBoleto := 'Estudiantil Integrado';
														if OpcionUsuario = 1 then n8a := n8a + 1
														else n8b := n8b +1;
														if OpcionUsuario = 1 then nViajesBoleto := 10
														else nViajesBoleto := 20;
													end;
												end;
												
											case OpcionUsuario of
												1: Transporte:= 'Metro';
												2: Transporte:= 'Bus';
												end;
													
											writeln('Tu boleto numero ', i ,' es: ', NombreBoleto, ', con una cantidad de viajes de ', nViajesBoleto, ' en ', Transporte, '.');
										end
									else          //Si se debe elegir numero de viajes.
										begin
											write('El boleto que ha seleccionado permite 20, 30 y 40 viajes, por favor ingrese la cantidad de viajes que quiere para su boleto: '); readln(OpcionUsuario);
											if (OpcionUsuario <> 20) and (OpcionUsuario <> 30) and (OpcionUsuario <> 40) then
												repeat
													write('Opcion invalida, ingrese una cantidad valida de viajes, ya sea 20, 30 o 40: '); readln(OpcionUsuario);
												until (OpcionUsuario = 20) or (OpcionUsuario = 30) or (OpcionUsuario = 40);
											
											case TipoBoleto of
												9:begin
														NombreBoleto := 'MetroTarjeta';
														if OpcionUsuario = 20 then n9a := n9a + 1
														else if OpcionUsuario = 30 then n9b := n9b + 1
														else n9c := n9c +1;
														nViajesBoleto := OpcionUsuario;
														Transporte := 'Metro';
													end;
												10:begin
														NombreBoleto := 'MetroTarjeta Integrado';
														if OpcionUsuario = 20 then n10a := n10a + 1
														else if OpcionUsuario = 30 then n10b := n10b + 1
														else n10c := n10c +1;
														nViajesBoleto := OpcionUsuario;
														Transporte := 'Metro y Bus';
													end;
												end;	
											writeln('Tu boleto numero ', i ,' es: ', NombreBoleto, ', con una cantidad de viajes de ', nViajesBoleto, ' en ', Transporte, '.');
										end;
								end;
							write('Presiona Enter para continuar'); readln();
						end;

					//v Calculo del Monto a pagar, cantidad de boletos del usuario, y se añaden estos ultimos al total de boletos comprados v	
					MontoTotal := ((n1*1) + ((n2a+n2b)*1.5) + (n3*2) + ((n4a+n4b)*3) + (n5*10) + ((n6a+n6b)*15) + (n7*7.5) + ((n8a+n8b)*15) + ((n9a+n9b+n9c)*30) + ((n10a+n10b+n10c)*50));
					nBoletosTotal := (n1 + n2a + n2b + n3 + n4a + n4b + n5 + n6a + n6b + n7 + n8a + n8b + n9a + n9b + n9c + n10a + n10b + n10c);
					nBoletosSistema := nBoletosSistema + nBoletosTotal;
						
					clrscr;
					writeln('Aqui puede visualizar los boletos que posee en este momento y sus caracteristicas:');
					writeln('');
					writeln('------------------------------------------------------------------------------');
					writeln('|         BOLETOS          |  COLOR  |       COBERTURA       |PRECIO|CANTIDAD|');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(1)Simple                 |Amarillo |1 viaje en metro       |  1   |   ',n1,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(2)Integrado              |Amarillo |1 viaje en metro       | 1.5  |   ',n2a,'    |');
					writeln('|                          |         |1 viaje en bus         |      |   ',n2b,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(3)Ida y Vuelta           |Amarillo |2 viajes en metro      |  2   |   ',n3,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(4)Ida y Vuelta Integrado |Amarillo |2 viajes en metro      |  3   |   ',n4a,'    |');
					writeln('|                          |         |2 viajes en bus        |      |   ',n4b,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(5)Multiabono             |Naranja  |10 viajes en metro     |  10  |   ',n5,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(6)Multiabono Integrado   |Naranja  |10 viajes en metro     |  15  |   ',n6a,'    |');
					writeln('|                          |         |10 viajes en bus       |      |   ',n6b,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(7)Estudiantil            |Azul     |10 viajes en metro     | 7.5  |   ',n7,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(8)Estudiantil Integrado  |Azul     |10 viajes en metro     |  15  |   ',n8a,'    |');
					writeln('|                          |         |20 viajes en bus       |      |   ',n8b,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(9)MetroTarjeta           |Rojo     |20 viajes              |  30  |   ',n9a,'    |');
					writeln('|                          |         |30 viajes              |      |   ',n9b,'    |');
					writeln('|                          |         |40 viajes              |      |   ',n9c,'    |');
					writeln('|--------------------------|---------|-----------------------|------|--------|');
					writeln('|(10)MetroTarjeta Integrada|Rojo     |20 viajes(Metro y Bus) |  50  |   ',n10a,'    |');
					writeln('|                          |         |30 viajes(Metro y Bus) |      |   ',n10b,'    |');
					writeln('|                          |         |40 viajes(Metro y Bus) |      |   ',n10c,'    |');
					writeln('------------------------------------------------------------------------------');
					writeln('                                                     | Total | ', MontoTotal:0:1, ' |   ', nBoletosTotal, '    |');
					writeln('                                                     -------------------------');
						
					write('Presiona Enter para continuar'); readln();
						
					clrscr;
					writeln('Ahora que ya ha seleccionado sus boletos, debe seleccionar la linea en la cual desea viajar.');
					writeln('Dentro de cada linea debe elegir una subestacion de salida y una subestacion de destino.');
					writeln('Este proceso lo debe realizar para cada uno de sus boletos, piense bien cuales seran sus viajes.');
					write('Presiona Enter para continuar'); readln();
						
					clrscr;
					writeln('A continuacion se le iran mostrando las lineas en las que puede viajar junto con sus subestaciones una por una.');
					writeln('Elija la linea en la que desea viajar, y luego elija las subestaciones de salida y destino.');
					write('Presiona Enter para continuar'); readln();

					MostrarSubestaciones := 'Sus subestaciones elegidas :'; //Variable a la que se le irán añadiendo las subestaciones elegidas en cada ciclo, para luego mostrarlas.
						
					for i:=1 to nBoletos do                      //Por cada boleto debe elegir una ruta
						begin
							str(i, NroBoletoUsuario); //Para poder concatenar el numero del boleto con las subestaciones de este, se convierte el valor actual del iterador a una variable string, con el metodo str.
								
							ElegirLinea := 0;  //Mientras esté en 0, el usuario estará en el menú de las lineas.
							nPagLinea := 1;    //Numero de la pagina en la que se encuentra el usuario. Comienza en la 1 y cambiará si el usuario lo desea.
								
							while ElegirLinea = 0 do    //Solo se saldrá del ciclo cuando el usuario elija las 2 subestaciones para su boleto.
								begin
									if nPagLinea = 1 then
										begin
											clrscr;
											writeln('-------------                                                         ');
											writeln('|  LINEA 1  |                                                         ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Propatria     |-Capitolio       |-Sabana Grande   |-Los Cortijos   |');
											writeln('|-Perez Bonalde |-La Hoyada       |-Chacaito        |-La California  |');
											writeln('|-Plaza Sucre   |-Parque Carabobo |-Chacao          |-Petare         |');
											writeln('|-Gato Negro    |-Bellas Artes    |-Altamira        |-Palo Verde     |');
											writeln('|-Agua Salud    |-Colegio de ing  |-Miranda         |                |');
											writeln('|-Cano Amarillo |-Plaza Venezuela |-Los Dos Caminos |                |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 1, debe ingresar ambas SubEstaciones');
														repeat //Se verifica que las subestaciones ingresadas sean correctas
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Propatria') or (SubEstacionS = 'Perez Bonalde') or (SubEstacionS = 'Plaza Sucre') or (SubEstacionS = 'Gato Negro') 
														or (SubEstacionS = 'Agua Salud') or (SubEstacionS = 'Cano Amarillo') or (SubEstacionS = 'Capitolio') or (SubEstacionS = 'La Hoyada') 
														or (SubEstacionS = 'Parque Carabobo') or (SubEstacionS = 'Bellas Artes') or (SubEstacionS = 'Colegio de ing') or (SubEstacionS = 'Plaza Venezuela') 
														or (SubEstacionS = 'Sabana Grande') or (SubEstacionS = 'Chacaito') or (SubEstacionS = 'Chacao') or (SubEstacionS = 'Altamira') 
														or (SubEstacionS = 'Miranda') or (SubEstacionS = 'Los Dos Caminos') or (SubEstacionS = 'Los Cortijos') or (SubEstacionS = 'La California') 
														or (SubEstacionS = 'Petare') or (SubEstacionS = 'Palo Verde')) 
														and ((SubEstacionD = 'Propatria') or (SubEstacionD = 'Perez Bonalde') or (SubEstacionD = 'Plaza Sucre') or (SubEstacionD = 'Gato Negro') 
														or (SubEstacionD = 'Agua Salud') or (SubEstacionD = 'Cano Amarillo') or (SubEstacionD = 'Capitolio') or (SubEstacionD = 'La Hoyada') 
														or (SubEstacionD = 'Parque Carabobo') or (SubEstacionD = 'Bellas Artes') or (SubEstacionD = 'Colegio de ing') or (SubEstacionD = 'Plaza Venezuela') 
														or (SubEstacionD = 'Sabana Grande') or (SubEstacionD = 'Chacaito') or (SubEstacionD = 'Chacao') or (SubEstacionD = 'Altamira') 
														or (SubEstacionD = 'Miranda') or (SubEstacionD = 'Los Dos Caminos') or (SubEstacionD = 'Los Cortijos') or (SubEstacionD = 'La California') 
														or (SubEstacionD = 'Petare') or (SubEstacionD = 'Palo Verde')));
						
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														                                             //^^^^^Se utiliza para marcar una nueva linea en el string.
														nLinea1:= nLinea1 + 1; //Si se llega a elegir esta linea, luego de elegir las subestaciones, se suma 1 al contador de esta linea, así para todas.
															
														ElegirLinea := 1;              //Al cambiar a 1, ahora se saldría del bucle para comenzar desde el principio (Si es que le quedan boletos).
															
														write('Presiona Enter para continuar'); readln();
													end;
												2: nPagLinea := nPagLinea + 1; //Se aumenta la variable para que pase de pagina.
												end;
										end;
									if nPagLinea = 2 then //Si el usuario decide avanzar de pagina, la variable aumenta y se ejecuta esta parte, así con cada linea
										begin
											clrscr;
											writeln('             -------------                                            ');
											writeln('             |  LINEA 2  |                                            ');
											writeln('----------------------------------------------------------------------');
											writeln('|-El Silencio  |-Artigas      |-Carapita  |-Caricuao                 |');
											writeln('|-Capuchinos   |-La Paz       |-Antimano  |-Zoologico                |');
											writeln('|-Maternidad   |-La Yaragua   |-Mamera    |-Ruiz Pineda/Las Adjuntas |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 2, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'El Silencio') or (SubEstacionS = 'Capuchinos') or (SubEstacionS = 'Maternidad') or (SubEstacionS = 'Artigas') 
														or (SubEstacionS = 'La Paz') or (SubEstacionS = 'La Yaragua') or (SubEstacionS = 'Carapita') or (SubEstacionS = 'Antimano') 
														or (SubEstacionS = 'Mamera') or (SubEstacionS = 'Caricuao') or (SubEstacionS = 'Zoologico') or (SubEstacionS = 'Ruiz Pineda/Las Adjuntas')) 
														and ((SubEstacionD = 'El Silencio') or (SubEstacionD = 'Capuchinos') or (SubEstacionD = 'Maternidad') or (SubEstacionD = 'Artigas') 
														or (SubEstacionD = 'La Paz') or (SubEstacionD = 'La Yaragua') or (SubEstacionD = 'Carapita') or (SubEstacionD = 'Antimano') 
														or (SubEstacionD = 'Mamera') or (SubEstacionD = 'Caricuao') or (SubEstacionD = 'Zoologico') or (SubEstacionD = 'Ruiz Pineda/Las Adjuntas')));
									
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
															
														nLinea2:= nLinea2 + 1;
													
														ElegirLinea := 1;
															
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1; //A partir de la segunda linea se añade la opcion de retroceder.
												2: nPagLinea := nPagLinea + 1;
												end;
										end;
									if nPagLinea = 3 then
										begin
											clrscr;
											writeln('                            -------------                             ');
											writeln('                            |  LINEA 3  |                             ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Plaza Venezuela      |-La Bandera     |-Los Jardines |-Mercado     |');
											writeln('|-Ciudad Universitaria |-El Valle       |-Coche        |-La Rinconada|');
											writeln('|-Los Simbolos         |                |              |             |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
												
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 3, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Plaza Venezuela') or (SubEstacionS = 'Ciudad Universitaria') or (SubEstacionS = 'Los Simbolos') or (SubEstacionS = 'La Bandera') 
														or (SubEstacionS = 'El Valle') or (SubEstacionS = 'Los Jardines') or (SubEstacionS = 'Coche') or (SubEstacionS = 'Mercado') 
														or (SubEstacionS = 'La Rinconada')) 
														and ((SubEstacionD = 'Plaza Venezuela') or (SubEstacionD = 'Ciudad Universitaria') or (SubEstacionD = 'Los Simbolos') or (SubEstacionD = 'La Bandera') 
														or (SubEstacionD = 'El Valle') or (SubEstacionD = 'Los Jardines') or (SubEstacionD = 'Coche') or (SubEstacionD = 'Mercado') 
														or (SubEstacionD = 'La Rinconada')));
								
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLinea3:= nLinea3 + 1;
														
														ElegirLinea := 1;
															
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1;
												2: nPagLinea := nPagLinea + 1;
												end;
										end;
									if nPagLinea = 4 then
										begin
											clrscr;
											writeln('                                            -------------             ');
											writeln('                                            |  LINEA 4  |             ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Zona Rental    |-Capuchinos |-La Paz     |-Antimano                |');
											writeln('|-Parque Central |-Maternidad |-La Yaragua |-Mamera                  |');
											writeln('|-Nuevo Circo    |-Artigas    |-Carapita   |-Ruiz Pineda/Las Adjuntas|');
											writeln('|-Teatros        |            |            |                         |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 4, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Zona Rental') or (SubEstacionS = 'Parque Central') or (SubEstacionS = 'Nuevo Circo') or (SubEstacionS = 'Teatros') 
														or (SubEstacionS = 'Capuchinos') or (SubEstacionS = 'Maternidad') or (SubEstacionS = 'Artigas') or (SubEstacionS = 'La Paz') 
														or (SubEstacionS = 'La Yaragua') or (SubEstacionS = 'Carapita') or (SubEstacionS = 'Antimano') or (SubEstacionS = 'Mamera') 
														or (SubEstacionS = 'Ruiz Pineda/Las Adjuntas')) 
														and ((SubEstacionS = 'Zona Rental') or (SubEstacionS = 'Parque Central') or (SubEstacionS = 'Nuevo Circo') or (SubEstacionS = 'Teatros') 
														or (SubEstacionS = 'Capuchinos') or (SubEstacionS = 'Maternidad') or (SubEstacionS = 'Artigas') or (SubEstacionS = 'La Paz') 
														or (SubEstacionS = 'La Yaragua') or (SubEstacionS = 'Carapita') or (SubEstacionS = 'Antimano') or (SubEstacionS = 'Mamera') 
														or (SubEstacionS = 'Ruiz Pineda/Las Adjuntas')));
						
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLinea4:= nLinea4 + 1;
														
														ElegirLinea := 1;
															
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1;
												2: nPagLinea := nPagLinea + 1;
												end;
										end;
									if nPagLinea = 5 then
										begin
											clrscr;
											writeln('                                                         -------------');
											writeln('                                                         |  LINEA 5  |');
											writeln('----------------------------------------------------------------------');
											writeln('|-Bello Monte          |-Bello Campo   |-Montecristo |-El Marquez    |');
											writeln('|-Las Mercedes         |-Hugo Chavez   |-Boleita     |-Warairarepano |');
											writeln('|-Parque Simon Bolivar |               |             |               |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 5, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Bello Monte') or (SubEstacionS = 'Las Mercedes') or (SubEstacionS = 'Parque Simon Bolivar') or (SubEstacionS = 'Bello Campo') 
														or (SubEstacionS = 'Hugo Chavez') or (SubEstacionS = 'Montecristo') or (SubEstacionS = 'Boleita') or (SubEstacionS = 'El Marquez') 
														or (SubEstacionS = 'Warairarepano')) 
														and ((SubEstacionD = 'Bello Monte') or (SubEstacionD = 'Las Mercedes') or (SubEstacionD = 'Parque Simon Bolivar') or (SubEstacionD = 'Bello Campo') 
														or (SubEstacionD = 'Hugo Chavez') or (SubEstacionD = 'Montecristo') or (SubEstacionD = 'Boleita') or (SubEstacionD = 'El Marquez') 
														or (SubEstacionD = 'Warairarepano')) );
								
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLinea5:= nLinea5 + 1;
														
														ElegirLinea := 1;
														
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1;
												2: nPagLinea := nPagLinea + 1;
												end;
										end;
									if nPagLinea = 6 then
										begin
											clrscr;
											writeln('                                       -------------                  ');
											writeln('                                       |  LINEA 6  |                  ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Zoologico                       |-La Rinconada                     |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 6, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Zoologico') or (SubEstacionS = 'La Rinconada')) 
														and ((SubEstacionD = 'Zoologico') or (SubEstacionD = 'La Rinconada')));
													
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLinea6:= nLinea6 + 1;
													
														ElegirLinea := 1;
															
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1;
												2: nPagLinea := nPagLinea + 1;
												end;
										end;
									if nPagLinea = 7 then
										begin
											clrscr;
											writeln('                  -------------                                       ');
											writeln('                  |  LINEA 7  |                                       ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Las Flores    |-La Hoyada    |-Presidente Medina    |-La Bandera   |');
											writeln('|-Panteon       |-El Cristo    |-INCES                |-Los Ilustres |');
											writeln('|-Socorro       |-Roca Tarpeya |-Roosevelt            |              |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior, o 2 para avanzar a la siguiente linea: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea 7, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Las Flores') or (SubEstacionS = 'Panteon') or (SubEstacionS = 'Socorro') or (SubEstacionS = 'La Hoyada') 
														or (SubEstacionS = 'El Cristo') or (SubEstacionS = 'Roca Tarpeya') or (SubEstacionS = 'Presidente Medina') or (SubEstacionS = 'INCES') 
														or (SubEstacionS = 'Roosevelt') or (SubEstacionS = 'La Bandera') or (SubEstacionS = 'Los Ilustres')) 
														and ((SubEstacionD = 'Las Flores') or (SubEstacionD = 'Panteon') or (SubEstacionD = 'Socorro') or (SubEstacionD = 'La Hoyada') 
														or (SubEstacionD = 'El Cristo') or (SubEstacionD = 'Roca Tarpeya') or (SubEstacionD = 'Presidente Medina') or (SubEstacionD = 'INCES') 
														or (SubEstacionD = 'Roosevelt') or (SubEstacionD = 'La Bandera') or (SubEstacionD = 'Los Ilustres')));
								
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLinea7:= nLinea7 + 1;
													
														ElegirLinea := 1;
														
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1;
												2: nPagLinea := nPagLinea + 1;
												end;				
										end;
									if nPagLinea = 8 then
										begin
											clrscr;
											writeln('-------------                                                         ');
											writeln('| CABLETREN |                                                         ');
											writeln('----------------------------------------------------------------------');
											writeln('|-Petare 2        |-5 de Julio     |-24 de Julio     |-Warairarepano |');
											writeln('|-19 de Abril     |                |                 |               |');
											writeln('----------------------------------------------------------------------');
											writeln('Si desea utilizar su boleto ', i, ' para viajar en esta linea presione 1');
											writeln('Si por el contrario desea ver otra linea junto son sus subestaciones');
											writeln('Presione 0 para ir a la linea anterior: '); readln(OpcionUsuario);
											
											case OpcionUsuario of
												1:begin
														writeln('Para utilizar su boleto ', i, ' en la linea Cabletren, debe ingresar ambas SubEstaciones');
														repeat
															writeln('(Debe escribirlo igual a como lo ve arriba, en caso de escribirlo mal tendra otra oportunidad.)');
															write('Ingrese el nombre de la estacion de salida: '); readln(SubEstacionS);
															write('Ahora ingrese el nombre de la estacion de destino: '); readln(SubEstacionD);

														until (((SubEstacionS = 'Petare 2') or (SubEstacionS = '19 de Abril') or (SubEstacionS = '5 de Julio') or (SubEstacionS = '24 de Julio') 
														or (SubEstacionS = 'Warairarepano')) 
														and ((SubEstacionD = 'Petare 2') or (SubEstacionD = '19 de Abril') or (SubEstacionD = '5 de Julio') or (SubEstacionD = '24 de Julio') 
														or (SubEstacionD = 'Warairarepano')));
										
														MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
														
														nLineaMC:= nLineaMC + 1;
														
														ElegirLinea := 1;
															
														write('Presiona Enter para continuar'); readln();
													end;
												0: nPagLinea := nPagLinea - 1; //Como es la ultima linea, ya no se muestra la opción de avanzar a la siguiente.
												end;		
										end;
								end;
							//v Estos case verifican el nombre de las estaciones elegidas (Un case para la de salida y uno para el de destino) v
							//v             Y dependiendo de cual sea, se le aumenta 1 al contador de usos de esa estación.                    v
							case SubEstacionS of 
								'Propatria': ProPa:= ProPa + 1; 'Los Dos Caminos': LDC:= LDC + 1; 'La Bandera': LBand:= LBand + 1; 
								'Bello Campo': BelloC:= BelloC + 1; 'Perez Bonalde': PerezB:= PerezB + 1; 'Los Cortijos': LCorti:= LCorti + 1; 
								'Ciudad Universitaria': CUniv:= CUniv + 1; 'Hugo Chavez': Chavez:= Chavez + 1; 'Plaza Sucre': PlazaS:= PlazaS + 1; 
								'La California': LaCali:= LaCali + 1; 'Los Simbolos': LSimbo:= LSimbo + 1; 'Montecristo': MtCristo:= MtCristo + 1; 
								'Gato Negro': GatoN:= GatoN + 1; 'Petare': Petare:= Petare + 1; 'Los Jardines': LJardi:= LJardi + 1; 'Boleita': Boleita:= Boleita + 1;
								'Agua Salud': AguaS:= AguaS + 1; 'Palo Verde': PaloV:= PaloV + 1; 'El Valle': Valle:= Valle + 1; 'El Marquez': EMarquez:= EMarquez + 1;
								'Cano Amarillo': CAmari:= CAmari + 1; 'El Silencio': Silencio:= Silencio + 1; 'Mercado': Mercado:= Mercado + 1; 
								'Warairarepano': Wara:= Wara + 1; 'Capitolio': Capito:= Capito + 1; 'Capuchinos': Capuchi:= Capuchi + 1; 'Coche': Coche:= Coche + 1; 
								'Las Flores': LFlores:= LFlores + 1; 'La Hoyada': Hoyada:= Hoyada + 1; 'Maternidad': Materni:= Materni + 1; 
								'La Rinconada': LRinco:= LRinco + 1; 'Panteon': Panteon:= Panteon + 1; 'Parque Carabobo': PqCara:= PqCara + 1; 
								'Zona Rental': ZRental:= ZRental + 1; 'Socorro': Socorro:= Socorro + 1; 'Bellas Artes': BArtes:= BArtes + 1; 'La Paz': LPaz:= LPaz + 1;
								'Parque Central': PqCent:= PqCent + 1; 'Presidente Medina': PresiM:= PresiM + 1; 'Colegio de ing': ColeIng:= ColeIng + 1; 
								'La Yaragua': LYaragua:= LYaragua + 1; 'Nuevo Circo': NCirco:= NCirco + 1; 'El Cristo': ECristo:= ECristo + 1; 
								'Plaza Venezuela': PlazaV:= PlazaV + 1; 'Carapita': Carapita:= Carapita + 1; 'Teatros': Teatros:= Teatros + 1; 
								'Roca Tarpeya': RocaT:= RocaT + 1; 'Sabana Grande': SabanaG:= SabanaG + 1; 'Antimano': Antimano:= Antimano + 1; 'INCES': INCES:= INCES + 1;
								'Chacaito': Chacaito:= Chacaito + 1; 'Mamera': Mamera:= Mamera + 1; 'Artigas': Artigas:= Artigas + 1; 'Roosevelt': Roose:= Roose + 1; 
								'Chacao': Chacao:= Chacao + 1; 'Caricuao': Caricuao:= Caricuao + 1; 'Bello Monte': BelloM:= BelloM + 1; 'Los Ilustres': Ilustres:= Ilustres + 1; 
								'Altamira': Altamira:= Altamira + 1; 'Zoologico': Zoo:= Zoo + 1; 'Las Mercedes': Mercedes:= Mercedes + 1; 'Petare 2': Petare2:= Petare2 + 1;
								'Miranda': Miranda:= Miranda + 1; 'Ruiz Pineda/Las Adjuntas': RP_LA:= RP_LA + 1; 'Parque Simon Bolivar': PqSimonB:= PqSimonB + 1;
								'19 de Abril': Abril19:= Abril19 + 1; '5 de Julio': Julio5:= Julio5 + 1; '24 de Julio': Julio24:= Julio24 + 1;
								end;
							case SubEstacionD of
								'Propatria': ProPa:= ProPa + 1; 'Los Dos Caminos': LDC:= LDC + 1; 'La Bandera': LBand:= LBand + 1; 
								'Bello Campo': BelloC:= BelloC + 1; 'Perez Bonalde': PerezB:= PerezB + 1; 'Los Cortijos': LCorti:= LCorti + 1; 
								'Ciudad Universitaria': CUniv:= CUniv + 1; 'Hugo Chavez': Chavez:= Chavez + 1; 'Plaza Sucre': PlazaS:= PlazaS + 1; 
								'La California': LaCali:= LaCali + 1; 'Los Simbolos': LSimbo:= LSimbo + 1; 'Montecristo': MtCristo:= MtCristo + 1; 
								'Gato Negro': GatoN:= GatoN + 1; 'Petare': Petare:= Petare + 1; 'Los Jardines': LJardi:= LJardi + 1; 'Boleita': Boleita:= Boleita + 1;
								'Agua Salud': AguaS:= AguaS + 1; 'Palo Verde': PaloV:= PaloV + 1; 'El Valle': Valle:= Valle + 1; 'El Marquez': EMarquez:= EMarquez + 1;
								'Cano Amarillo': CAmari:= CAmari + 1; 'El Silencio': Silencio:= Silencio + 1; 'Mercado': Mercado:= Mercado + 1; 
								'Warairarepano': Wara:= Wara + 1; 'Capitolio': Capito:= Capito + 1; 'Capuchinos': Capuchi:= Capuchi + 1; 'Coche': Coche:= Coche + 1; 
								'Las Flores': LFlores:= LFlores + 1; 'La Hoyada': Hoyada:= Hoyada + 1; 'Maternidad': Materni:= Materni + 1; 
								'La Rinconada': LRinco:= LRinco + 1; 'Panteon': Panteon:= Panteon + 1; 'Parque Carabobo': PqCara:= PqCara + 1; 
								'Zona Rental': ZRental:= ZRental + 1; 'Socorro': Socorro:= Socorro + 1; 'Bellas Artes': BArtes:= BArtes + 1; 'La Paz': LPaz:= LPaz + 1;
								'Parque Central': PqCent:= PqCent + 1; 'Presidente Medina': PresiM:= PresiM + 1; 'Colegio de ing': ColeIng:= ColeIng + 1; 
								'La Yaragua': LYaragua:= LYaragua + 1; 'Nuevo Circo': NCirco:= NCirco + 1; 'El Cristo': ECristo:= ECristo + 1; 
								'Plaza Venezuela': PlazaV:= PlazaV + 1; 'Carapita': Carapita:= Carapita + 1; 'Teatros': Teatros:= Teatros + 1; 
								'Roca Tarpeya': RocaT:= RocaT + 1; 'Sabana Grande': SabanaG:= SabanaG + 1; 'Antimano': Antimano:= Antimano + 1; 'INCES': INCES:= INCES + 1;
								'Chacaito': Chacaito:= Chacaito + 1; 'Mamera': Mamera:= Mamera + 1; 'Artigas': Artigas:= Artigas + 1; 'Roosevelt': Roose:= Roose + 1; 
								'Chacao': Chacao:= Chacao + 1; 'Caricuao': Caricuao:= Caricuao + 1; 'Bello Monte': BelloM:= BelloM + 1; 'Los Ilustres': Ilustres:= Ilustres + 1; 
								'Altamira': Altamira:= Altamira + 1; 'Zoologico': Zoo:= Zoo + 1; 'Las Mercedes': Mercedes:= Mercedes + 1; 'Petare 2': Petare2:= Petare2 + 1;
								'Miranda': Miranda:= Miranda + 1; 'Ruiz Pineda/Las Adjuntas': RP_LA:= RP_LA + 1; 'Parque Simon Bolivar': PqSimonB:= PqSimonB + 1;
								'19 de Abril': Abril19:= Abril19 + 1; '5 de Julio': Julio5:= Julio5 + 1; '24 de Julio': Julio24:= Julio24 + 1;
								end;
						end;
						
					clrscr;
					writeln('Muestra de Factura');
					writeln('Nombre: ', Nombre, ' ', Apellido);
					writeln('C.I: ', Cedula);
					writeln(MostrarSubEstaciones);
					writeln(' ');
					writeln('Total: ', MontoTotal:0:1);
					writeln(' ');
					writeln(' ');
					writeln('Si esta seguro de su compra, presione 1 para proceder al pago.');
					writeln('Si ha cambiado de opinion, presione 2 para salir del sistema.');
					writeln('(Perdera todos los datos ingresados hasta el momento)');
					write('Pago:1, Salir:2 = '); readln(OpcionUsuario);
					
					if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
						repeat
							write('Ingrese una opcion valida. Pago:1, Salir:2 = '); readln(OpcionUsuario);
						until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
						
					//Desde este momento, luego de ver la factura, el usuario puede decicdir si quiere salir del sistema, lo que lo llevará al inicio para que otro usuario pueda usar el sistema.
					SalirSistema:= 0; //El valor de esta variable es lo que definirá si el usuario quiere continuar o quiere salir, cuando se cambie su valor a 1, es porque el usuario quiere salir.
					
					case OpcionUsuario of
						1:begin //Si el usuario desea pagar, se le muestra el monto y se le pide el pago, de ser mayor este ultimo, se le da un vuelto, y si es menor programa no avanzará hasta que se realice el pago completo.
								clrscr;
								writeln('Total a pagar: ', MontoTotal:0:2);
								write('Su Deposito:   '); readln(Pago);
								
								DiferenciaPago:= (MontoTotal - Pago);
									
								if DiferenciaPago < 0 then
									begin
										writeln('');
										writeln('');
										writeln('Su vuelto es de ', (DiferenciaPago*(-1)):0:1);
									end
								else if DiferenciaPago > 0 then
									repeat
										writeln('');
										writeln('');
										writeln('Su pago fue incompleto, le falta por pagar ', DiferenciaPago:0:1);
										MontoTotal:= DiferenciaPago;
										writeln('Total a pagar: ', MontoTotal:0:2);
										write('Su Deposito:   '); readln(Pago);
										DiferenciaPago:= (MontoTotal - Pago);
										
										if DiferenciaPago < 0 then
											begin
												writeln('');
												writeln('');
												writeln('Su vuelto es de ', (DiferenciaPago*(-1)):0:1);
											end
									until ((DiferenciaPago < 0) or (DiferenciaPago = 0));
								
								write('Ha realizado el pago completo de sus boletos, presione Enter para continuar.'); readln();

							end;
						2:begin //En el otro caso, si el usuario desea salir, se le muestra un mensaje de despedida y se modifican las variables necesarias para volver al inicio del sistema.
								writeln('Gracias por utilizar el sistema.');
								SalirSistema:= 1;
								OpcionUsuario:=0;
								writeln('Presione Enter para continuar'); readln();
							end;
						end;
						
					while SalirSistema = 0 do //Solo se romperá el ciclo, o se omitirá cuando el usuario elija salir y la se cambie el valor de la variable.
						begin
							clrscr;
							writeln('Ingrese una de las siguientes opciones:');
							writeln('Utilizar Boleto = 1');
							writeln('Ver Sistema (Se necesita contrasena de acceso) = 2');
							writeln('Salir del Sistema = 3');
							writeln('');
							write('Opcion: '); readln(OpcionUsuario);
							
							if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2) and (OpcionUsuario <> 3)) then
								repeat
									write('Ingrese una opcion valida. Usar Boleto:1, Ver Sistema:2, Salir:3 = '); readln(OpcionUsuario);
								until ((OpcionUsuario = 1) or (OpcionUsuario = 2) or (OpcionUsuario = 3));
								
							case OpcionUsuario of
								1:begin //Si decide usar el boleto
										clrscr;
										writeln('Desea usar uno de sus boletos?'); //Primero confirma, si dice que no, se devuelve al menu anterior.
										writeln('Si: 1, No: 2');
										write('Opcion: '); readln(OpcionUsuario);
										
										if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
											repeat
												write('Ingrese una opcion valida para el uso del boleto. Si: 1, No: 2 ='); readln(OpcionUsuario);
											until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
											
										if OpcionUsuario = 1 then
											begin
												ValidarCedula := 0;                  //Utilizada para que se cumpla el ciclo repeat que pide la cedula y muestra cuantos boletos quedan.
												if ((nBoletos > 0) and (ValidarCedula = 0)) then //Solo se continuará por aquí si al usuario le quedan boletos y la variable anterior es 0.
													repeat
														clrscr;
														writeln('Actualmente cuenta con un total de ', nBoletos);
														writeln('Para usar uno necesita confirmar su cedula.');
														write('C.I: '); readln(ConfirCedula);

														if ConfirCedula <> Cedula then
															begin
																writeln('La cedula ingresada no coincide con la cedula ingresada anteriormente.');
																writeln('Si desea volver a intentar ingrese 1, si desea volver al menu anterior ingrese 2.');
																write('Opcion: '); readln(OpcionUsuario);
															
																if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
																	repeat
																		write('Ingrese una opcion valida. Si: 1, No: 2 ='); readln(OpcionUsuario);
																	until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
																	
																	if OpcionUsuario = 2 then ValidarCedula:= 1; //Si el usuario elige volver al menú anterior, se cambia la variable para romper el ciclo.
															end;
														if ConfirCedula = Cedula then
															begin
																clrscr;
																nBoletos:= nBoletos - 1;
																writeln('Ha utilizado uno de sus boletos.');
																writeln('Le quedan ', nBoletos);
																nBoletosUsados:= nBoletosUsados + 1;
																ValidarCedula:= 1;                           //Luego de que valide la cedula, se le resta un boleto y se cambia la variable para terminar el ciclo.
																write('Presione Enter para continuar.'); readln();
															end;
													until ValidarCedula= 1
												
												else if nBoletos = 0 then //Si se queda sin boletos
													begin
														writeln('Actualmente no cuenta con boletos,');
														writeln('Si desea volver a comprar boletos ingrese 1, si desea volver al menu anterior ingrese 2.');
														write('Opcion: '); readln(OpcionUsuario);
														
														if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
															repeat
																write('Ingrese una opcion valida. Volver a comprar: 1, Volver al menu anterior: 2 ='); readln(OpcionUsuario);
															until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
															
														if OpcionUsuario = 1 then //Si elige volver a comprar boletos se cambian las respectivas variables para romper ciclos y volver al inicio.
															begin										//En caso de que desee volver al menú anterior (Opción 2), no es necesario cambiar ninguna variable, para que se siga repitiendo el ciclo del menú y lo vuelva a mostrar.
																SalirSistema := 1;
																OpcionUsuario:=0
															end;
													end;
											end;
									end;
								2:begin //Si no desea usar boletos, la opcion 2 es Ver Sistema. Como también se debe poder acceder a esta función desde el inicio del programa, Ver Sistema se encuentra fuera del ciclo del menú, por eso se deben modificar las variables necesarias para llegar a ese punto del sistema.
										SalirSistema:= 1; //Se rompe el ciclo del menú
										OpcionUsuario:= 2; //Al inicio del programa se le dice al usuario que las opciones son 1:Comprar Boleto, 2:Ver Sistema y 3:Cerrarl. Por lo tanto para acceder a Ver Sistema, se modifica la variable a 2.
									end; 
								3:begin //Si no desea ni usar boletos ni Ver Sistema, se modifican las variables para volver al inicio del programa y que otro usuario acceda.
										SalirSistema:= 1;
										OpcionUsuario:=0;
									end;
								end;
						end;
				end;
			if OpcionUsuario = 2 then //Si el usuario no desea comprar boletos, y elige la opcion de Ver Sistema
				begin
					clrscr;
					writeln('Desea ingresar a la base de datos?'); //Si se elige No, se volverá al inicio del programa
					writeln('Si: 1, No: 2');
					write('Opcion: '); readln(OpcionUsuario);
					
					if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
						repeat
							write('Ingrese una opcion valida. Si: 1, No: 2 ='); readln(OpcionUsuario);
						until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
					
					if OpcionUsuario = 1 then //Si se desea acceder a los datos del sistema.
						begin
							ValidarContra:= 0; //Con esta variable se comienza el ciclo para acceder a la base de datos.
							while ValidarContra = 0 do
								begin
									clrscr;
									writeln('Para acceder a los datos del Sistema, debe ingresar la contrasena.');
									write('Contrasena: '); readln(ConfirContra);
															
									if ContrasenaSistema <> ConfirContra then
										begin
											clrscr;
											writeln('La contrasena ingresada no es correcta');
											writeln('Si desea volver a intentar ingrese 1, si desea volver al menu anterior ingrese 2.');
											write('Opcion: '); readln(OpcionUsuario);
																								
											if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
												repeat
													write('Ingrese una opcion valida. Si: 1, No: 2 ='); readln(OpcionUsuario);
												until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
											
											if OpcionUsuario = 2 then ValidarContra:= 1; //Si la contraseña es incorrecta, se pregunta si quiere reintentar salir, si elige salir se cambia la variable y se rompe el ciclo.
										end
									
									else //Si la contraseña es correcta
										begin
											clrscr;
											writeln('Bienvenido a la base de datos del sistema.');
											writeln('Aqui tiene varias tablas con los datos del sistema.');
											write('Presione Enter para continuar.'); readln();
											
											MostrarDatos:= 0; //Variable para iniciar el ciclo que muestra todos los datos.
											nPagDatos:= 1; //Variable que define que tabla de datos se va a mostrar.
											
											while MostrarDatos = 0 do //Solo cambiará a 1 cuando el usuario desee salir.
												begin
													if nPagDatos = 1 then
														begin
															clrscr;
															writeln('-----------------------------------                                   ');
															writeln('| CANTIDAD DE PERSONAS POR LINEA  |                                   ');
															writeln('----------------------------------------------------------------------');
															writeln('|-Linea 1        |       ', nLinea1, '        |-Linea 5         |       ', nLinea5, '        |');
															writeln('|-Linea 2        |       ', nLinea2, '        |-Linea 6         |       ', nLinea6, '        |');
															writeln('|-Linea 3        |       ', nLinea3, '        |-Linea 7         |       ', nLinea7, '        |');
															writeln('|-Linea 4        |       ', nLinea4, '        |-Linea Cabletren |       ', nLineaMC, '        |');
															writeln('----------------------------------------------------------------------');
															writeln('Si desea salir de la base de datos presione 1');
															writeln('Si por el contrario desea ver otros datos');
															writeln('Presione 2 para avanzar a la siguiente tabla: '); readln(OpcionUsuario);
															
															case OpcionUsuario of
																1:begin //Si elige 1, se saldrá del ciclo de Ver Sistema, y del ciclo de validación de contraseña, volviendo al inicio del programa.
																		MostrarDatos:= 1;
																		ValidarContra:= 1;
																	end;
																2: nPagDatos := nPagDatos + 1; //Para pasar a la siguiente tabla.
																end;
														end;
													if nPagDatos = 2 then
														begin
															clrscr;
															writeln('-----------------------------------                                                              ');
															writeln('| PROMEDIO DE VENTAS POR ESTACION |                                                              ');
															writeln('-------------------------------------------------------------------------------------------------');
															writeln('|-Propatria        ',ProPa,'|-Los Dos Caminos           ',LDC,'|-La Bandera            ',LBand,'|-Bello Campo        ',BelloC,'|');
															writeln('|-Perez Bonalde    ',PerezB,'|-Los Cortijos              ',LCorti,'|-Ciudad Universitaria  ',CUniv,'|-Hugo Chavez        ',Chavez,'|');
															writeln('|-Plaza Sucre      ',PlazaS,'|-La California             ',LaCali,'|-Los Simbolos          ',LSimbo,'|-Montecristo        ',MtCristo,'|');
															writeln('|-Gato Negro       ',GatoN,'|-Petare                    ',Petare,'|-Los Jardines          ',LJardi,'|-Boleita            ',Boleita,'|');
															writeln('|-Agua Salud       ',AguaS,'|-Palo Verde                ',PaloV,'|-El Valle              ',Valle,'|-El Marquez         ',EMarquez,'|');
															writeln('|-Cano Amarillo    ',CAmari,'|-El Silencio               ',Silencio,'|-Mercado               ',Mercado,'|-Warairarepano      ',Wara,'|');
															writeln('|-Capitolio        ',Capito,'|-Capuchinos                ',Capuchi,'|-Coche                 ',Coche,'|-Las Flores         ',LFlores,'|');
															writeln('|-La Hoyada        ',Hoyada,'|-Maternidad                ',Materni,'|-La Rinconada          ',LRinco,'|-Panteon            ',Panteon,'|');
															writeln('|-Parque Carabobo  ',PqCara,'|-5 de Julio                ',Julio5,'|-Zona Rental           ',ZRental,'|-Socorro            ',Socorro,'|');
															writeln('|-Bellas Artes     ',BArtes,'|-La Paz                    ',LPaz,'|-Parque Central        ',PqCent,'|-Presidente Medina  ',PresiM,'|');
															writeln('|-Colegio de ing   ',ColeIng,'|-24 de Julio               ',Julio24,'|-Nuevo Circo           ',NCirco,'|-El Cristo          ',ECristo,'|');
															writeln('|-Plaza Venezuela  ',PlazaV,'|-Carapita                  ',Carapita,'|-Teatros               ',Teatros,'|-Roca Tarpeya       ',RocaT,'|');
															writeln('|-Sabana Grande    ',SabanaG,'|-Antimano                  ',Antimano,'|-La Yaragua            ',LYaragua,'|-INCES              ',INCES,'|');
															writeln('|-Chacaito         ',Chacaito,'|-Mamera                    ',Mamera,'|-Artigas               ',Artigas,'|-Roosevelt          ',Roose,'|');
															writeln('|-Chacao           ',Chacao,'|-Caricuao                  ',Caricuao,'|-Bello Monte           ',BelloM,'|-Los Ilustres       ',Ilustres,'|');
															writeln('|-Altamira         ',Altamira,'|-Zoologico                 ',Zoo,'|-Las Mercedes          ',Mercedes,'|-Petare 2           ',Petare2,'|');
															writeln('|-Miranda          ',Miranda,'|-Ruiz Pineda/Las Adjuntas  ',RP_LA,'|-Parque Simon Bolivar  ',PqSimonB,'|-19 de Abril        ',Abril19,'|');
															writeln('------------------------------------------------------------------------------------------------');
															writeln('Si desea salir de la base de datos presione 1');
															writeln('Si por el contrario desea ver otros datos');
															writeln('Presione 0 para ir a la tabla anterior, o 2 para avanzar a la siguiente tabla: '); readln(OpcionUsuario);
															
															case OpcionUsuario of
																1:begin
																		MostrarDatos:= 1;
																		ValidarContra:= 1;
																	end;
																0: nPagDatos := nPagDatos - 1;
																2: nPagDatos := nPagDatos + 1;
																end;
														end;
													if nPagDatos = 3 then
														begin
															clrscr;
															writeln('-----------------------------------                                   ');
															writeln('| CANTIDAD DE BOLETOS UTILIZADOS  |                                   ');
															writeln('----------------------------------------------------------------------');
															writeln('|-Boletos Comprados               |                 ', nBoletosSistema, '                |');
															writeln('|-Boletos Utilizados              |                 ', nBoletosUsados, '                |');
															writeln('----------------------------------------------------------------------');
															writeln('Si desea salir de la base de datos presione 1');
															writeln('Si por el contrario desea ver otros datos');
															writeln('Presione 0 para ir a la tabla anterior: '); readln(OpcionUsuario);
															
															case OpcionUsuario of
																1:begin
																		MostrarDatos:= 1;
																		ValidarContra:= 1;
																	end;
																0: nPagDatos := nPagDatos - 1;
																end;
														end;												
												end;
										end;
								end;
						end;
				end
			else if OpcionUsuario= 3 then //Si no se elige la opción de comprar boletos, o la de ver sistema, se abre el menú para cerrar el sistema.
				begin
					ValidarContra:= 0; //Se vuelve a entrar en un ciclo para validar la contraseña, y proceder segun desee el usuario.
					while ValidarContra = 0 do //Solo se rompe si el usuario elige volver al inicio.
						begin
							clrscr;
							writeln('Para cerrar el Sistema, debe ingresar la contrasena.');
							write('Contrasena: '); readln(ConfirContra);

							if ContrasenaSistema <> ConfirContra then
								begin
									clrscr;
									writeln('La contrasena ingresada no es correcta');
									writeln('Si desea volver a intentar ingrese 1, si desea volver al menu anterior ingrese 2.');
									write('Opcion: '); readln(OpcionUsuario);

									if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
										repeat
											write('Ingrese una opcion valida. Si: 1, No: 2 ='); readln(OpcionUsuario);
										until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
										
									if OpcionUsuario = 2 then ValidarContra:= 1; //Si el usuario se equivoca, se le pregunta si quiere reintentar o volver atrás, si decide volver se rompe el ciclo.
								end
								
							else //En el caso de que la contraseña ingresada sea correcta
								begin
									clrscr;
									write('Presione Enter para cerrar el sistema.'); readln();
									exit; //Se cierra el programa.
								end;
						end;
				end;
		end;
end.
