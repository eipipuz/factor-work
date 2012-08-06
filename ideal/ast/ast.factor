! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: kernel ;
IN: ideal.ast

TUPLE: ast-root expressions ;
TUPLE: ast-send target message args ;
TUPLE: ast-target identifier ;
TUPLE: ast-identifier name ;
TUPLE: ast-symbol symbol ;

TUPLE: ast-fixnum number ;
TUPLE: ast-number number ;
