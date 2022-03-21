import 'dart:convert';

import 'package:api_intergration/model/base_response.dart';
import 'package:api_intergration/model/post.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:http/http.dart' as http;

import 'api_function.dart';

class ApiAuth extends APIFunction {
  // URLs
  static const String BASE_URL = 'https://jsonplaceholder.typicode.com/';
  static const String POST = '${BASE_URL}Posts';
  static const String POST1 = '${BASE_URL}Posts/1';

  // Checking Internet Connection
  Future<bool> connectionCheck() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<BaseResponse> getCall() async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        http.Response response = await http.get(Uri.parse(POST));

        if (response.statusCode == 200) {
          return BaseResponse(
              isSuccess: true,
              message: 'Success',
              data: jsonDecode(response.body));
        } else {
          return BaseResponse(
              isSuccess: false,
              message: 'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return BaseResponse(isSuccess: false, message: 'Network Error');
      }
    } catch (e) {
      return BaseResponse(isSuccess: false, message: 'Exception Error');
    }
  }

  @override
  Future<BaseResponse> postCall(Post post) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        http.Response response = await http.post(
          Uri.parse(POST),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode(post.toJson()),
        );

        if (response.statusCode == 201) {
          return BaseResponse(
              isSuccess: true,
              message: 'Success',
              data: jsonDecode(response.body));
        } else {
          return BaseResponse(
              isSuccess: false,
              message: 'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return BaseResponse(isSuccess: false, message: 'Network Error');
      }
    } catch (e) {
      return BaseResponse(isSuccess: false, message: 'Exception Error');
    }
  }

  @override
  Future<BaseResponse> patchCall(Post post) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        http.Response response = await http.patch(
          Uri.parse(POST1),
          headers: {'Content-type': 'application/json; charset=UTF-8'},
          body: jsonEncode({
            "title": post.title,
          }),
        );
        if (response.statusCode == 200) {
          return BaseResponse(
              isSuccess: true,
              message: 'Success',
              data: jsonDecode(response.body));
        } else {
          return BaseResponse(
              isSuccess: false,
              message: 'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return BaseResponse(isSuccess: false, message: 'Network Error');
      }
    } catch (e) {
      return BaseResponse(isSuccess: false, message: 'Exception Error');
    }
  }

  @override
  Future<BaseResponse> formDataCall(Post post) async {
    try {
      final isInternet = await connectionCheck();
      if (isInternet) {
        var map = new Map<String, dynamic>();
        map['title'] = post.title;
        map['body'] = post.body;

        http.Response response = await http.post(Uri.parse(POST),
            body: map,
            headers: {"Content-Type": "application/x-www-form-urlencoded"});

        if (response.statusCode == 201) {
          return BaseResponse(
              isSuccess: true,
              message: 'Success',
              data: jsonDecode(response.body));
        } else {
          return BaseResponse(
              isSuccess: false,
              message: 'Exception Error Status code : ${response.statusCode}');
        }
      } else {
        return BaseResponse(isSuccess: false, message: 'Network Error');
      }
    } catch (e) {
      return BaseResponse(isSuccess: false, message: 'Exception Error');
    }
  }
}
