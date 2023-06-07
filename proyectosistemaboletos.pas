program Metro_Caracas;

//uses crt;

var 
	Nombre, Apellido, Cedula : string;
	InicioPrograma, nBoletos, i, TipoBoleto: integer;

begin

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
					//clrscr;//
						writeln('Estos son los tipos de boletos que hay, elija los que desee.');
						writeln('');
						writeln('---------------------------------------------------------------------');
						writeln('|         BOLETOS          |  COLOR  |       COBERTURA       |PRECIO|');
						writeln('|--------------------------|---------|-----------------------|------|');
						writeln('|(1)Simple                 |Amarillo |1 viaje en metro       |  1   |');
						writeln('|--------------------------|---------|-----------------------|------|');
						writeln('|(2)Integrado              |Amarillo |1 viaje en metro       |  1   |');
						writeln('|                          |         |1 viaje en bus         | 0.5  |');
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
						
						writeln('Ingrese el numero correspondiente al tipo de boleto que desea comprar => '); readln(TipoBoleto);
						write('Tu boleto numero ', i ,' es: ');
						case TipoBoleto of
							1: Writeln('Simple');
							2: Writeln('Integrado');
							3: Writeln('Ida y Vuelta');
							4: Writeln('Ida y Vuelta Integrado');
							5: Writeln('Multiabono');
							6: Writeln('Multiabono Integrado');
							7: Writeln('Estudiantil');
							8: Writeln('Estudiantil Integrado');
							9: Writeln('MetroTarjeta');
							10: Writeln('MetroTarjeta Integrado');
						end;
						writeln('Presiona Enter para continuar');
						readln( );
					end;
			end;
		end;
end.
