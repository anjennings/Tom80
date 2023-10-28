     ORG  0100H
     ;; INIT PORT A AS CONTROL
     MVI  A,CFH
     OUT  130
     MVI  A,00H
     OUT  130
     ;; OUTPUT ON A
     MVI  A,0FH
     OUT  128
     RET  