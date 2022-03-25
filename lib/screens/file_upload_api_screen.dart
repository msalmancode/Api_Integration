import 'dart:convert';
import 'dart:io';

import 'package:api_intergration/model/post.dart';
import 'package:api_intergration/utils/color.dart';
import 'package:api_intergration/widgets/large_file_dialog.dart';
import 'package:api_intergration/widgets/success_dialog.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FileUploadApiScreen extends StatefulWidget {
  const FileUploadApiScreen({Key? key}) : super(key: key);

  @override
  State<FileUploadApiScreen> createState() => _FileUploadApiScreenState();
}

class _FileUploadApiScreenState extends State<FileUploadApiScreen> {
  List<Post> postList = [];
  bool isLoading = false;
  File? file;
  String fileExtension = '';

  @override
  void initState() {
    // callApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        title: Text('File Upload Base 64'),
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
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upload File',
            style: TextStyle(
                fontSize: 25,
                color: Colors.grey.shade700,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 24),
          InkWell(
            onTap: () => selectFile(),
            child: Container(
              height: MediaQuery.of(context).size.height * .20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPrimaryColor.withOpacity(.05),
                border: Border.all(
                  color: kPrimaryColor.withOpacity(.2),
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.cloud_upload_outlined,
                        color: kPrimaryColor, size: 50),
                    SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      'Choose File here...',
                      style:
                          TextStyle(fontSize: 20, color: Colors.grey.shade400),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 50),
          file == null
              ? SizedBox()
              : Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.file_present_rounded,
                            color: Colors.grey.shade500, size: 40),
                        Text(
                          fileExtension,
                          style: TextStyle(fontSize: 22, color: Colors.black45),
                        )
                      ],
                    ),
                    SizedBox(height: 12),
                    ElevatedButton(
                        onPressed: () => convertFileClick(),
                        child: Text('Convert'))
                  ],
                )
        ],
      );
    }
  }

  selectFile() async {
    try {
      //png, jpeg, jpg, docx, pdf,
      final allowExtension = ['png', 'jpeg', 'jpg', 'pdf', 'docx'];

      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: allowExtension,
      );

      if (result != null) {
        file = File(result.files.single.path.toString());
        PlatformFile platformFile = result.files.first;

        final fileSize = platformFile.size;
        final kb = fileSize / 1024; // Converting into KB

        if (kb > 3000) {
          file = null;
          showDialog(context: context, builder: (ctx) => LargeFileDialog());
        } else {
          fileExtension = platformFile.extension.toString().toUpperCase();
        }
      } else {
        // User canceled the picker
        file = null;
      }
      setState(() {});
    } catch (e) {
      print('File Picker Exception ${e}');
    }
  }

  String getBase64FormatFile(File file) {
    List<int> fileInByte = file.readAsBytesSync();
    String fileInBase64 = base64Encode(fileInByte);
    print("Converted base64 $fileInBase64");
    return fileInBase64;
  }

  // Click Listeners
  convertFileClick() {
    if (file != null) {
      String base64 = getBase64FormatFile(file!);
      if (base64 != '') {
        showDialog(context: context, builder: (ctx) => SuccessDialog());
        file = null;
      }
      setState(() {});
    }
  }
}
