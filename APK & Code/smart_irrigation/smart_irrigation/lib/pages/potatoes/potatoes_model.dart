import '/flutter_flow/flutter_flow_util.dart';
import 'potatoes_widget.dart' show PotatoesWidget;
import 'package:flutter/material.dart';

class PotatoesModel extends FlutterFlowModel<PotatoesWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
  }
}
