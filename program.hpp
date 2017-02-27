#pragma once
#include <map>
#include <string>

class Program {
  std::map<std::string, double> symbolTable;
  std::string mainFunctionBody;

public:
  Program();
  void addToSymoblTable(std::string identifier, double val);
  std::string generateCppSource();
  void compileCppSource();
};

class ASTNode {
public:
  virtual std::string generateCode() = 0;
  virtual double evaluate() = 0;
  virtual ~ASTNode() {};
};

class NumericASTNode : public ASTNode {
  double value;

public:
  NumericASTNode(double val);
  double evaluate();
  std::string generateCode();
};

class ExpressionASTNode : public ASTNode {
protected:
  NumericASTNode* left;
  NumericASTNode* right;

public:
  ExpressionASTNode(NumericASTNode* l, NumericASTNode* r);
  virtual std::string generateCode() = 0;
  virtual double evaluate() = 0;
};

class AdditionExpressionASTNode : public ExpressionASTNode {
  using ExpressionASTNode::ExpressionASTNode;
public:
  virtual double evaluate();
  std::string generateCode();
};

class SubtractionExpressionASTNode : public ExpressionASTNode {
  using ExpressionASTNode::ExpressionASTNode;
public:
  virtual double evaluate();
  std::string generateCode();
};

class MultiplicationExpressionASTNode : public ExpressionASTNode {
  using ExpressionASTNode::ExpressionASTNode;
public:
  virtual double evaluate();
  std::string generateCode();
};

class DivisionExpressionASTNode : public ExpressionASTNode {
  using ExpressionASTNode::ExpressionASTNode;
public:
  virtual double evaluate();
  std::string generateCode();
};
