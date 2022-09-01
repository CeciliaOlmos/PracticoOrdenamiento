      ******************************************************************
      * Author:
      * Date:
      * Purpose:
      * Tectonics: cobc
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. YOUR-PROGRAM-NAME.
       ENVIRONMENT DIVISION.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
           SELECT SOCIOS ASSIGN TO "socios.dat".
           SELECT ARCH-SORT ASSIGN TO "SORTWORK".
           SELECT SOCIOS-ORD ASSIGN TO "socios-act.dat".

       DATA DIVISION.
       FILE SECTION.
       FD  SOCIOS.
       01  soc-reg.
           03 soc-cod pic 9999.
           03 soc-nom pic x(20).
           03 soc-saldo pic s9(8)v99.
       SD  ARCH-SORT.
       01  srt-reg.
           03 srt-cod pic 9999.
           03 srt-nom pic x(20).
           03 srt-saldo pic s9(8)v99.
           03 srt-nom-filial pic x(15).
       FD  SOCIOS-ORD.
       01  act-reg pic x(49).


       WORKING-STORAGE SECTION.
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.

      *    CASO 1 SORT
            SORT ARCH-SORT ASCENDING KEY srt-nom
               USING SOCIOS GIVING SOCIOS-ORD.

      *    CASO 2 SORT
            SORT ARCH-SORT ASCENDING KEY srt-nom
               USING SOCIOS OUTPUT PROCEDURE PROCESO-SALIDA.
            STOP RUN.

      *ACA YO PUEDO REALIZAR LOS PROCEDIMIENTOS QUE QUIERA EN EL ARCH SORT
      *NO TENGO QUE ABRIR EL ARCHIVO DE SORT NI CERRAR
       PROCESO-SALIDA.
      *LA INSTRUCCION QUE LEE DEL SORT ES: RETURN
           RETURN ARCH-SORT AT END
      *EN ESTA PARTE VA TODO EL PROCEO QUE NECESITES HACER

      *    CASO 4 SORT

           SORT ARCH-SORT ASCENDING KEY srt-nom
               INPUT PROCEDURE PROCESO-ENTRADA
               OUTPUT PROCEDURE PROCESO-SALIDA.
      *NECISITO GRABAR EN EL SORT: PARA GRABAR RELEASE
       PROCESO-ENTRADA.
           RELEASE srt-reg.

       END PROGRAM YOUR-PROGRAM-NAME.
