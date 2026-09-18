import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OrdersRecord extends FirestoreRecord {
  OrdersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "taom_nomi" field.
  String? _taomNomi;
  String get taomNomi => _taomNomi ?? '';
  bool hasTaomNomi() => _taomNomi != null;

  // "jami_summa" field.
  int? _jamiSumma;
  int get jamiSumma => _jamiSumma ?? 0;
  bool hasJamiSumma() => _jamiSumma != null;

  // "manzil_turi" field.
  bool? _manzilTuri;
  bool get manzilTuri => _manzilTuri ?? false;
  bool hasManzilTuri() => _manzilTuri != null;

  // "status" field.
  String? _status;
  String get status => _status ?? '';
  bool hasStatus() => _status != null;

  void _initializeFields() {
    _taomNomi = snapshotData['taom_nomi'] as String?;
    _jamiSumma = castToType<int>(snapshotData['jami_summa']);
    _manzilTuri = snapshotData['manzil_turi'] as bool?;
    _status = snapshotData['status'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('orders');

  static Stream<OrdersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OrdersRecord.fromSnapshot(s));

  static Future<OrdersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OrdersRecord.fromSnapshot(s));

  static OrdersRecord fromSnapshot(DocumentSnapshot snapshot) => OrdersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OrdersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OrdersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OrdersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OrdersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOrdersRecordData({
  String? taomNomi,
  int? jamiSumma,
  bool? manzilTuri,
  String? status,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'taom_nomi': taomNomi,
      'jami_summa': jamiSumma,
      'manzil_turi': manzilTuri,
      'status': status,
    }.withoutNulls,
  );

  return firestoreData;
}

class OrdersRecordDocumentEquality implements Equality<OrdersRecord> {
  const OrdersRecordDocumentEquality();

  @override
  bool equals(OrdersRecord? e1, OrdersRecord? e2) {
    return e1?.taomNomi == e2?.taomNomi &&
        e1?.jamiSumma == e2?.jamiSumma &&
        e1?.manzilTuri == e2?.manzilTuri &&
        e1?.status == e2?.status;
  }

  @override
  int hash(OrdersRecord? e) => const ListEquality()
      .hash([e?.taomNomi, e?.jamiSumma, e?.manzilTuri, e?.status]);

  @override
  bool isValidKey(Object? o) => o is OrdersRecord;
}
