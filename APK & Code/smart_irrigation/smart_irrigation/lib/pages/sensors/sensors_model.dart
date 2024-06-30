import '/flutter_flow/flutter_flow_util.dart';
import 'sensors_widget.dart' show SensorsWidget;
import 'package:flutter/material.dart';

class SensorsModel extends FlutterFlowModel<SensorsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
