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
#include <iostream>


using namespace llvm;

class AST {
public:
  virtual ~AST() {}
  virtual Value *codegen(LLVMContext context) = 0;
};

class NumericLiteralAST : public AST {
  double value;

public:
  NumericLiteralAST(double v);
  Value *codegen(LLVMContext context) override;
};

class VariableDeclarationAST : public AST {
  std::string variableIdentifier;
  std::map<std::string, Value*> table;

public:
  VariableDeclarationAST(std::map<std::string, double> symbolTable, std::string identifier, double val);
  Value *codegen(LLVMContext context) override;
};
