import '/flutter_flow/flutter_flow_util.dart';
import 'cabbage_widget.dart' show CabbageWidget;
import 'package:flutter/material.dart';

class CabbageModel extends FlutterFlowModel<CabbageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
