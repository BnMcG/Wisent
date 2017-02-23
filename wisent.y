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
}

// Define terminal symbols and associate each
// terminal symbol with a field from the
// union of types. Each terminal symbol
// represents a type
%token <string> TOKEN_IDENTIFIER TOKEN_DOUBLE TOKEN_TRUE TOKEN_FALSE
%token <token> TOKEN_INTEGER
%token <token> TOKEN_EQUALITY TOKEN_NOT_EQUALITY TOKEN_LESS_THAN TOKEN_LESS_THAN_EQUAL_TO TOKEN_GREATER_THAN TOKEN_GREATER_THAN_EQUAL_TO TOKEN_EQUAL
%token <token> TOKEN_LEFT_BRACKET TOKEN_RIGHT_BRACKET TOKEN_LEFT_BRACE TOKEN_RIGHT_BRACE TOKEN_COMMA TOKEN_DOT
%token <token> TOKEN_ADD TOKEN_MINUS TOKEN_MULTIPLY TOKEN_DIVIDE


// Grammar that Bison will parse. Template values
// that echo, for now...
%%
wisent:
  wisent TOKEN_INTEGER { cout << "Bison found an integer: " << $2 << endl; }
  | wisent TOKEN_DOUBLE { cout << "Bison found a double: " << $2 << endl; }
  | wisent TOKEN_IDENTIFIER { cout << "Bison found a string: " << $2 << endl; }
  | TOKEN_INTEGER { cout << "Bison found an integer: " << $1 << endl; }
  | TOKEN_DOUBLE { cout << "Bison found a double: " << $1 << endl; }
  | TOKEN_IDENTIFIER { cout << "Bison found a string: " << $1 << endl; }
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
