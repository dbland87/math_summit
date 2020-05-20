import 'package:math_summit/constants/quiz_constants.dart';
import 'package:math_summit/enums/operator.dart';

extension StringExtensions on String {

    bool isValidAnswerInput() {
      return this.length <= MAX_ANSWER_LENGTH
          && !(this.length > 1 && this[0] == '0');
    }

    Operator toOperator() {
      switch (this) {
        case "x":
          return Operator.MULTIPLY;
        case "÷":
          return Operator.DIVIDE;
        case "+":
          return Operator.ADD;
        case "-":
          return Operator.SUBTRACT;
        default:
          return null;
      }
    }
}