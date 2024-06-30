import '/flutter_flow/flutter_flow_util.dart';
import 'mangoes_widget.dart' show MangoesWidget;
import 'package:flutter/material.dart';

class MangoesModel extends FlutterFlowModel<MangoesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
