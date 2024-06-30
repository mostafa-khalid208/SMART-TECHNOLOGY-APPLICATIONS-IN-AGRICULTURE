import '/flutter_flow/flutter_flow_util.dart';
import 'edit_password_widget.dart' show EditPasswordWidget;
import 'package:flutter/material.dart';

class EditPasswordModel extends FlutterFlowModel<EditPasswordWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for NewPassword widget.
  FocusNode? newPasswordFocusNode;
  TextEditingController? newPasswordTextController;
  String? Function(BuildContext, String?)? newPasswordTextControllerValidator;
  // State field(s) for ConfirmNewPassword widget.
  FocusNode? confirmNewPasswordFocusNode;
  TextEditingController? confirmNewPasswordTextController;
  String? Function(BuildContext, String?)?
      confirmNewPasswordTextControllerValidator;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    newPasswordFocusNode?.dispose();
    newPasswordTextController?.dispose();

    confirmNewPasswordFocusNode?.dispose();
    confirmNewPasswordTextController?.dispose();
  }
}
