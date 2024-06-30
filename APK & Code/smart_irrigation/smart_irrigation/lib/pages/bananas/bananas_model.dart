import '/flutter_flow/flutter_flow_util.dart';
import 'bananas_widget.dart' show BananasWidget;
import 'package:flutter/material.dart';

class BananasModel extends FlutterFlowModel<BananasWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
