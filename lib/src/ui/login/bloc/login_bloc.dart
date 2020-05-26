import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:fluttersinyi/main.dart';
import 'package:fluttersinyi/src/common/globals.dart';

class LoginBloc extends BlocBase {
  bool _isVisible = false;
  get isVisible => _isVisible;
  set isVisible(value) {
    _isVisible = value;
    notifyListeners();
  }
  bool _isValid = false;
  get isValid => _isValid;
  void isValidEmail(String input) {
    if (input == Global.validEmail.first) {
      _isValid = true;
    } else {
      _isValid = false;
    }
    notifyListeners();
  }
}