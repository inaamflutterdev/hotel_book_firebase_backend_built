import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'hotels_list_model.dart';
export 'hotels_list_model.dart';

class HotelsListWidget extends StatefulWidget {
  const HotelsListWidget({Key? key}) : super(key: key);

  @override
  _HotelsListWidgetState createState() => _HotelsListWidgetState();
}

class _HotelsListWidgetState extends State<HotelsListWidget> {
  late HotelsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HotelsListModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_model.unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Color(0xFFFFD428),
          automaticallyImplyLeading: false,
          title: Text(
            'Hotels',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Outfit',
                  color: Color(0xFF242A37),
                  fontSize: 26.0,
                  fontWeight: FontWeight.w500,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8.0, 8.0, 8.0, 8.0),
                  child: PagedListView<DocumentSnapshot<Object?>?,
                      HotelsRecord>.separated(
                    pagingController: _model.setListViewController(
                      HotelsRecord.collection,
                    ),
                    padding: EdgeInsets.symmetric(vertical: 12.0),
                    shrinkWrap: true,
                    reverse: false,
                    scrollDirection: Axis.vertical,
                    separatorBuilder: (_, __) => SizedBox(height: 12.0),
                    builderDelegate: PagedChildBuilderDelegate<HotelsRecord>(
                      // Customize what your widget looks like when it's loading the first page.
                      firstPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitChasingDots(
                            color: Color(0xFFEFD139),
                            size: 50.0,
                          ),
                        ),
                      ),
                      // Customize what your widget looks like when it's loading another page.
                      newPageProgressIndicatorBuilder: (_) => Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitChasingDots(
                            color: Color(0xFFEFD139),
                            size: 50.0,
                          ),
                        ),
                      ),

                      itemBuilder: (context, _, listViewIndex) {
                        final listViewHotelsRecord = _model
                            .listViewPagingController!.itemList![listViewIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'reviewsList',
                                  queryParameters: {
                                    'hotelDocRef': serializeParam(
                                      listViewHotelsRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Text(
                                listViewHotelsRecord.rating.toString(),
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                context.pushNamed(
                                  'hotelDetail',
                                  queryParameters: {
                                    'hotelDocRef': serializeParam(
                                      listViewHotelsRecord.reference,
                                      ParamType.DocumentReference,
                                    ),
                                  }.withoutNulls,
                                );
                              },
                              child: Text(
                                listViewHotelsRecord.name,
                                style: FlutterFlowTheme.of(context).bodyMedium,
                              ),
                            ),
                            Text(
                              listViewHotelsRecord.city,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Align(
                              alignment: AlignmentDirectional(0.0, 0.0),
                              child: FlutterFlowIconButton(
                                borderColor: Color(0xFF242A37),
                                borderRadius: 12.0,
                                borderWidth: 1.0,
                                buttonSize: 40.0,
                                fillColor: Color(0xFFFF8900),
                                hoverColor: Color(0xFF242A37),
                                hoverIconColor: Color(0xFFFF8900),
                                icon: Icon(
                                  Icons.attach_money_sharp,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 24.0,
                                ),
                                onPressed: () {
                                  print('IconButton pressed ...');
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
