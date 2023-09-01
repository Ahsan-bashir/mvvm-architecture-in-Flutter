import 'package:flutter/material.dart';
import 'package:mvvm_architecture/resources/components/round_button.dart';
import 'package:mvvm_architecture/utils/routes/routes_names.dart';
import 'package:mvvm_architecture/utils/utils.dart';
import 'package:mvvm_architecture/view_model/auth_view_model.dart';
 import 'package:provider/provider.dart';
class LogInView extends StatefulWidget {
  const LogInView({Key? key}) : super(key: key);

  @override
  State<LogInView> createState() => _LogInViewState();
}

class _LogInViewState extends State<LogInView> {
 final TextEditingController _emailController=TextEditingController();
 final TextEditingController _passwordController=TextEditingController();

    FocusNode emailFocusNode=FocusNode();
  FocusNode passwordFocusNode=FocusNode();

  ValueNotifier<bool> obsecurePassword=ValueNotifier<bool>(true);
@override void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }
  @override
  Widget build(BuildContext context) {
  final authViewModel=Provider.of<AuthViewModel>(context);
    final height=MediaQuery.of(context).size.height*1;
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Login Screen')),
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              decoration: const InputDecoration(
                hintText: 'Email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChanged(context, emailFocusNode, passwordFocusNode);
              },
            ),
            ValueListenableBuilder(
              valueListenable: obsecurePassword,
              builder: (context, value, child) {
                return TextFormField(
                  controller: _passwordController,
                  focusNode: passwordFocusNode,
                  obscureText: obsecurePassword.value,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                    hintText: 'Password',
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.lock_open_outlined),
                    suffixIcon: InkWell(
                      onTap: () {
                        obsecurePassword.value = !obsecurePassword.value;
                      },
                      child: Icon(obsecurePassword.value
                          ? Icons.visibility_off_outlined
                          : Icons.visibility),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height*.085),
            RoundButton(
              title: 'LogIn',
              loading: authViewModel.loading,
              onPress: () {
                if (_emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please Enter Email", context);
                } else if (_passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage("Please Enter password", context);
                } else if (_passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      "Please Enter Atleast 6 Digit Password", context);
                } else {
                  Map data={
                    'email':_emailController.text.toString(),
                    'password':_passwordController.text.toString()
                  };
                  authViewModel.loginApi(data,context);
                  print('API Hit');
                }
              },
            ),
            SizedBox(height: height*.085),
            InkWell(
                onTap: (){
                  Navigator.pushNamed(context,RoutesName.signup);
                },
                child: Text('Don\'t have an account? SignUp'))
          ],
        )

      )
    );
  }
}
