import 'package:api_intergration/screens/file_upload_api_screen.dart';
import 'package:api_intergration/screens/formdata_api_screen.dart';
import 'package:api_intergration/screens/get_api_screen.dart';
import 'package:api_intergration/screens/home_screen.dart';
import 'package:api_intergration/screens/patch_api_screen.dart';
import 'package:api_intergration/screens/post_api_screen.dart';

class AppPages {
  static final routes = {
    Routes.homeScreen: (context) => HomeScreen(),
    Routes.getApiScreen: (context) => GetApiScreen(),
    Routes.postApiScreen: (context) => PostApiScreen(),
    Routes.patchApiScreen: (context) => PatchApiScreen(),
    Routes.formDataApiScreen: (context) => FormDataApiScreen(),
    Routes.fileUploadApiScreen: (context) => FileUploadApiScreen(),
  };
}

class Routes {
  static const String homeScreen = '/HomeScreen';
  static const String getApiScreen = '/GetApiScreen';
  static const String postApiScreen = '/PostApiScreen';
  static const String patchApiScreen = '/PatchApiScreen';
  static const String formDataApiScreen = '/FormDataApiScreen';
  static const String fileUploadApiScreen = '/FileUploadApiScreen';
}
