(defpackage #:emacs-if
  (:use #:cl)
  (:shadow #:if)
  (:export #:if #:while))

(in-package #:emacs-if)

(defmacro emacs-if:if (test then &body else)
  "Emacs like IF statement that allows multiple ELSE clauses"
  (cl:if (null (rest else))
         `(cl:if ,test ,then ,@else)
         `(cl:cond (,test ,then)
                   (t ,@else))))

(defmacro emacs-if:while (test &body body)
  "Emacs like WHILE loop statement. Just like other CL loops the body
is wrapped into the BLOCK named NIL and a TAGBODY form"
  (let ((start (gensym))
        (end (gensym)))
    `(block nil
       (tagbody
          ,start
          (unless ,test (go ,end))
          ,@body
          (go ,start)
          ,end))))
