test/echo-server: test/echo-server.c ol.a
	$(CC) -o test/echo-server test/echo-server.c ol.a -lm

ol.a: ol-unix.o ev/ev.o
	ar rcs ol.a ol-unix.o ev/ev.o

ol-unix.o: ol-unix.c ol.h ol-unix.h
	$(CC) -c ol-unix.c -o ol-unix.o -lm

ev/ev.o: ev/config.h ev/ev.c
	$(MAKE) -C ev

ev/config.h:
	cd ev && ./configure

