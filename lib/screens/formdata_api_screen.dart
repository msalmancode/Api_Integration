import 'package:api_intergration/controller/api_call.dart';
import 'package:api_intergration/model/post.dart';
import 'package:api_intergration/utils/color.dart';
import 'package:api_intergration/widgets/empty_widget.dart';
import 'package:api_intergration/widgets/post_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FormDataApiScreen extends StatefulWidget {
  const FormDataApiScreen({Key? key}) : super(key: key);

  @override
  State<FormDataApiScreen> createState() => _FormDataApiScreenState();
}

class _FormDataApiScreenState extends State<FormDataApiScreen> {
  List<Post> postList = [];
  bool isLoading = false;

  @override
  void initState() {
    callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text('Form Data API'),
        actions: [
          IconButton(
            onPressed: () => callApi(),
            icon: Icon(
              Icons.refresh_sharp,
            ),
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(16.0),
        child: _postDataList(),
      ),
    );
  }

  Widget _postDataList() {
    if (isLoading) {
      return const SpinKitCircle(
        color: kPrimaryColor,
        size: 40.0,
      );
    } else {
      if (postList.isEmpty) {
        return EmptyWidget();
      } else {
        return ListView.builder(
            shrinkWrap: true,
            itemCount: postList.length,
            itemBuilder: (context, index) => PostItem(
                  title: postList[index].title.toString(),
                  subtitle: postList[index].body.toString(),
                ));
      }
    }
  }

  callApi() async {
    final post = Post(title: 'Mac M1', body: 'Using Form Data', userId: 1);
    setState(() => isLoading = true);
    postList = await ApiCall().formDataCallApi(context, post);
    setState(() => isLoading = false);
  }
}
