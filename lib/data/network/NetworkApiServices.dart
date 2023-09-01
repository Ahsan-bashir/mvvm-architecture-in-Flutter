import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:mvvm_architecture/data/app_exceptions.dart';
import 'package:mvvm_architecture/data/network/BaseApiServices.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic responseJson;
    try {
      final response =
          await http.get(Uri.parse(url)).timeout(Duration(seconds: 10));
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;
  }

  @override
  Future getPostApiResponse(String url,dynamic data) async{
    dynamic responseJson;
    try {
      Response response = await post(
        Uri.parse(url),
        body:data
      ).timeout(Duration(seconds: 10));
         
    } on SocketException {
      throw FetchDataExceptions('No Internet Connection');
    }
    return responseJson;

  }

  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 500:
      case 400:
        throw BadRequestException(response.body.toString());
      case 404:
        throw UnAuthorisedException(response.body.toString());
      default:
        throw FetchDataExceptions(
            'Error Occurred while communication with server with status Code : ${response.statusCode.toString()}');
    }
  }
}
