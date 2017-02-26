/* A Bison parser, made by GNU Bison 3.0.4.  */

/* Bison interface for Yacc-like parsers in C

   Copyright (C) 1984, 1989-1990, 2000-2015 Free Software Foundation, Inc.

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

#ifndef YY_YY_WISENT_TAB_HPP_INCLUDED
# define YY_YY_WISENT_TAB_HPP_INCLUDED
/* Debug traces.  */
#ifndef YYDEBUG
# define YYDEBUG 0
#endif
#if YYDEBUG
extern int yydebug;
#endif

/* Token type.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
  enum yytokentype
  {
    TOKEN_INTEGER = 258,
    TOKEN_DOUBLE = 259,
    TOKEN_IDENTIFIER = 260,
    TOKEN_TRUE = 261,
    TOKEN_FALSE = 262,
    TOKEN_STRING = 263,
    TOKEN_EQUALITY = 264,
    TOKEN_NOT_EQUALITY = 265,
    TOKEN_LESS_THAN = 266,
    TOKEN_LESS_THAN_EQUAL_TO = 267,
    TOKEN_GREATER_THAN = 268,
    TOKEN_GREATER_THAN_EQUAL_TO = 269,
    TOKEN_EQUAL = 270,
    TOKEN_LEFT_BRACKET = 271,
    TOKEN_RIGHT_BRACKET = 272,
    TOKEN_LEFT_BRACE = 273,
    TOKEN_RIGHT_BRACE = 274,
    TOKEN_COMMA = 275,
    TOKEN_DOT = 276,
    TOKEN_ADD = 277,
    TOKEN_MINUS = 278,
    TOKEN_MULTIPLY = 279,
    TOKEN_DIVIDE = 280,
    TOKEN_SEMICOLON = 281
  };
#endif

/* Value type.  */
#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED

union YYSTYPE
{
#line 20 "wisent.y" /* yacc.c:1909  */

  std::string *string;
  int token;
  double dval;

#line 87 "wisent.tab.hpp" /* yacc.c:1909  */
};

typedef union YYSTYPE YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define YYSTYPE_IS_DECLARED 1
#endif


extern YYSTYPE yylval;

int yyparse (void);

#endif /* !YY_YY_WISENT_TAB_HPP_INCLUDED  */
