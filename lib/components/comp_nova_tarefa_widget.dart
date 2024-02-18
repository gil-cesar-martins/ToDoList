import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'comp_nova_tarefa_model.dart';
export 'comp_nova_tarefa_model.dart';

class CompNovaTarefaWidget extends StatefulWidget {
  const CompNovaTarefaWidget({super.key});

  @override
  State<CompNovaTarefaWidget> createState() => _CompNovaTarefaWidgetState();
}

class _CompNovaTarefaWidgetState extends State<CompNovaTarefaWidget> {
  late CompNovaTarefaModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CompNovaTarefaModel());

    _model.textFieldTarefaController ??= TextEditingController();
    _model.textFieldTarefaFocusNode ??= FocusNode();
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 225.0,
      constraints: const BoxConstraints(
        maxWidth: 500.0,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(0.0),
          bottomRight: Radius.circular(0.0),
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              width: 100.0,
              height: 10.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).roxo,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Text(
              'NOVA TAREFA',
              style: FlutterFlowTheme.of(context).bodyMedium,
            ),
            TextFormField(
              controller: _model.textFieldTarefaController,
              focusNode: _model.textFieldTarefaFocusNode,
              autofocus: true,
              obscureText: false,
              decoration: InputDecoration(
                labelStyle: FlutterFlowTheme.of(context).labelMedium,
                hintStyle: FlutterFlowTheme.of(context).labelMedium,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).roxo,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).primary,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: FlutterFlowTheme.of(context).error,
                    width: 1.0,
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              style: FlutterFlowTheme.of(context).bodyMedium,
              maxLines: 2,
              validator: _model.textFieldTarefaControllerValidator
                  .asValidator(context),
            ),
            FFButtonWidget(
              onPressed: () async {
                await TarefasTable().insert({
                  'titulo': _model.textFieldTarefaController.text,
                  'data': supaSerialize<DateTime>(getCurrentTimestamp),
                });
                Navigator.pop(context);
              },
              text: 'ADICIONAR',
              icon: const Icon(
                Icons.add,
                size: 15.0,
              ),
              options: FFButtonOptions(
                width: double.infinity,
                height: 40.0,
                padding: const EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: FlutterFlowTheme.of(context).roxo,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Readex Pro',
                      color: Colors.white,
                    ),
                elevation: 3.0,
                borderSide: const BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ].divide(const SizedBox(height: 8.0)),
        ),
      ),
    );
  }
}
