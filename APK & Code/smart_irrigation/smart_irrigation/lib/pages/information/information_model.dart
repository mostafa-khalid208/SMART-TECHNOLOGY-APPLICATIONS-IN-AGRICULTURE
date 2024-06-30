import '/flutter_flow/flutter_flow_util.dart';
import 'information_widget.dart' show InformationWidget;
import 'package:flutter/material.dart';

class InformationModel extends FlutterFlowModel<InformationWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
