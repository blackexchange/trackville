// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coaching_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoachingController on _CoachingControllerBase, Store {
  Computed<Function> _$sharePressedComputed;

  @override
  Function get sharePressed =>
      (_$sharePressedComputed ??= Computed<Function>(() => super.sharePressed,
              name: '_CoachingControllerBase.sharePressed'))
          .value;

  final _$personModelAtom = Atom(name: '_CoachingControllerBase.personModel');

  @override
  PersonModel get personModel {
    _$personModelAtom.reportRead();
    return super.personModel;
  }

  @override
  set personModel(PersonModel value) {
    _$personModelAtom.reportWrite(value, super.personModel, () {
      super.personModel = value;
    });
  }

  final _$leitureValuesAtom =
      Atom(name: '_CoachingControllerBase.leitureValues');

  @override
  List<dynamic> get leitureValues {
    _$leitureValuesAtom.reportRead();
    return super.leitureValues;
  }

  @override
  set leitureValues(List<dynamic> value) {
    _$leitureValuesAtom.reportWrite(value, super.leitureValues, () {
      super.leitureValues = value;
    });
  }

  final _$lectureCodeAtom = Atom(name: '_CoachingControllerBase.lectureCode');

  @override
  String get lectureCode {
    _$lectureCodeAtom.reportRead();
    return super.lectureCode;
  }

  @override
  set lectureCode(String value) {
    _$lectureCodeAtom.reportWrite(value, super.lectureCode, () {
      super.lectureCode = value;
    });
  }

  final _$lectureValuesAtom =
      Atom(name: '_CoachingControllerBase.lectureValues');

  @override
  String get lectureValues {
    _$lectureValuesAtom.reportRead();
    return super.lectureValues;
  }

  @override
  set lectureValues(String value) {
    _$lectureValuesAtom.reportWrite(value, super.lectureValues, () {
      super.lectureValues = value;
    });
  }

  final _$indexValueAtom = Atom(name: '_CoachingControllerBase.indexValue');

  @override
  int get indexValue {
    _$indexValueAtom.reportRead();
    return super.indexValue;
  }

  @override
  set indexValue(int value) {
    _$indexValueAtom.reportWrite(value, super.indexValue, () {
      super.indexValue = value;
    });
  }

  final _$leitureTitleAtom = Atom(name: '_CoachingControllerBase.leitureTitle');

  @override
  List<dynamic> get leitureTitle {
    _$leitureTitleAtom.reportRead();
    return super.leitureTitle;
  }

  @override
  set leitureTitle(List<dynamic> value) {
    _$leitureTitleAtom.reportWrite(value, super.leitureTitle, () {
      super.leitureTitle = value;
    });
  }

  final _$lectureCodesAtom = Atom(name: '_CoachingControllerBase.lectureCodes');

  @override
  List<dynamic> get lectureCodes {
    _$lectureCodesAtom.reportRead();
    return super.lectureCodes;
  }

  @override
  set lectureCodes(List<dynamic> value) {
    _$lectureCodesAtom.reportWrite(value, super.lectureCodes, () {
      super.lectureCodes = value;
    });
  }

  final _$lectureMapAtom = Atom(name: '_CoachingControllerBase.lectureMap');

  @override
  Map<dynamic, dynamic> get lectureMap {
    _$lectureMapAtom.reportRead();
    return super.lectureMap;
  }

  @override
  set lectureMap(Map<dynamic, dynamic> value) {
    _$lectureMapAtom.reportWrite(value, super.lectureMap, () {
      super.lectureMap = value;
    });
  }

  final _$leitureResumeAtom =
      Atom(name: '_CoachingControllerBase.leitureResume');

  @override
  List<dynamic> get leitureResume {
    _$leitureResumeAtom.reportRead();
    return super.leitureResume;
  }

  @override
  set leitureResume(List<dynamic> value) {
    _$leitureResumeAtom.reportWrite(value, super.leitureResume, () {
      super.leitureResume = value;
    });
  }

  final _$numbersAtom = Atom(name: '_CoachingControllerBase.numbers');

  @override
  Map<dynamic, dynamic> get numbers {
    _$numbersAtom.reportRead();
    return super.numbers;
  }

  @override
  set numbers(Map<dynamic, dynamic> value) {
    _$numbersAtom.reportWrite(value, super.numbers, () {
      super.numbers = value;
    });
  }

  final _$_CoachingControllerBaseActionController =
      ActionController(name: '_CoachingControllerBase');

  @override
  void openDetail() {
    final _$actionInfo = _$_CoachingControllerBaseActionController.startAction(
        name: '_CoachingControllerBase.openDetail');
    try {
      return super.openDetail();
    } finally {
      _$_CoachingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLectureCode(String value) {
    final _$actionInfo = _$_CoachingControllerBaseActionController.startAction(
        name: '_CoachingControllerBase.setLectureCode');
    try {
      return super.setLectureCode(value);
    } finally {
      _$_CoachingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLectureValue(String value) {
    final _$actionInfo = _$_CoachingControllerBaseActionController.startAction(
        name: '_CoachingControllerBase.setLectureValue');
    try {
      return super.setLectureValue(value);
    } finally {
      _$_CoachingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndexValue(int value) {
    final _$actionInfo = _$_CoachingControllerBaseActionController.startAction(
        name: '_CoachingControllerBase.setIndexValue');
    try {
      return super.setIndexValue(value);
    } finally {
      _$_CoachingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void shareData() {
    final _$actionInfo = _$_CoachingControllerBaseActionController.startAction(
        name: '_CoachingControllerBase.shareData');
    try {
      return super.shareData();
    } finally {
      _$_CoachingControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
personModel: ${personModel},
leitureValues: ${leitureValues},
lectureCode: ${lectureCode},
lectureValues: ${lectureValues},
indexValue: ${indexValue},
leitureTitle: ${leitureTitle},
lectureCodes: ${lectureCodes},
lectureMap: ${lectureMap},
leitureResume: ${leitureResume},
numbers: ${numbers},
sharePressed: ${sharePressed}
    ''';
  }
}
