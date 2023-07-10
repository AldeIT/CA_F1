all: exec

obj: src/telemetry.s src/main.c
	gcc -m32 -g -c src/telemetry.s -o obj/telemetry.o
	gcc -m32 -g -c src/main.c -o obj/main.o
exec: obj
	gcc -m32 -g obj/telemetry.o obj/main.o -o bin/telemetry

clean:
	rm -f obj/* bin/*
