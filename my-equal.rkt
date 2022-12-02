#lang racket

; Intern wird vermutlich das gleiche
; gemacht wie in equal?, aber trotzdem
; eignet sich dieses Beispiel gut wie
; man einen Identifier unveraendert lassen kann


; Hier worueber wir nach der Vorlesung gesprochen haben.
; Das "HARTE" erzwingen von der Verwendung von y in einem Match-Ausdruck
(define my-equal?*
  (lambda (x y)
  (match y
    [`,y (eval `(match ,x [,y #t] [_ #f]))])))

; Hier eine elegantere Version, ohne Erzwingung,
; aber das beweist das Prinzip nicht
(define my-equal?
  (lambda (x y)
      (match `(,x ,y)
        [`(,x ,x) #t] [_ #f])))
