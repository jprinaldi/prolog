perro(juan).
gato(pedro).

tiene_mascota(Persona) :- perro(Persona); gato(Persona).

ama_animales(Persona) :- tiene_mascota(Persona).

no_mata_animales(Persona) :- ama_animales(Persona).

mato_a_iris(juan) :- mata_animales(juan).
mato_a_iris(pedro) :- mata_animales(pedro).
mato_a_iris(maria) :- mata_animales(maria).

start :-	mato_a_iris(Persona),
			write('La persona que mat? a Iris es: '),
			write(Persona),
			nl.