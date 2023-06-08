program Metro_Caracas;

uses
	crt;

var 
	Nombre, Apellido, Cedula, NombreBoleto, NroBoletoUsuario, Transporte, SubEstacionS, SubEstacionD : string;
	MostrarSubestaciones : AnsiString;
	OpcionUsuario, nBoletos, nBoletosTotal, i, TipoBoleto, nViajesBoleto, nPagLinea, ElegirLinea, 
	n1, n2a, n2b, n3, n4a, n4b, n5, n6a, n6b, n7, n8a, n8b, n9a, n9b, n9c, n10a, n10b, n10c : integer;
	MontoTotal : real;

begin
	n1:= 0; n2a:= 0; n2b:= 0; n3:= 0; n4a:= 0; n4b:= 0; n5:= 0; n6a:= 0; n6b:= 0; n7:= 0;
	n8a:= 0; n8b:= 0; n9a:= 0; n9b:= 0; n9c:= 0; n10a:= 0; n10b:= 0; n10c:= 0; nViajesBoleto:= 0;

	writeln('Bienvenido a la estacion del metro de Caracas.');
	writeln('Desea comprar boletos? Si=1 No=2');
	readln(OpcionUsuario);
	
	if ((OpcionUsuario <> 1) and (OpcionUsuario <> 2)) then
		begin
			repeat
				writeln('Ingrese una opcion valida. Si=1 No=2');
				readln(OpcionUsuario);
			until ((OpcionUsuario = 1) or (OpcionUsuario = 2));
		end;
		
	case OpcionUsuario of
		2:begin
				writeln('Gracias por usar el sistema, presione enter para salir.');
				readln();
				exit;
			end;
		1:begin
				writeln('Ingrese los siguientes datos:');
				write('Nombre: '); readln(Nombre);
				write('Apellido: '); readln(Apellido);
				write('Cedula: '); readln(Cedula);
				write('Cantidad de Boletos: '); readln(nBoletos);
				
				for i:=1 to nBoletos do
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
						
						if ((TipoBoleto <> 1) and (TipoBoleto <> 2) and (TipoBoleto <> 3) and (TipoBoleto <> 4) and (TipoBoleto <> 5) 
						and (TipoBoleto <> 6) and (TipoBoleto <> 7) and (TipoBoleto <> 8) and (TipoBoleto <> 9) and (TipoBoleto <> 10)) then
							begin
								repeat
									write('Ingrese una opcion de boleto valida (1-2-3-4-5-6-7-8-9-10).'); readln(TipoBoleto);
								until ((TipoBoleto = 1) or (TipoBoleto = 2) or (TipoBoleto = 3) or (TipoBoleto = 4) or (TipoBoleto = 5) 
								or (TipoBoleto = 6) or (TipoBoleto = 7) or (TipoBoleto = 8) or (TipoBoleto = 9) or (TipoBoleto = 10));
							end;
						
						
						if (TipoBoleto = 1) or (TipoBoleto = 3) or (TipoBoleto = 5) or (TipoBoleto = 7) then
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
						
						else
							begin
								if (TipoBoleto = 2) or (TipoBoleto = 4) or (TipoBoleto = 6) or (TipoBoleto = 8) then
									begin
										write('El boleto que ha seleccionado tiene cobertura tanto para metro como bus, por favor ingrese el tipo de viaje que desea (Metro: 1, Bus: 2): '); readln(OpcionUsuario);
											
										if (OpcionUsuario <> 1) and (OpcionUsuario <> 2) then
											begin
												repeat
													write('Opcion invalida, ingrese 1 para viaje en metro, o ingrese 2 para viaje en bus: '); readln(OpcionUsuario);
												until (OpcionUsuario = 1) or (OpcionUsuario = 2);
											end;
											
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
								else
									begin
										write('El boleto que ha seleccionado permite 20, 30 y 40 viajes, por favor ingrese la cantidad de viajes que quiere para su boleto: '); readln(OpcionUsuario);
										if (OpcionUsuario <> 20) and (OpcionUsuario <> 30) and (OpcionUsuario <> 40) then
											begin
												repeat
													write('Opcion invalida, ingrese una cantidad valida de viajes, ya sea 20, 30 o 40: '); readln(OpcionUsuario);
												until (OpcionUsuario = 20) or (OpcionUsuario = 30) or (OpcionUsuario = 40);
											end;
										
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
				
				MontoTotal := ((n1*1) + ((n2a+n2b)*1.5) + (n3*2) + ((n4a+n4b)*3) + (n5*10) + ((n6a+n6b)*15) + (n7*7.5) + ((n8a+n8b)*15) + ((n9a+n9b+n9c)*30) + ((n10a+n10b+n10c)*50));
				nBoletosTotal := (n1 + n2a + n2b + n3 + n4a + n4b + n5 + n6a + n6b + n7 + n8a + n8b + n9a + n9b + n9c + n10a + n10b + n10c);
					
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


				MostrarSubestaciones := 'Sus subestaciones elegidas :';
				
				for i:=1 to nBoletos do
					begin
						str(i, NroBoletoUsuario);
						
						ElegirLinea := 0;
						nPagLinea := 1;
						
						while ElegirLinea = 0 do
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
													repeat
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
												
													ElegirLinea := 1;
													
													write('Presiona Enter para continuar'); readln();
												end;
											2: nPagLinea := nPagLinea + 1;
											end;
									end;
								if nPagLinea = 2 then
									begin
										clrscr;
										writeln('             -------------                                            ');
										writeln('             |  LINEA 2  |                                            ');
										writeln('----------------------------------------------------------------------');
										writeln('|-El Silencio  |-Artiguas     |-Carapita  |-Caricuao                 |');
										writeln('|-Capuchinos   |-La Paz       |-Antimano  |-Zoologico                |');
										writeln('|-Maternidad   |-La Yaguara   |-Mamera    |-Ruiz Pineda/Las Adjuntas |');
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

													until (((SubEstacionS = 'El Silencio') or (SubEstacionS = 'Capuchinos') or (SubEstacionS = 'Maternidad') or (SubEstacionS = 'Artiguas') 
													or (SubEstacionS = 'La Paz') or (SubEstacionS = 'La Yaguara') or (SubEstacionS = 'Carapita') or (SubEstacionS = 'Antimano') 
													or (SubEstacionS = 'Mamera') or (SubEstacionS = 'Caricuao') or (SubEstacionS = 'Zoologico') or (SubEstacionS = 'Ruiz Pineda/Las Adjuntas')) 
													and ((SubEstacionD = 'El Silencio') or (SubEstacionD = 'Capuchinos') or (SubEstacionD = 'Maternidad') or (SubEstacionD = 'Artiguas') 
													or (SubEstacionD = 'La Paz') or (SubEstacionD = 'La Yaguara') or (SubEstacionD = 'Carapita') or (SubEstacionD = 'Antimano') 
													or (SubEstacionD = 'Mamera') or (SubEstacionD = 'Caricuao') or (SubEstacionD = 'Zoologico') or (SubEstacionD = 'Ruiz Pineda/Las Adjuntas')));
													MostrarSubEstaciones := MostrarSubEstaciones + #13#10 + 'Boleto ' + NroBoletoUsuario + ': Desde ' + SubEstacionS + ' hasta ' + SubEstacionD;
												
													ElegirLinea := 1;
													
													write('Presiona Enter para continuar'); readln();
												end;
											0: nPagLinea := nPagLinea - 1;
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
												
													ElegirLinea := 1;
													
													write('Presiona Enter para continuar'); readln();
												end;
											0: nPagLinea := nPagLinea - 1;
											end;		
									end;
							end;
		
					end;
				
				clrscr;
				writeln(MostrarSubEstaciones);
				
			end;
		end;
end.
