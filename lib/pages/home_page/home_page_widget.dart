import '/backend/supabase/supabase.dart';
import '/components/comp_nova_tarefa_widget.dart';
import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'home_page_model.dart';
export 'home_page_model.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  late HomePageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomePageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).roxo,
        body: Align(
          alignment: const AlignmentDirectional(0.0, -1.0),
          child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(0.0, 50.0, 0.0, 0.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  width: double.infinity,
                  constraints: const BoxConstraints(
                    maxWidth: 500.0,
                  ),
                  decoration: const BoxDecoration(),
                  child: Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(25.0, 25.0, 25.0, 0.0),
                    child: FlutterFlowCalendar(
                      color: FlutterFlowTheme.of(context).primaryBackground,
                      iconColor: FlutterFlowTheme.of(context).primaryBackground,
                      weekFormat: true,
                      weekStartsMonday: false,
                      rowHeight: 64.0,
                      onChange: (DateTimeRange? newSelectedDate) async {
                        if (_model.calendarSelectedDay == newSelectedDate) {
                          return;
                        }
                        _model.calendarSelectedDay = newSelectedDate;
                        setState(() => _model.requestCompleter = null);
                        await _model.waitForRequestCompleted();
                        setState(() {});
                      },
                      titleStyle: FlutterFlowTheme.of(context)
                          .headlineSmall
                          .override(
                            fontFamily: 'Outfit',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      dayOfWeekStyle: FlutterFlowTheme.of(context)
                          .labelLarge
                          .override(
                            fontFamily: 'Readex Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      dateStyle: FlutterFlowTheme.of(context)
                          .bodyMedium
                          .override(
                            fontFamily: 'Readex Pro',
                            color:
                                FlutterFlowTheme.of(context).primaryBackground,
                          ),
                      selectedDateStyle:
                          FlutterFlowTheme.of(context).titleSmall.override(
                                fontFamily: 'Readex Pro',
                                color: FlutterFlowTheme.of(context).roxo,
                              ),
                      inactiveDateStyle:
                          FlutterFlowTheme.of(context).labelMedium,
                      locale: FFLocalizations.of(context).languageCode,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: 100.0,
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
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          25.0, 16.0, 25.0, 25.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'MINHAS TAREFAS',
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Expanded(
                            child: FutureBuilder<List<TarefasRow>>(
                              future: (_model.requestCompleter ??=
                                      Completer<List<TarefasRow>>()
                                        ..complete(TarefasTable().queryRows(
                                          queryFn: (q) => q
                                              .eq(
                                                'data',
                                                supaSerialize<DateTime>(_model
                                                    .calendarSelectedDay
                                                    ?.start),
                                              )
                                              .order('status', ascending: true),
                                        )))
                                  .future,
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<TarefasRow> listViewTarefasRowList =
                                    snapshot.data!;
                                return ListView.separated(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: listViewTarefasRowList.length,
                                  separatorBuilder: (_, __) =>
                                      const SizedBox(height: 4.0),
                                  itemBuilder: (context, listViewIndex) {
                                    final listViewTarefasRow =
                                        listViewTarefasRowList[listViewIndex];
                                    return Container(
                                      width: 100.0,
                                      height: 60.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .alternate,
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            8.0, 0.0, 8.0, 0.0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await TarefasTable().update(
                                                  data: {
                                                    'status':
                                                        !listViewTarefasRow
                                                            .status!,
                                                  },
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    listViewTarefasRow.id,
                                                  ),
                                                );
                                                setState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();
                                              },
                                              child: Container(
                                                height: 100.0,
                                                decoration: const BoxDecoration(),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (listViewTarefasRow
                                                            .status ==
                                                        true)
                                                      Icon(
                                                        Icons.check_box,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .roxo,
                                                        size: 24.0,
                                                      ),
                                                    if (listViewTarefasRow
                                                            .status ==
                                                        false)
                                                      Icon(
                                                        Icons
                                                            .check_box_outline_blank,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .roxo,
                                                        size: 24.0,
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              child: Padding(
                                                padding: const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        6.0, 0.0, 6.0, 0.0),
                                                child: Text(
                                                  valueOrDefault<String>(
                                                    listViewTarefasRow.titulo,
                                                    'N.A.',
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyMedium,
                                                ),
                                              ),
                                            ),
                                            InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                await TarefasTable().delete(
                                                  matchingRows: (rows) =>
                                                      rows.eq(
                                                    'id',
                                                    listViewTarefasRow.id,
                                                  ),
                                                );
                                                setState(() => _model
                                                    .requestCompleter = null);
                                                await _model
                                                    .waitForRequestCompleted();
                                              },
                                              child: FaIcon(
                                                FontAwesomeIcons.trash,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .roxo,
                                                size: 24.0,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                          FFButtonWidget(
                            onPressed: () async {
                              await showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                context: context,
                                builder: (context) {
                                  return GestureDetector(
                                    onTap: () => _model
                                            .unfocusNode.canRequestFocus
                                        ? FocusScope.of(context)
                                            .requestFocus(_model.unfocusNode)
                                        : FocusScope.of(context).unfocus(),
                                    child: Padding(
                                      padding: MediaQuery.viewInsetsOf(context),
                                      child: CompNovaTarefaWidget(
                                        paramData:
                                            _model.calendarSelectedDay!.start,
                                      ),
                                    ),
                                  );
                                },
                              ).then((value) => safeSetState(() {}));

                              setState(() => _model.requestCompleter = null);
                              await _model.waitForRequestCompleted();
                            },
                            text: 'NOVA TAREFA',
                            options: FFButtonOptions(
                              width: double.infinity,
                              height: 45.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0, 0.0, 24.0, 0.0),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: FlutterFlowTheme.of(context).roxo,
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
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
                        ].divide(const SizedBox(height: 16.0)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
