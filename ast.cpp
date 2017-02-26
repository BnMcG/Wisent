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

NumericLiteralAST::NumericLiteralAST(double v) {
  std::cout << "Numeric value " << v << std::endl;
}

Value *NumericLiteralAST::codegen(LLVMContext context) {
  return ConstantFP::get(context, APFloat(value));
}

VariableDeclarationAST::VariableDeclarationAST(std::map<std::string, double> symbolTable, std::string identifier, double val) {
  variableIdentifier = identifier;
  table = symbolTable;
  symbolTable[identifier] = ConstantFP::get(Type::TypeID::FloatTyID, APFloat(val));;
}

Value *VariableDeclarationAST::codegen(LLVMContext context) {
  return table[variableIdentifier];
}
