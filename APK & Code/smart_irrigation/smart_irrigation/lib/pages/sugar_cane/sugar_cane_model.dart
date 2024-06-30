import '/flutter_flow/flutter_flow_util.dart';
import 'sugar_cane_widget.dart' show SugarCaneWidget;
import 'package:flutter/material.dart';

class SugarCaneModel extends FlutterFlowModel<SugarCaneWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
