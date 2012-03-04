## Description

Emacs-If is a small package that provides Emacs-like IF and WHILE
statements for Common Lisp.

## Recommended Usage:

    (defpackage :my-package
      (:use :cl)
      (:shadowing-import-from :emacs-if :if :while))

    (in-package :my-package)

    (defun test ()
      (if (oddp (random 100)) (print 'one)
        (print 'two)
        (print 'three))
      (values))
        
        


