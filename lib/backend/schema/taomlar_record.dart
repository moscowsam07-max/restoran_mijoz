import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TaomlarRecord extends FirestoreRecord {
  TaomlarRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "nom" field.
  String? _nom;
  String get nom => _nom ?? '';
  bool hasNom() => _nom != null;

  // "narx" field.
  int? _narx;
  int get narx => _narx ?? 0;
  bool hasNarx() => _narx != null;

  // "toifa" field.
  String? _toifa;
  String get toifa => _toifa ?? '';
  bool hasToifa() => _toifa != null;

  // "rasm" field.
  String? _rasm;
  String get rasm => _rasm ?? '';
  bool hasRasm() => _rasm != null;

  void _initializeFields() {
    _nom = snapshotData['nom'] as String?;
    _narx = castToType<int>(snapshotData['narx']);
    _toifa = snapshotData['toifa'] as String?;
    _rasm = snapshotData['rasm'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('taomlar');

  static Stream<TaomlarRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TaomlarRecord.fromSnapshot(s));

  static Future<TaomlarRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TaomlarRecord.fromSnapshot(s));

  static TaomlarRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TaomlarRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TaomlarRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TaomlarRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TaomlarRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TaomlarRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTaomlarRecordData({
  String? nom,
  int? narx,
  String? toifa,
  String? rasm,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'nom': nom,
      'narx': narx,
      'toifa': toifa,
      'rasm': rasm,
    }.withoutNulls,
  );

  return firestoreData;
}

class TaomlarRecordDocumentEquality implements Equality<TaomlarRecord> {
  const TaomlarRecordDocumentEquality();

  @override
  bool equals(TaomlarRecord? e1, TaomlarRecord? e2) {
    return e1?.nom == e2?.nom &&
        e1?.narx == e2?.narx &&
        e1?.toifa == e2?.toifa &&
        e1?.rasm == e2?.rasm;
  }

  @override
  int hash(TaomlarRecord? e) =>
      const ListEquality().hash([e?.nom, e?.narx, e?.toifa, e?.rasm]);

  @override
  bool isValidKey(Object? o) => o is TaomlarRecord;
}
