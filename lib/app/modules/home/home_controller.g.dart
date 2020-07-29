// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$resMatrixAtom = Atom(name: '_HomeControllerBase.resMatrix');

  @override
  List<dynamic> get resMatrix {
    _$resMatrixAtom.reportRead();
    return super.resMatrix;
  }

  @override
  set resMatrix(List<dynamic> value) {
    _$resMatrixAtom.reportWrite(value, super.resMatrix, () {
      super.resMatrix = value;
    });
  }

  final _$listFeatureAtom = Atom(name: '_HomeControllerBase.listFeature');

  @override
  List<dynamic> get listFeature {
    _$listFeatureAtom.reportRead();
    return super.listFeature;
  }

  @override
  set listFeature(List<dynamic> value) {
    _$listFeatureAtom.reportWrite(value, super.listFeature, () {
      super.listFeature = value;
    });
  }

  final _$listUndesiredAtom = Atom(name: '_HomeControllerBase.listUndesired');

  @override
  List<dynamic> get listUndesired {
    _$listUndesiredAtom.reportRead();
    return super.listUndesired;
  }

  @override
  set listUndesired(List<dynamic> value) {
    _$listUndesiredAtom.reportWrite(value, super.listUndesired, () {
      super.listUndesired = value;
    });
  }

  final _$indexFeatureAtom = Atom(name: '_HomeControllerBase.indexFeature');

  @override
  int get indexFeature {
    _$indexFeatureAtom.reportRead();
    return super.indexFeature;
  }

  @override
  set indexFeature(int value) {
    _$indexFeatureAtom.reportWrite(value, super.indexFeature, () {
      super.indexFeature = value;
    });
  }

  final _$indexUndesiredAtom = Atom(name: '_HomeControllerBase.indexUndesired');

  @override
  int get indexUndesired {
    _$indexUndesiredAtom.reportRead();
    return super.indexUndesired;
  }

  @override
  set indexUndesired(int value) {
    _$indexUndesiredAtom.reportWrite(value, super.indexUndesired, () {
      super.indexUndesired = value;
    });
  }

  final _$principlesAtom = Atom(name: '_HomeControllerBase.principles');

  @override
  List<String> get principles {
    _$principlesAtom.reportRead();
    return super.principles;
  }

  @override
  set principles(List<String> value) {
    _$principlesAtom.reportWrite(value, super.principles, () {
      super.principles = value;
    });
  }

  final _$principlesUSAtom = Atom(name: '_HomeControllerBase.principlesUS');

  @override
  List<String> get principlesUS {
    _$principlesUSAtom.reportRead();
    return super.principlesUS;
  }

  @override
  set principlesUS(List<String> value) {
    _$principlesUSAtom.reportWrite(value, super.principlesUS, () {
      super.principlesUS = value;
    });
  }

  final _$trizAtom = Atom(name: '_HomeControllerBase.triz');

  @override
  Map<dynamic, dynamic> get triz {
    _$trizAtom.reportRead();
    return super.triz;
  }

  @override
  set triz(Map<dynamic, dynamic> value) {
    _$trizAtom.reportWrite(value, super.triz, () {
      super.triz = value;
    });
  }

  final _$removePersonAsyncAction =
      AsyncAction('_HomeControllerBase.removePerson');

  @override
  Future removePerson(int id) {
    return _$removePersonAsyncAction.run(() => super.removePerson(id));
  }

  final _$logoffAsyncAction = AsyncAction('_HomeControllerBase.logoff');

  @override
  Future logoff() {
    return _$logoffAsyncAction.run(() => super.logoff());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  FirebaseUser getUser() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getUser');
    try {
      return super.getUser();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getFeatures(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getFeatures');
    try {
      return super.getFeatures(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void getUndesired(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getUndesired');
    try {
      return super.getUndesired(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  List<dynamic> getListRes(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.getListRes');
    try {
      return super.getListRes(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resMatrix: ${resMatrix},
listFeature: ${listFeature},
listUndesired: ${listUndesired},
indexFeature: ${indexFeature},
indexUndesired: ${indexUndesired},
principles: ${principles},
principlesUS: ${principlesUS},
triz: ${triz}
    ''';
  }
}
