import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_summit/lib/enums/OperatorEnum.dart';

extension OperatorsExtensions on Operators {

    static const displaySymbols = {
      Operators.ADD: "+",
      Operators.SUBTRACT: "-",
      Operators.MULTIPLY: 'x',
      Operators.DIVIDE: '÷'
    };

    String get displaySymbol => displaySymbols[this];
}