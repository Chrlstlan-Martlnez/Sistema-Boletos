program Metro_Caracas;

uses
	crt;

var 
	Nombre, Apellido, Cedula : string;
	InicioPrograma, nBoletos, i, TipoBoleto, n1, n2, n3, n4, n5, n6, n7, n8, n9, n10 : integer;

begin
	n1:= 0; n2:= 0; n3:= 0; n4:= 0; n5:= 0; n6:= 0; n7:= 0; n8:= 0; n9:= 0; n10:= 0; 

	writeln('Bienvenido a la estacion del metro de Caracas.');
	writeln('Desea comprar boletos? Si=1 No=2');
	readln(InicioPrograma);
	
	if ((InicioPrograma <> 1) and (InicioPrograma <> 2)) then
		begin
			repeat
				writeln('Ingrese una opcion valida. Si=1 No=2');
				readln(InicioPrograma);
			until ((InicioPrograma = 1) or (InicioPrograma = 2));
		end;
		
	case InicioPrograma of
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
					writeln('|(2)Integrado              |Amarillo |1 viaje en metro       |  1   |');
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
									writeln('Ingrese una opcion de boleto valida (1-2-3-4-5-6-7-8-9-10).');
									readln(TipoBoleto);
								until ((TipoBoleto = 1) or (TipoBoleto = 2) or (TipoBoleto = 3) or (TipoBoleto = 4) or (TipoBoleto = 5) 
								or (TipoBoleto = 6) or (TipoBoleto = 7) or (TipoBoleto = 8) or (TipoBoleto = 9) or (TipoBoleto = 10));
							end;
					
					
					write('Tu boleto numero ', i ,' es: ');
					case TipoBoleto of
						1: begin
								Writeln('Simple');
								n1 := n1 + 1;
							end;
						2: begin
								Writeln('Integrado');
								n2 := n2 + 1;
							end;
						3: begin
								Writeln('Ida y Vuelta');
								n3 := n3 + 1;
							end;
						4: begin
								Writeln('Ida y Vuelta Integrado');
								n4 := n4 + 1;
							end;
						5: begin
								Writeln('Multiabono');
								n5 := n5 + 1;
							end;
						6: begin
								Writeln('Multiabono Integrado');
								n6 := n6 + 1;
							end;
						7: begin
								Writeln('Estudiantil');
								n7 := n7 + 1;
							end;
						8: begin
								Writeln('Estudiantil Integrado');
								n8 := n8 + 1;
							end;
						9: begin
								Writeln('MetroTarjeta');
								n9 := n9 + 1;
							end;
						10:begin
								Writeln('MetroTarjeta Integrado');
								n10 := n10 + 1;
							end;
						end;
					writeln('Presiona Enter para continuar');
					readln( );
				end;
			
			writeln('En este momento usted tiene:');
			writeln('');
			writeln('----------------------------------------------------------------------');
			writeln('|         BOLETOS          |  COLOR  |       COBERTURA       |CANTIDAD|');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(1)Simple                 |Amarillo |1 viaje en metro       |   ',n1,'    |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(2)Integrado              |Amarillo |1 viaje en metro       |   ',n2,'    |');
			writeln('|                          |         |1 viaje en bus         |        |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(3)Ida y Vuelta           |Amarillo |2 viajes en metro      |   ',n3,'    |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(4)Ida y Vuelta Integrado |Amarillo |2 viajes en metro      |   ',n4,'    |');
			writeln('|                          |         |2 viajes en bus        |        |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(5)Multiabono             |Naranja  |10 viajes en metro     |   ',n5,'    |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(6)Multiabono Integrado   |Naranja  |10 viajes en metro     |   ',n6,'    |');
			writeln('|                          |         |10 viajes en bus       |        |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(7)Estudiantil            |Azul     |10 viajes en metro     |   ',n7,'    |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(8)Estudiantil Integrado  |Azul     |10 viajes en metro     |   ',n8,'    |');
			writeln('|                          |         |20 viajes en bus       |        |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(9)MetroTarjeta           |Rojo     |20 viajes              |   ',n9,'    |');
			writeln('|                          |         |30 viajes              |        |');
			writeln('|                          |         |40 viajes              |        |');
			writeln('|--------------------------|---------|-----------------------|--------|');
			writeln('|(10)MetroTarjeta Integrada|Rojo     |20 viajes(Metro y Bus) |   ',n10,'    |');
			writeln('|                          |         |30 viajes(Metro y Bus) |        |');
			writeln('|                          |         |40 viajes(Metro y Bus) |        |');
			writeln('-----------------------------------------------------------------------');			
			
			end;
		end;
end.
