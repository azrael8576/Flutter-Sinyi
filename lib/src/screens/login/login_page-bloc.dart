import 'package:fluttersinyi/src/bloc/bloc.dart';
import 'package:fluttersinyi/src/theme/style.dart';

class LoginPageBloc extends BaseBloc{

  bool _isVisible = true;
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