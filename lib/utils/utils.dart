import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';

class Utils{

  static void fieldFocusChanged(BuildContext context,
      FocusNode current,
      FocusNode nextFocus
      ){
    current.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

 static toastMessage(String message){
  Fluttertoast.showToast(msg: message);
}

static void flushBarErrorMessage(String message,BuildContext context ){
   showFlushbar(context: context, flushbar: Flushbar(
    message:message,
     forwardAnimationCurve: Curves.decelerate,
     reverseAnimationCurve: Curves.easeInOut,
     flushbarPosition: FlushbarPosition.TOP,
     margin: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
     padding: const EdgeInsets.all(15),
     backgroundColor: Colors.orange,
     duration: const Duration(seconds: 3  ),
     borderRadius: BorderRadius.circular(10),
     messageColor: Colors.black,
    positionOffset: 20,
    icon: const Icon(Icons.error,size: 25,color: Colors.white,),

   )..show(context)
    );
}


static snackBar(String message,BuildContext context){
  return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
       backgroundColor: Colors.red,
       content: Text(message),
      )
  );
}
}