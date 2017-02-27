#include "program.hpp"
#include <sstream>

Program::Program() {
  // Set main function body to be an empty string
  mainFunctionBody = "";
}

NumericASTNode::NumericASTNode(double v) {
  value = v;
}

double NumericASTNode::evaluate() {
  return value;
}

std::string NumericASTNode::generateCode() {
  std::ostringstream stringStream;
  stringStream << value;
  return stringStream.str();
}

ExpressionASTNode::ExpressionASTNode(NumericASTNode* l, NumericASTNode* r) {
  left = l;
  right = r;
}

double AdditionExpressionASTNode::evaluate() {
  return left->evaluate() + right->evaluate();
}

std::string AdditionExpressionASTNode::generateCode() {
  std::ostringstream stringStream;
  stringStream << left->evaluate();
  stringStream << "+";
  stringStream << right->evaluate();

  return stringStream.str();
}

double SubtractionExpressionASTNode::evaluate() {
  return left->evaluate() - right->evaluate();
}

std::string SubtractionExpressionASTNode::generateCode() {
  std::ostringstream stringStream;
  stringStream << left->evaluate();
  stringStream << "-";
  stringStream << right->evaluate();

  return stringStream.str();
}

double DivisionExpressionASTNode::evaluate() {
  return left->evaluate() / right->evaluate();
}

std::string DivisionExpressionASTNode::generateCode() {
  std::ostringstream stringStream;
  stringStream << left->evaluate();
  stringStream << "/";
  stringStream << right->evaluate();

  return stringStream.str();
}

double MultiplicationExpressionASTNode::evaluate() {
  return left->evaluate() * right->evaluate();
}

std::string MultiplicationExpressionASTNode::generateCode() {
  std::ostringstream stringStream;
  stringStream << left->evaluate();
  stringStream << "*";
  stringStream << right->evaluate();

  return stringStream.str();
}
