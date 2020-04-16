;;; -*- Lisp -*-
;;;
;;; Cross-implementation Portability System

(defsystem port
    ;:source-pathname (translate-logical-pathname "clocc:src;port;")
    ;:source-extension "lisp"
    :components
    ((:file "ext")
     (:file "gray" :depends-on ("ext"))
     (:file "mop" :depends-on ("ext"))
     (:file "net" :depends-on ("ext" "sys"))
     (:file "path" :depends-on ("ext"))
     (:file "proc" :depends-on ("ext"))
     (:file "shell" :depends-on ("ext"))
     (:file "sys" :depends-on ("ext" "path"))))
