// Copyright (c) 2016, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular_ast/src/expression/micro/ast.dart';
import 'package:angular_ast/src/expression/micro/parser.dart';

export 'package:angular_ast/src/expression/micro/ast.dart' show NgMicroAst;

final _isBind = new RegExp(r'\S+:');

/// Returns whether [expression] is a special Angular *-star expression.
///
/// This means it won't parse correctly with the standard expression parser, and
/// [parseMicroExpression] is needed to de-sugar the expression into its
/// multiple intents.
bool isMicroExpression(String expression) {
  return expression.startsWith('let') || expression.startsWith(_isBind);
}

/// Returns a de-sugared micro AST from [expression].
NgMicroAst parseMicroExpression(
  String directive,
  String expression,
  int expressionOffset, {
  String sourceUrl,
}) {
  return const NgMicroParser().parse(
    directive,
    expression,
    expressionOffset,
    sourceUrl: sourceUrl,
  );
}
