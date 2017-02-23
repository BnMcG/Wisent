%{
  #include <iostream>
  #include <string>
  using namespace std;
  #define TOKEN(t) (yylval.token = t)
  #define YY_DECL extern "C" int yylex()
  extern "C" int yywrap() { }

  #include "wisent.tab.hpp" // Token types from Bison
%}
%%
[ \t\n] ;
[A-z]* yylval.string = new std::string(yytext, yyleng); return TOKEN_IDENTIFIER;
[0-9]+\.[0-9]*  yylval.string = new std::string(yytext, yyleng); return TOKEN_DOUBLE;
[0-9]+  yylval.string = new std::string(yytext, yyleng); return TOKEN_INTEGER;
"true"  yylval.string = new std::string(yytext, yyleng); return TOKEN_TRUE;
"false" yylval.string = new std::string(yytext, yyleng); return TOKEN_FALSE;
"=" return TOKEN(TOKEN_EQUAL);
"=="  return TOKEN(TOKEN_EQUALITY);
"!="  return TOKEN(TOKEN_NOT_EQUALITY);
"<" return TOKEN(TOKEN_LESS_THAN);
"<="  return TOKEN(TOKEN_LESS_THAN_EQUAL_TO);
">" return TOKEN(TOKEN_GREATER_THAN);
">="  return TOKEN(TOKEN_GREATER_THAN_EQUAL_TO);
"(" return TOKEN(TOKEN_LEFT_BRACKET);
")" return TOKEN(TOKEN_RIGHT_BRACKET);
"-> {"  return TOKEN(TOKEN_LEFT_BRACE);
"<- }"  return TOKEN(TOKEN_RIGHT_BRACE);
"," return TOKEN(TOKEN_COMMA);
"." return TOKEN(TOKEN_DOT);
"+" return TOKEN(TOKEN_ADD);
"/" return TOKEN(TOKEN_DIVIDE);
"-" return TOKEN(TOKEN_MINUS);
"*" return TOKEN(TOKEN_MULTIPLY);
. printf("Oh darn it! An unrecognised token! I would've gotten away for it if it wasn't for those meddling characters!"); yyterminate();
%%
