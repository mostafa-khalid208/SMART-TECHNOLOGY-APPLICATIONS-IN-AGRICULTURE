import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SensorsRecord extends FirestoreRecord {
  SensorsRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "Time" field.
  DateTime? _time;
  DateTime? get time => _time;
  bool hasTime() => _time != null;

  // "humidity" field.
  double? _humidity;
  double get humidity => _humidity ?? 0.0;
  bool hasHumidity() => _humidity != null;

  // "soil_moisture" field.
  double? _soilMoisture;
  double get soilMoisture => _soilMoisture ?? 0.0;
  bool hasSoilMoisture() => _soilMoisture != null;

  // "temperature" field.
  double? _temperature;
  double get temperature => _temperature ?? 0.0;
  bool hasTemperature() => _temperature != null;

  // "water_level" field.
  double? _waterLevel;
  double get waterLevel => _waterLevel ?? 0.0;
  bool hasWaterLevel() => _waterLevel != null;

  // "ledPin" field.
  bool? _ledPin;
  bool get ledPin => _ledPin ?? false;
  bool hasLedPin() => _ledPin != null;

  // "ledStripState" field.
  bool? _ledStripState;
  bool get ledStripState => _ledStripState ?? false;
  bool hasLedStripState() => _ledStripState != null;

  // "pumpState" field.
  bool? _pumpState;
  bool get pumpState => _pumpState ?? false;
  bool hasPumpState() => _pumpState != null;

  void _initializeFields() {
    _time = snapshotData['Time'] as DateTime?;
    _humidity = castToType<double>(snapshotData['humidity']);
    _soilMoisture = castToType<double>(snapshotData['soil_moisture']);
    _temperature = castToType<double>(snapshotData['temperature']);
    _waterLevel = castToType<double>(snapshotData['water_level']);
    _ledPin = snapshotData['ledPin'] as bool?;
    _ledStripState = snapshotData['ledStripState'] as bool?;
    _pumpState = snapshotData['pumpState'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('sensors');

  static Stream<SensorsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SensorsRecord.fromSnapshot(s));

  static Future<SensorsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SensorsRecord.fromSnapshot(s));

  static SensorsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SensorsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SensorsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SensorsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SensorsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SensorsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSensorsRecordData({
  DateTime? time,
  double? humidity,
  double? soilMoisture,
  double? temperature,
  double? waterLevel,
  bool? ledPin,
  bool? ledStripState,
  bool? pumpState,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'Time': time,
      'humidity': humidity,
      'soil_moisture': soilMoisture,
      'temperature': temperature,
      'water_level': waterLevel,
      'ledPin': ledPin,
      'ledStripState': ledStripState,
      'pumpState': pumpState,
    }.withoutNulls,
  );

  return firestoreData;
}

class SensorsRecordDocumentEquality implements Equality<SensorsRecord> {
  const SensorsRecordDocumentEquality();

  @override
  bool equals(SensorsRecord? e1, SensorsRecord? e2) {
    return e1?.time == e2?.time &&
        e1?.humidity == e2?.humidity &&
        e1?.soilMoisture == e2?.soilMoisture &&
        e1?.temperature == e2?.temperature &&
        e1?.waterLevel == e2?.waterLevel &&
        e1?.ledPin == e2?.ledPin &&
        e1?.ledStripState == e2?.ledStripState &&
        e1?.pumpState == e2?.pumpState;
  }

  @override
  int hash(SensorsRecord? e) => const ListEquality().hash([
        e?.time,
        e?.humidity,
        e?.soilMoisture,
        e?.temperature,
        e?.waterLevel,
        e?.ledPin,
        e?.ledStripState,
        e?.pumpState
      ]);

  @override
  bool isValidKey(Object? o) => o is SensorsRecord;
}
