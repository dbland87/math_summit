
import 'package:math_summit/enums/operator.dart';

extension OperatorExtensions on Operator {

  static const displaySymbols = {
    Operator.ADD: "+",
    Operator.SUBTRACT: "-",
    Operator.MULTIPLY: 'x',
    Operator.DIVIDE: '÷'
  };

  String get displaySymbol => displaySymbols[this];
}