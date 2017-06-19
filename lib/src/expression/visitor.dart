// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library angular_ast.src.expression.visitor;

import 'package:analyzer/dart/ast/ast.dart';
import 'package:angular_ast/src/expression/ng_dart_ast.dart';
import 'package:analyzer/src/dart/ast/utilities.dart';
import 'package:analyzer/src/generated/java_core.dart';

abstract class AngularDartAstVisitor<R> extends AstVisitor<R> {
  R visitPipeOptionalArgumentList(PipeOptionalArgumentList node);
  R visitPipeInvocation(PipeInvocationExpression node);
}

/// A visitor used to write a source representation of a visited AST node (and
/// all of it's children) to a writer. This handles AngularDartAst nodes.
class NgToSourceVisitor extends ToSourceVisitor
    implements AngularDartAstVisitor<Object> {
  final PrintWriter _writer;

  factory NgToSourceVisitor() {
    final writer = new PrintStringWriter();
    return new NgToSourceVisitor._(writer);
  }

  NgToSourceVisitor._(this._writer) : super(_writer);

  @override
  Object visitPipeOptionalArgumentList(PipeOptionalArgumentList node) {
    _writer.print(node.toSource());
    return null;
  }

  @override
  Object visitPipeInvocation(PipeInvocationExpression node) {
    _writer.print(node.toSource());
    return null;
  }

  @override
  String toString() {
    return _writer.toString();
  }
}
