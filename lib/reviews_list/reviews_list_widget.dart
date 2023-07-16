import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:auto_size_text/auto_size_text.dart';
// ignore: unnecessary_import
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'reviews_list_model.dart';
export 'reviews_list_model.dart';

class ReviewsListWidget extends StatefulWidget {
  const ReviewsListWidget({
    Key? key,
    required this.hotelDocRef,
  }) : super(key: key);

  final DocumentReference? hotelDocRef;

  @override
  _ReviewsListWidgetState createState() => _ReviewsListWidgetState();
}

class _ReviewsListWidgetState extends State<ReviewsListWidget> {
  late ReviewsListModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ReviewsListModel());
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
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_rounded,
              color: Colors.white,
              size: 30.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: StreamBuilder<HotelsRecord>(
            stream: HotelsRecord.getDocument(widget.hotelDocRef!),
            builder: (context, snapshot) {
              // Customize what your widget looks like when it's loading.
              if (!snapshot.hasData) {
                return Center(
                  child: SizedBox(
                    width: 50.0,
                    height: 50.0,
                    child: SpinKitChasingDots(
                      color: Color(0xFFEFD139),
                      size: 50.0,
                    ),
                  ),
                );
              }
              final textHotelsRecord = snapshot.data!;
              return AutoSizeText(
                'Reviews for ${textHotelsRecord.name}',
                textAlign: TextAlign.center,
                style: FlutterFlowTheme.of(context).headlineMedium.override(
                      fontFamily: 'Outfit',
                      color: Color(0xFF242A37),
                      fontSize: 24.0,
                      fontWeight: FontWeight.w500,
                    ),
              );
            },
          ),
          actions: [],
          centerTitle: true,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: StreamBuilder<List<ReviewsRecord>>(
                  stream: queryReviewsRecord(
                    queryBuilder: (reviewsRecord) => reviewsRecord.where('ref',
                        isEqualTo: widget.hotelDocRef),
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: SpinKitChasingDots(
                            color: Color(0xFFEFD139),
                            size: 50.0,
                          ),
                        ),
                      );
                    }
                    List<ReviewsRecord> listViewReviewsRecordList =
                        snapshot.data!;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewReviewsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewReviewsRecord =
                            listViewReviewsRecordList[listViewIndex];
                        return Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              listViewReviewsRecord.title,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                            Text(
                              listViewReviewsRecord.description,
                              style: FlutterFlowTheme.of(context).bodyMedium,
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
