import 'file:///C:/Users/COMMAND_CENTER/AndroidStudioProjects/math_ninja/lib/enums/OperatorEnum.dart';
import 'package:math_ninja/constants/QuizConstants.dart';

extension StringExtensions on String {

    bool isValidAnswerInput() {
      return this.length <= MAX_ANSWER_LENGTH
          && !(this.length > 1 && this[0] == '0');
    }
}