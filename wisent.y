%{
  #include <iostream>
  #include <stdio.h>
  #include <vector>
  #include <map>
  #include <string>
  #include <sstream>
  #include <fstream>

  // Flex components that Bison needs to know about
  // "I gots to know!"
  extern "C" int yylex();
  extern "C" int yyparse();
  extern "C" FILE *yyin;

  void yyerror(const char *s);

  static std::vector<double> results;
  static std::map<std::string, double> symbols;

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

%type <dval> expression
%left TOKEN_MINUS TOKEN_ADD
%left TOKEN_MULTIPLY TOKEN_DIVIDE
%left NEG
%%

program:
  block
  | program block
  ;

block:
  TOKEN_IDENTIFIER
  | TOKEN_IDENTIFIER TOKEN_LEFT_BRACE input TOKEN_RIGHT_BRACE
  ;

input:
  | input line
;

line:
  TOKEN_SEMICOLON
  | variables TOKEN_SEMICOLON;
  | expression TOKEN_SEMICOLON { }
  | TOKEN_LEFT_BRACE expression TOKEN_SEMICOLON TOKEN_RIGHT_BRACE { }
;

expression:
  TOKEN_INTEGER { $$ = $1; }
  | TOKEN_IDENTIFIER { $$ = symbols[*$1]; }
  | TOKEN_DOUBLE { $$ = $1; }
  | TOKEN_MINUS expression %prec NEG { $$ = -$2; }
  | expression TOKEN_ADD expression { $$ = $1 + $3; results.push_back($1 + $3); }
  | expression TOKEN_MINUS expression { $$ = $1 - $3; results.push_back($1 - $3); }
  | expression TOKEN_MULTIPLY expression { $$ = $1 * $3; results.push_back($1 * $3); }
  | expression TOKEN_DIVIDE expression { $$ = $1 / $3; results.push_back($1 / $3); }
  | TOKEN_LEFT_BRACKET expression TOKEN_RIGHT_BRACKET { $$ = $2; }
;

variables:
  TOKEN_IDENTIFIER TOKEN_EQUAL expression { symbols[*$1] = $3; }
;
%%

int main(int, char**) {

  // Load a file
  FILE *sourceCode = fopen("source.w", "r");
  if(!sourceCode) {
    std::cout << "Cannot read source file! D'oh!";
    return -1;
  }

  yyin = sourceCode;

  // Continue parsing until end of input
  do {
    yyparse();
  } while(!feof(yyin));

  std::cout << "C++ Output (out.cpp)" << std::endl << std::endl;
  std::string cpp = "#include <iostream>\n\nint main() {\n\n";
  for(double r : results) {
    std::stringstream stream;
    stream << "std::cout <<  " <<  r << " << std::endl; " << std::endl;
    cpp += stream.str();
  }

  cpp += std::string("}");

  std::cout << cpp << std::endl;

  std::ofstream out("out.cpp");
  out << cpp;
  out.close();
}

void yyerror(const char *s) {
  std::cout << "Oh noes! A wild parsing error has appeared: " << s << std::endl;
  // Cut our losses and exit after the error
  exit(-1);
}
