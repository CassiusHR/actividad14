$alumnos = [
	{ nombre: "Jose", edad: "22", comuna: "La Florida", genero: "Masculino", },
    { nombre: "Miguel", edad: "25", comuna: "Santiago", genero: "Masculino", },
    { nombre: "Mauricio", edad: "26", comuna: "Santiago", genero: "Masculino", },
    { nombre: "Sofia", edad: "21", comuna: "Macul", genero: "Femenino", },
]

#Métodos globales

def find_alumno(nombre)
    indice = nil
        $alumnos.each_with_index{|x, i| indice = i if x[:nombre].downcase == nombre.downcase}
    return indice
end
def sumar_edades
    suma = $alumnos.inject(0) {|sum, hash| sum + hash[:edad].to_i}
     return suma
 end

opcion = 0

while opcion != 10
    puts "1- Agregar alumno al registro"
    puts "2- Editar datos de alumno"
    puts "3- Borrar registro de alumno"
    puts "4- Cantidad de alumnos registrados"
    puts "5- Ver comunas registradas"
    puts "6- Ver alumnos entre 20 a 25 años"
    puts "7- Ver la suma de edades de todos los alumnos"
    puts "8- Ver el promedio de edad"
    puts "9- Mostrar el listado de alumnos por genero"
    puts "10- Salir del programa"
    puts ""
    puts "Ingresar opción: "
	opcion = gets.chomp.to_i
    case opcion
    when 1
        puts "Ingresar los datos del alumno de la siguiente forma: nombre,edad,comuna,genero"
        input = gets.chomp.split(",")
        def add_alumno(nombre , edad , comuna , genero )
            $alumnos << { nombre: nombre.to_s, edad: edad.to_s, comuna: comuna.to_s, genero: genero.to_s, }
        end
        add_alumno(input[0],input[1],input[2],input[3])
        puts ""
        puts "Alumno agregado con éxito"
        puts $alumnos
        puts ""
    when 2
        puts "Ingresar los datos del alumno a editar de la siguiente forma: nombre,edad,comuna,genero"
        input = gets.chomp.split(",")
        def edit_alumno(nombre , edad , comuna , genero )
            indice = find_alumno(nombre)
            $alumnos[indice][:edad] = edad.to_s
            $alumnos[indice][:comuna] = comuna.to_s
            $alumnos[indice][:genero] = genero.to_s
        end
        edit_alumno(input[0],input[1],input[2],input[3])
        puts ""
        puts "Alumno editado con éxito"
        puts $alumnos
        puts ""
    when 3
        puts "Ingresar el nombre de alumno a borrar"
        input = gets.chomp
        def del_alumno(nombre)
                indice = find_alumno(nombre)
                    $alumnos.delete_at(indice)
        end
        del_alumno(input)
        puts ""
        puts "alumno " + input.to_s + " borrado"
        puts $alumnos
        puts ""
    when 4
        puts ""
        puts "Actualmente hay #{$alumnos.count} alumnos registrados"
        puts ""
    when 5
        def select_comunas
            display_comunas = []
                $alumnos.each do |i|
                display_comunas << i[:comuna] 
                end
            display_comunas = display_comunas.uniq
            return display_comunas
        end
        puts ""
        puts "Listado de comunas registradas:"
        puts select_comunas
        puts ""
    when 6
        def select_alumnos(edad1, edad2)
            alumnos = []
            $alumnos.each do |i|
                if (i[:edad].to_i >= edad1 && i[:edad].to_i <= edad2)
                    alumnos << i
                end
            end
            return alumnos
        end
        puts ""
        puts "Mostrando alumnos entre 20 y 25 años"
        puts select_alumnos(20,25)
        puts ""
    when 7
        puts ""
        puts "Suma total de edades:"
        puts sumar_edades
        puts ""
    when 8
        def promedio_edades
            sumar_edades/$alumnos.count.to_i
        end
        puts ""
        puts "el promedio de edades es:"
        puts promedio_edades.to_s + " años"
        puts ""
    when 9
        def alumnos_genero
            $alumnos.group_by{|i| i[:genero]}
        end
        puts ""
        puts "Alumnos Hombres:"
        puts alumnos_genero["Masculino"]
        puts ""
        puts "Alumnos Mujeres:"
        puts alumnos_genero["Femenino"]
        puts ""
    end
end