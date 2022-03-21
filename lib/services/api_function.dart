import 'package:api_intergration/model/base_response.dart';
import 'package:api_intergration/model/post.dart';

abstract class APIFunction {
  Future<BaseResponse> getCall();
  Future<BaseResponse> postCall(Post post);
  Future<BaseResponse> patchCall(Post post);
  Future<BaseResponse> formDataCall(Post post);
}
