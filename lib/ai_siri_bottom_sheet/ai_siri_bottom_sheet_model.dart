import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'ai_siri_bottom_sheet_widget.dart' show AiSiriBottomSheetWidget;
import 'package:flutter/material.dart';

class AiSiriBottomSheetModel extends FlutterFlowModel<AiSiriBottomSheetWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  List<TaomlarRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
