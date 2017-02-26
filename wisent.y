%{
  #include <cstdio>
  #include <iostream>
  using namespace std;

  // Flex components that Bison needs to know about
  // "I gots to know!"
  extern "C" int yylex();
  extern "C" int yyparse();
  extern "C" FILE *yyin;

  void yyerror(const char *s);

%}

// Bison asks Flex for next token, Flex returns
// an object of type "yystype". Create a union
// to define different types that could be held
// by yystype.
%union {
  std::string *string;
  int token;
  double dval;
}

// Define terminal symbols and associate each
// terminal symbol with a field from the
// union of types. Each terminal symbol
// represents a type

%token <dval> TOKEN_INTEGER TOKEN_DOUBLE
%token <string> TOKEN_IDENTIFIER TOKEN_TRUE TOKEN_FALSE TOKEN_STRING
%token <token> TOKEN_EQUALITY TOKEN_NOT_EQUALITY TOKEN_LESS_THAN TOKEN_LESS_THAN_EQUAL_TO TOKEN_GREATER_THAN TOKEN_GREATER_THAN_EQUAL_TO TOKEN_EQUAL
%token <token> TOKEN_LEFT_BRACKET TOKEN_RIGHT_BRACKET TOKEN_LEFT_BRACE TOKEN_RIGHT_BRACE TOKEN_COMMA TOKEN_DOT
%token <token> TOKEN_ADD TOKEN_MINUS TOKEN_MULTIPLY TOKEN_DIVIDE TOKEN_SEMICOLON

%type <dval> types

%%

input:

  | input line
;

line:
  TOKEN_SEMICOLON
  | types TOKEN_SEMICOLON { cout << "Statement evaluated: " << $1 << endl; }
;

types:
  TOKEN_INTEGER { $$ = $1; }
  | TOKEN_DOUBLE { $$ = $1; }
  | types TOKEN_INTEGER { $$ = $1; }
  | types TOKEN_DOUBLE { $$ = $1; }
  | types TOKEN_ADD types { $$ = $1 + $3; }
  ;
%%

int main(int, char**) {

  // Load a file
  FILE *sourceCode = fopen("source.w", "r");
  if(!sourceCode) {
    cout << "Cannot read source file! D'oh!";
    return -1;
  }

  yyin = sourceCode;

  // Continue parsing until end of input
  do {
    yyparse();
  } while(!feof(yyin));
}

void yyerror(const char *s) {
  cout << "Oh noes! A wild parsing error has appeared: " << s << endl;
  // Cut our losses and exit after the error
  exit(-1);
}
