import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HotelsRecord extends FirestoreRecord {
  HotelsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "city" field.
  String? _city;
  String get city => _city ?? '';
  bool hasCity() => _city != null;

  // "rating" field.
  int? _rating;
  int get rating => _rating ?? 0;
  bool hasRating() => _rating != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _city = snapshotData['city'] as String?;
    _rating = castToType<int>(snapshotData['rating']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('Hotels');

  static Stream<HotelsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HotelsRecord.fromSnapshot(s));

  static Future<HotelsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HotelsRecord.fromSnapshot(s));

  static HotelsRecord fromSnapshot(DocumentSnapshot snapshot) => HotelsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HotelsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HotelsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HotelsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HotelsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHotelsRecordData({
  String? name,
  String? description,
  String? city,
  int? rating,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'city': city,
      'rating': rating,
    }.withoutNulls,
  );

  return firestoreData;
}

class HotelsRecordDocumentEquality implements Equality<HotelsRecord> {
  const HotelsRecordDocumentEquality();

  @override
  bool equals(HotelsRecord? e1, HotelsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.city == e2?.city &&
        e1?.rating == e2?.rating;
  }

  @override
  int hash(HotelsRecord? e) =>
      const ListEquality().hash([e?.name, e?.description, e?.city, e?.rating]);

  @override
  bool isValidKey(Object? o) => o is HotelsRecord;
}
