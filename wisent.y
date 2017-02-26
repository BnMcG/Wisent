%{
  #include "llvm/ADT/APFloat.h"
  #include "llvm/ADT/STLExtras.h"
  #include "llvm/IR/BasicBlock.h"
  #include "llvm/IR/Constants.h"
  #include "llvm/IR/DerivedTypes.h"
  #include "llvm/IR/Function.h"
  #include "llvm/IR/IRBuilder.h"
  #include "llvm/IR/LLVMContext.h"
  #include "llvm/IR/Module.h"
  #include "llvm/IR/Type.h"
  #include "llvm/IR/Constant.h"
  #include "llvm/IR/Verifier.h"
  #include "ast.hpp"
  #include <iostream>

  using namespace llvm;

  static LLVMContext TheContext;
  static IRBuilder<> Builder(TheContext);
  static std::unique_ptr<Module> TheModule;
  static std::map<std::string, Value *> NamedValues;

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

%type <dval> expression
%left TOKEN_ADD
%%

program:
  block
  | program block;

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
  | expression TOKEN_SEMICOLON { std::cout << "Statement evaluated: " << $1 << std::endl; }
  | TOKEN_LEFT_BRACE expression TOKEN_SEMICOLON TOKEN_RIGHT_BRACE { std::cout << "Statement evaluated: " << $2 << std::endl; }
;

expression:
  TOKEN_INTEGER { $$ = $1; new NumericLiteralAST($$); }
  | TOKEN_DOUBLE { $$ = $1; new NumericLiteralAST($$); }
  | expression TOKEN_ADD expression { $$ = $1 + $3; }
  | TOKEN_LEFT_BRACKET expression TOKEN_RIGHT_BRACKET { $$ = $2; }
;

variables:
  TOKEN_IDENTIFIER TOKEN_EQUAL TOKEN_INTEGER {new VariableDeclarationAST(NamedValues, *$1, $3); }
  | TOKEN_IDENTIFIER TOKEN_EQUAL TOKEN_DOUBLE { new VariableDeclarationAST(NamedValues, *$1, $3); }
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
}

void yyerror(const char *s) {
  std::cout << "Oh noes! A wild parsing error has appeared: " << s << std::endl;
  // Cut our losses and exit after the error
  exit(-1);
}
