import '/flutter_flow/flutter_flow_util.dart';
import 'rice_widget.dart' show RiceWidget;
import 'package:flutter/material.dart';

class RiceModel extends FlutterFlowModel<RiceWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
