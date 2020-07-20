// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'numerology_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NumerologyController on _NumerologyBase, Store {
  final _$idNumberAtom = Atom(name: '_NumerologyBase.idNumber');

  @override
  String get idNumber {
    _$idNumberAtom.reportRead();
    return super.idNumber;
  }

  @override
  set idNumber(String value) {
    _$idNumberAtom.reportWrite(value, super.idNumber, () {
      super.idNumber = value;
    });
  }

  final _$contextoNumberAtom = Atom(name: '_NumerologyBase.contextoNumber');

  @override
  String get contextoNumber {
    _$contextoNumberAtom.reportRead();
    return super.contextoNumber;
  }

  @override
  set contextoNumber(String value) {
    _$contextoNumberAtom.reportWrite(value, super.contextoNumber, () {
      super.contextoNumber = value;
    });
  }

  final _$descricaoNumberAtom = Atom(name: '_NumerologyBase.descricaoNumber');

  @override
  String get descricaoNumber {
    _$descricaoNumberAtom.reportRead();
    return super.descricaoNumber;
  }

  @override
  set descricaoNumber(String value) {
    _$descricaoNumberAtom.reportWrite(value, super.descricaoNumber, () {
      super.descricaoNumber = value;
    });
  }

  final _$createRecordAsyncAction = AsyncAction('_NumerologyBase.createRecord');

  @override
  Future<dynamic> createRecord() {
    return _$createRecordAsyncAction.run(() => super.createRecord());
  }

  final _$_NumerologyBaseActionController =
      ActionController(name: '_NumerologyBase');

  @override
  dynamic setIdNumber(String value) {
    final _$actionInfo = _$_NumerologyBaseActionController.startAction(
        name: '_NumerologyBase.setIdNumber');
    try {
      return super.setIdNumber(value);
    } finally {
      _$_NumerologyBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContextoNumber(String value) {
    final _$actionInfo = _$_NumerologyBaseActionController.startAction(
        name: '_NumerologyBase.setContextoNumber');
    try {
      return super.setContextoNumber(value);
    } finally {
      _$_NumerologyBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setDescricaoNumber(String value) {
    final _$actionInfo = _$_NumerologyBaseActionController.startAction(
        name: '_NumerologyBase.setDescricaoNumber');
    try {
      return super.setDescricaoNumber(value);
    } finally {
      _$_NumerologyBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
idNumber: ${idNumber},
contextoNumber: ${contextoNumber},
descricaoNumber: ${descricaoNumber}
    ''';
  }
}
