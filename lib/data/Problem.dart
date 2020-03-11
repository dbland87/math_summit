import 'package:math_ninja/constants/OperatorEnum.dart';

class Problem {
  int _first;
  int _second;
  OperatorEnum _operator;
  int _response = -1;

  Problem(int first, int second, OperatorEnum operator) {
    this._first = first;
    this._second = second;
    this._operator = operator;
  }

  int answer() {
    switch (_operator) {
      case OperatorEnum.MULTIPLY:
        return _first * _second;
        break;
      case OperatorEnum.DIVIDE:
        return _first ~/ _second;
        break;
      case OperatorEnum.ADD:
        return _first + _second;
        break;
      case OperatorEnum.SUBTRACT:
        return _first - _second;
        break;
    }
    throw new Exception("Error computing answer for: $_first $_second $_operator");
  }

  bool isCorrect() {
    return _response == answer();
  }

  bool isComplete() {
    return _response != -1;
  }

  void setResponse(int response) {
    this._response = response;
  }
}
