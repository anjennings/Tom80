     ORG  0100H
     ;; INIT PORT A
     MVI  A,0FH
     OUT  130
     ;; OUTPUT ON A
     MVI  A,00H
     OUT  128
     RET  