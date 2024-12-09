Funcion opc = menu
	Escribir "==========================================================="
	Escribir "====== C O N T R O L == D E == E S T U D I A N T E S ======"
	Escribir "==========================================================="
	Escribir "1. Asignar 3 notas parciales a cada estudiante"
	Escribir "2. registrar el numero de inasistencias de cada estudiante"
	Escribir "3. Mostrar el listado de estudiantes"
	Escribir "4. Calcular nota final"
	Escribir "0. Salir"
	Escribir Sin Saltar "¿Que desea hacer?"
	Leer opc
	Repetir
		Si opc < 0 o opc > 4 Entonces
			Escribir Sin Saltar "Opcion invalida. Intente de nuevo"
			Leer opc
		FinSi
	Hasta Que opc >= 0 y opc <= 4 
FinFuncion

Funcion x = registrarEstudiantes(arr1, arr2, ind, codigo, nombre)
	arr1[ind] = codigo
	arr2[ind] = nombre
	x = ind + 1
FinFuncion

Funcion x = notas(arr3, arr4, arr5, ind, nota1, nota2, nota3)
	arr3[ind] = nota1
	arr4[ind] = nota2
	arr5[ind] = nota3
	x = ind + 1
FinFuncion

Funcion x = faltasClase(arr6, ind, faltas)
	arr6[ind] = faltas
	x = ind + 1
FinFuncion

Funcion x = notaF(arr7, ind, notaFinal)
	arr7[ind] = notaFinal
	x = ind + 1
FinFuncion

Algoritmo calculadora_notas
	
	terminar = Falso
	index = 1
	notIndex = 1
	inaIndex = 1
	defIndex = 1
	Dimension codigos[index]
	Dimension nombres[index]
	Dimension p1[notIndex]
	Dimension p2[notIndex]
	Dimension p3[notIndex]
	Dimension inasistencias[inaIndex]
	Dimension definitiva[defIndex]
	resp = " "
	
	Repetir
		Escribir Sin Saltar "¿Desea registrar un estudiante? (S/N)" 
		Leer resp
		Si resp = "s" o resp = "S" Entonces
			Escribir Sin Saltar "Ingrese el codigo del estudiante " index
			Leer codigo
			Escribir Sin Saltar "Ingrese el nombre del estudiante " index
			Leer nombre
			Escribir " "
			
			index = registrarEstudiantes(codigos, nombres, index, codigo, nombre)
			
			Redimensionar codigos[index] 
			Redimensionar nombres[index]
		FinSi
	Hasta Que resp = "n" o resp = "N"
	Limpiar Pantalla
	
	Repetir
		opcElegida = menu
		Segun opcElegida Hacer
			0.:
				Escribir "Has salido del sistema"
				terminar = no terminar
			1.: 
				Para i = 1 Hasta index-1 Hacer
					Escribir " "
					Escribir Sin Saltar "Ingrese el código del estudiante al que le va a asignar las notas"
					Leer codigoBuscado
					encontrado = Falso
						Si codigos[i] = codigoBuscado Entonces
							Escribir " "
							Escribir Sin Saltar "Nota del primer parcial de ", nombres[i], " con codigo " codigos[i]
							Leer nota1
							Escribir Sin Saltar "Nota del segundo parcial de ", nombres[i], " con codigo " codigos[i]
							Leer nota2
							Escribir Sin Saltar "Nota del tercel parcial de ", nombres[i], " con codigo " codigos[i]
							Leer nota3
							
							index = notas(p1, p2, p3, notIndex, nota1, nota2, nota3)
							
							Redimensionar p1[notIndex]
							Redimensionar p2[notIndex]
							Redimensionar p3[notIndex]
						FinSi
					FinPara
					Limpiar Pantalla
			2.:
				Para i = 1 Hasta index-1 Hacer
					Escribir " "
					Escribir Sin Saltar "Ingrese el código del estudiante al que le va asignar inasistencias"
					Leer codigoBuscado
					encontrado = Falso
					Si codigos[i] = codigoBuscado Entonces
						Escribir " "
						Escribir Sin Saltar "Cuantas inasistencias tuvo ", nombres[i], " con codigo " codigos[i]
						Leer faltas
							
						index = faltasClase(inasistencias, inaIndex, faltas)
							
						Redimensionar inasistencias[inaIndex]
					FinSi
				FinPara
				Limpiar Pantalla
			3.:
				Escribir "================================="
				Escribir "Los estudiantes registrados son: "
				Escribir "Cod    Nombres"
				Para index = 1 Hasta index-1 Hacer
					Escribir codigos[index], "    " nombres[index]
				FinPara
			4.:
				Para index = 1 Hasta index-1 Hacer
					Si faltas >= 10 y faltas < 15 Entonces
						notaT = (nota1+nota2+nota3)/3
						Leer notaT
						notaFinal = notaT-0.5
					SiNo
						Si faltas >= 15 Entonces
							notaT = (nota1+nota2+nota3)/3
							Leer notaT
							notalFinal = notaT-1
						FinSi
					FinSi
					
					Escribir "La nota final de Lina es: " notaFinal
					
					index = notaF(definitiva, defIndex, notaFinal)
					
					Redimensionar definitiva[defIndex]
				FinPara
				Para i = 1 Hasta index-1 Hacer
					Escribir codigos[i]," ", nombres[i]," ", p1[i], " ", p2[i], " ", p3[i], " ", inasistencias[i], " ", definitiva[i]
				FinPara
		FinSegun
	Hasta Que terminar
FinAlgoritmo