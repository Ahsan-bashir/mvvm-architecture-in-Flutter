import 'package:flutter/material.dart';
import 'package:mvvm_architecture/model/user_model.dart';
import 'package:mvvm_architecture/utils/routes/routes_names.dart';
import 'package:mvvm_architecture/view_model/user_view_model.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final userPreferences=Provider.of<UserViewModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            InkWell(
              onTap: (){
userPreferences.remove().then((value) {
  Navigator.pushNamed(context, RoutesName.login);
});
              },
              child: Text('Log Out'),
            )
          ],
        ),
      ),
    );
  }
}
