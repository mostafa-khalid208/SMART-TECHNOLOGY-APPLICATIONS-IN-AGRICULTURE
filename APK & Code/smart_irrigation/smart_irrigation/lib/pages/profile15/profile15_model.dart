import '/flutter_flow/flutter_flow_util.dart';
import 'profile15_widget.dart' show Profile15Widget;
import 'package:flutter/material.dart';

class Profile15Model extends FlutterFlowModel<Profile15Widget> {
  ///  State fields for stateful widgets in this page.

  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
