import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:mvvm_architecture/data/network/NetworkApiServices.dart';
import 'package:mvvm_architecture/resources/app_url.dart';

class AuthRepository{
  final BaseApiServices _apiServices=NetworkApiServices();

  Future<dynamic> loginApi(dynamic data )async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.loginEndPoint, data);
      return response;
    }catch(e){
throw e;
    }
  }


  Future<dynamic>SignUpApi(dynamic data )async{
    try{
      dynamic response=await _apiServices.getPostApiResponse(AppUrl.registerApiEndPoint, data);
      return response;
    }catch(e){
      throw e;
    }
  }


}