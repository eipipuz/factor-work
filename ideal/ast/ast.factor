! Copyright (C) 2012 Guillermo Alcantara
! See http://factorcode.org/license.txt for BSD license.
USING: kernel ;
IN: ideal.ast

TUPLE: ast-root statements ;
TUPLE: ast-send target message args ;
TUPLE: ast-target name ;
TUPLE: ast-symbol symbol ;
