import 'package:api_intergration/model/post.dart';
import 'package:api_intergration/services/api_auth.dart';
import 'package:api_intergration/services/api_function.dart';
import 'package:api_intergration/widgets/no_internet_dialog.dart';
import 'package:flutter/material.dart';

class ApiCall {
  APIFunction apiFunction = ApiAuth();
  List<Post> postList = [];

  Future<List<Post>> getCallApi(BuildContext context) async {
    final response = await apiFunction.getCall();
    if (response.isSuccess) {
      postList.clear();
      await response.data.forEach((element) {
        postList.add(Post.fromJson(element));
      });
    } else if (response.message == 'Network Error') {
      print('No Internet Connection');
      internetDialog(context);
    }
    return postList;
  }

  Future<List<Post>> postCallApi(BuildContext context, Post post) async {
    final response = await apiFunction.postCall(post);
    if (response.isSuccess) {
      postList.clear();
      postList.add(Post.fromJson(response.data));
    } else if (response.message == 'Network Error') {
      print('No Internet Connection');
      internetDialog(context);
    }
    return postList;
  }

  Future<List<Post>> patchCallApi(BuildContext context, Post post) async {
    final response = await apiFunction.patchCall(post);
    if (response.isSuccess) {
      postList.clear();
      postList.add(Post.fromJson(response.data));
    } else if (response.message == 'Network Error') {
      print('No Internet Connection');
      internetDialog(context);
    }
    return postList;
  }

  Future<List<Post>> formDataCallApi(BuildContext context, Post post) async {
    final response = await apiFunction.formDataCall(post);
    if (response.isSuccess) {
      postList.clear();
      postList.add(Post.fromJson(response.data));
    } else if (response.message == 'Network Error') {
      print('No Internet Connection');
      internetDialog(context);
    }
    return postList;
  }

  dialogShow() {}

  internetDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (ctx) => NoInternetDialog(),
    );
  }
}
