program Metro_Caracas;

var 
	Nombre, Apellido, Cedula : string;
	InicioPrograma, nBoletos : integer;

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
			end;
		end;
end.
