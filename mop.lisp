;;;; Meta-Object Protocol
;;;
;;; Copyright (C) 2006-2007, 2013 by Sam Steingold
;;; This is open-source software.
;;; GNU Lesser General Public License (LGPL) is applicable:
;;; No warranty; you may copy/modify/redistribute under the same
;;; conditions with the source code.
;;; See <URL:http://www.gnu.org/copyleft/lesser.html>
;;; for details and the precise copyright document.

(eval-when (:compile-toplevel :load-toplevel :execute)
  #-(or (and allegro (version>= 6))
        (and clisp mop)
        cmu lucid lispworks sbcl scl)
  (error 'not-implemented :proc "Meta-Object Protocol")
  ;;(require :port-ext (translate-logical-pathname "clocc:src;port;ext"))
  )

(in-package
  #+(and allegro (version>= 6)) :clos
  #+(and clisp mop) :clos
  #+cmu :pcl
  #+lucid :clos
  #+lispworks :hcl
  #+sbcl :sb-mop
  #+scl :clos)

(eval-when (:compile-toplevel :load-toplevel :execute)
(let ((cl-user::mop-symbols
       '(METAOBJECT
         ;; + classes:
         ;; class names
         STANDARD-READER-METHOD STANDARD-WRITER-METHOD FORWARD-REFERENCED-CLASS
         ;; functions
         ENSURE-CLASS
         ;; generic functions
         CLASS-DIRECT-SUPERCLASSES CLASS-PRECEDENCE-LIST CLASS-DIRECT-SLOTS
         CLASS-SLOTS CLASS-DIRECT-DEFAULT-INITARGS CLASS-DEFAULT-INITARGS
         ;; customizable generic functions
         ;; for class creation:
         ENSURE-CLASS-USING-CLASS VALIDATE-SUPERCLASS
         COMPUTE-DIRECT-SLOT-DEFINITION-INITARGS
         COMPUTE-CLASS-PRECEDENCE-LIST COMPUTE-EFFECTIVE-SLOT-DEFINITION
         COMPUTE-EFFECTIVE-SLOT-DEFINITION-INITARGS COMPUTE-SLOTS
         COMPUTE-DEFAULT-INITARGS READER-METHOD-CLASS WRITER-METHOD-CLASS
         ;; for notification about subclasses:
         CLASS-DIRECT-SUBCLASSES ADD-DIRECT-SUBCLASS REMOVE-DIRECT-SUBCLASS
         ;; + generic Functions:
         ;; classes
         FUNCALLABLE-STANDARD-CLASS FUNCALLABLE-STANDARD-OBJECT
         ;; functions
         ENSURE-GENERIC-FUNCTION SET-FUNCALLABLE-INSTANCE-FUNCTION
         COMPUTE-EFFECTIVE-METHOD-AS-FUNCTION
         ;; generic functions
         GENERIC-FUNCTION-NAME GENERIC-FUNCTION-METHODS
         GENERIC-FUNCTION-METHOD-CLASS GENERIC-FUNCTION-LAMBDA-LIST
         GENERIC-FUNCTION-METHOD-COMBINATION
         GENERIC-FUNCTION-ARGUMENT-PRECEDENCE-ORDER
         GENERIC-FUNCTION-DECLARATIONS
         ;; customizable generic functions
         ENSURE-GENERIC-FUNCTION-USING-CLASS COMPUTE-DISCRIMINATING-FUNCTION
         COMPUTE-APPLICABLE-METHODS COMPUTE-APPLICABLE-METHODS-USING-CLASSES
         ;; + Methods:
         ;; generic functions
         METHOD-FUNCTION METHOD-GENERIC-FUNCTION METHOD-LAMBDA-LIST
         METHOD-SPECIALIZERS ACCESSOR-METHOD-SLOT-DEFINITION
         ;; functions
         EXTRACT-LAMBDA-LIST EXTRACT-SPECIALIZER-NAMES
         ;; + Method-Combinations:
         ;; generic function
         FIND-METHOD-COMBINATION
         ;; customizable generic function
         COMPUTE-EFFECTIVE-METHOD
         ;; + Slot-Definitions:
         ;; classes
         SLOT-DEFINITION STANDARD-SLOT-DEFINITION
         DIRECT-SLOT-DEFINITION STANDARD-DIRECT-SLOT-DEFINITION
         EFFECTIVE-SLOT-DEFINITION STANDARD-EFFECTIVE-SLOT-DEFINITION
         ;; generic functions
         SLOT-DEFINITION-NAME SLOT-DEFINITION-INITFORM
         SLOT-DEFINITION-INITFUNCTION SLOT-DEFINITION-TYPE
         SLOT-DEFINITION-ALLOCATION SLOT-DEFINITION-INITARGS
         SLOT-DEFINITION-READERS SLOT-DEFINITION-WRITERS
         SLOT-DEFINITION-LOCATION
         ;; customizable generic functions
         DIRECT-SLOT-DEFINITION-CLASS EFFECTIVE-SLOT-DEFINITION-CLASS
         ;; + Specializers:
         ;; classes
         SPECIALIZER EQL-SPECIALIZER
         ;; generic functions
         SPECIALIZER-DIRECT-GENERIC-FUNCTIONS SPECIALIZER-DIRECT-METHODS
         ;; functions
         EQL-SPECIALIZER-OBJECT INTERN-EQL-SPECIALIZER
         ;; customizable generic functions
         ADD-DIRECT-METHOD REMOVE-DIRECT-METHOD
         ;; + Slot access:
         ;; generic functions
         SLOT-VALUE-USING-CLASS
         SLOT-BOUNDP-USING-CLASS SLOT-MAKUNBOUND-USING-CLASS
         ;; functions
         STANDARD-INSTANCE-ACCESS FUNCALLABLE-STANDARD-INSTANCE-ACCESS
         ;; + Dependent object notification:
         ;; functions
         MAP-DEPENDENTS
         ;; customizable generic functions
         ADD-DEPENDENT REMOVE-DEPENDENT UPDATE-DEPENDENT)))
  (import cl-user::mop-symbols :port)
  (export cl-user::mop-symbols :port))
)

(in-package :common-lisp-user)

(eval-when (:compile-toplevel :execute :load-toplevel)
  (defstruct s a)
  (unless (port:slot-definition-initargs (car (port:class-direct-slots (find-class 's))))
    (pushnew :no-defstruct-mop *features*)
    '(pushnew :no-defstruct-mop *features*)))

(provide :port-mop)

;;; file mop.lisp ends here
