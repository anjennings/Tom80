     ORG  0100H
     ;; INIT PORT A AS CONTROL
     MVI  A,CFH
     OUT  130  ;CONTROL
     MVI  A,00H
     OUT  130  ;ALL OUT
;     MVI  A,07H
;     OUT  130  ;INT
     ;; OUTPUT ON A
     MVI  A,FFH
     OUT  128
     RET  