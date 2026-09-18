import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _userlanguage = prefs.getString('ff_userlanguage') ?? _userlanguage;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _userlanguage = 'Uz';
  String get userlanguage => _userlanguage;
  set userlanguage(String value) {
    _userlanguage = value;
    prefs.setString('ff_userlanguage', value);
  }

  String _localpayment = '';
  String get localpayment => _localpayment;
  set localpayment(String value) {
    _localpayment = value;
  }

  bool _isadded = false;
  bool get isadded => _isadded;
  set isadded(bool value) {
    _isadded = value;
  }

  bool _isdelivery = false;
  bool get isdelivery => _isdelivery;
  set isdelivery(bool value) {
    _isdelivery = value;
  }

  bool _pushXabarnomaYoqilgan = false;
  bool get pushXabarnomaYoqilgan => _pushXabarnomaYoqilgan;
  set pushXabarnomaYoqilgan(bool value) {
    _pushXabarnomaYoqilgan = value;
  }

  int _SavatSoni = 0;
  int get SavatSoni => _SavatSoni;
  set SavatSoni(int value) {
    _SavatSoni = value;
  }

  String _savatTaomNomi = '';
  String get savatTaomNomi => _savatTaomNomi;
  set savatTaomNomi(String value) {
    _savatTaomNomi = value;
  }

  int _savatJamiSummasi = 0;
  int get savatJamiSummasi => _savatJamiSummasi;
  set savatJamiSummasi(int value) {
    _savatJamiSummasi = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
