import '/flutter_flow/flutter_flow_util.dart';
import 'webv_widget.dart' show WebvWidget;
import 'package:flutter/material.dart';

class WebvModel extends FlutterFlowModel<WebvWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
