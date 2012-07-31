! Copyright (C) 2012 Guillermo Alcantara.
! See http://factorcode.org/license.txt for BSD license.
USING: help.markup help.syntax ;
IN: ideal

HELP: parse-ideal
{ $values
  { "string" "a string" }
  { "ast" "a Ideal language abstract syntax tree" }
}
{ $description
  "Parse the input string using the Ideal language parser."
  "Throws an error if the string does not contain valid Ideal."
  "Returns the abstract syntax tree if successful."
} ;

