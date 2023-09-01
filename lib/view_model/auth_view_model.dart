import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:mvvm_architecture/repositories/auth_repository.dart';
import 'package:mvvm_architecture/utils/routes/routes_names.dart';
import 'package:mvvm_architecture/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepository();

  bool _loading = false;
  bool get loading => _loading;

  bool _signUpLoading = false;
  bool get signUpLoading => _signUpLoading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  setSignUpLoading(bool value) {
    _signUpLoading = value;
    notifyListeners();
  }

  Future<void> loginApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.loginApi(data).then((value) {
      setLoading(false);
      Utils.flushBarErrorMessage("LogIn Successfull", context);
      Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString() + "!!!!!!!!!!");
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      if (kDebugMode) {
        print(error.toString() + "!!!!!");
      }
    });
  }

  Future<void> SignUpApi(dynamic data, BuildContext context) async {
    setSignUpLoading(true);
    _myRepo.SignUpApi(data).then((value) {
      setSignUpLoading(false);
      Utils.flushBarErrorMessage("SignUp Successfull", context);
      // Navigator.pushNamed(context, RoutesName.home);
      if (kDebugMode) {
        print(value.toString() + "!!!!!!!!!!");
      }
    }).onError((error, stackTrace) {
      setSignUpLoading(false);
      if (kDebugMode) {
        print(error.toString() + "!!!!!");
      }
    });
  }
}
