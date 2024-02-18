import '/flutter_flow/flutter_flow_util.dart';
import 'comp_nova_tarefa_widget.dart' show CompNovaTarefaWidget;
import 'package:flutter/material.dart';

class CompNovaTarefaModel extends FlutterFlowModel<CompNovaTarefaWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TextFieldTarefa widget.
  FocusNode? textFieldTarefaFocusNode;
  TextEditingController? textFieldTarefaController;
  String? Function(BuildContext, String?)? textFieldTarefaControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldTarefaFocusNode?.dispose();
    textFieldTarefaController?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
