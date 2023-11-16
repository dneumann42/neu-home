#lang racket

(require racket/gui)

(struct %table-cell (x y prod) #:transparent)
(struct %question (prompt answer))

(define (cell->question c)
  (%question
   (format "~a x ~a" (%table-cell-x c) (%table-cell-y c))
   (%table-cell-prod c)))

(define (create-table x y)
  (for/list ([i (in-range 1 (+ 1 x))])
    (for/list ([j (in-range 1 (+ 1 y))])
      (%table-cell i j (* i j)))))

(define (get-table-size tbl)
  (list (length tbl) (length (car tbl))))

(define (table-count tbl)
  (define size (get-table-size tbl))
  (* (first size) (second size)))

(define (table-list tbl) (flatten tbl))

(define teacher%
  (class object%
    (super-new)
    (field
     [previous-questions (list)]
     [wrong-answers (list)]
     [questions (list)])
    (define/public (load qs)
      (set! previous-questions (list))
      (set! wrong-answers (list))
      (set! questions qs))
    (define/public (next-question)
      (let*
          ([idx (random 0 (length questions))]
           [itm (list-ref questions  idx)])
        (set! questions (remove itm questions))
        (set! previous-questions (cons itm previous-questions))
        itm))
    (define/public (number-questions-left)
      (length questions))
    (define/public (number-previous-questions)
      (length previous-questions))
    (define/public (status)
      (format "~a / ~a"
              (number-questions-left)
              (number-previous-questions)))))

(define (start)
  (define teacher (new teacher%))
  (send teacher load
        (map cell->question (table-list (create-table 12 12))))

  (define window
    (new frame%
         [width 640]
         [height 640]
         [label "Multable"]))
  
  (define main-panel (new vertical-panel%
                          [parent window]
                          [alignment '(center center)]))
    
  (define prompt-panel (new vertical-panel% [parent main-panel] [stretchable-height #f] [stretchable-width #f]))
  
  (define prompt-status
    (new message%
         [parent prompt-panel]
         [label (send teacher status)]))
  
  (define actions-panel (new horizontal-panel% [parent main-panel] [stretchable-width #f] [stretchable-height #f]))
  
  (define (update-prompt)
    (send prompt-status set-label (send teacher status)))
   
  (define current-question #f)

  (define (next-question a b)
    (set! current-question (send teacher next-question))
    (update-prompt))
 
  (new button%
       [parent actions-panel]
       [label "Submit"])

  (new button%
       [parent actions-panel]
       [label "Next Question"]
       [callback next-question])
  
  (send window show #t)
  window)
