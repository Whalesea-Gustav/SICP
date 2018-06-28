(define (add-1 n)
   ((lambda (n)                    ; add-1
     (lambda (f)
         (lambda (x)
             (f ((n f) x))))))
          
          
              
              
(define zero                       ; zero
    (lambda (f)                    
     (lambda (x)
            x)))
            

(define one (add-1 zero))          ; one
<=>
(define one
     (lambda (f)
         (lambda (x)
               (f (f x)))))
               
(define two (add-1 one))           ; two
<=>
(define two
  (lambda (f)
    (lambda (x)
        (f (f (f x))))))
        
        
(define +                          ; church计数
    (lambda (m)
        (lambda (n)
            (lambda (f)
                (lambda (x)
                    (m f (n f x)))))))
                    
                    
 
