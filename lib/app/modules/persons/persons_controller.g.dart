// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'persons_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PersonsController on _PersonsControllerBase, Store {
  Computed<bool> _$isNameValidComputed;

  @override
  bool get isNameValid =>
      (_$isNameValidComputed ??= Computed<bool>(() => super.isNameValid,
              name: '_PersonsControllerBase.isNameValid'))
          .value;
  Computed<bool> _$isBornDateValidComputed;

  @override
  bool get isBornDateValid =>
      (_$isBornDateValidComputed ??= Computed<bool>(() => super.isBornDateValid,
              name: '_PersonsControllerBase.isBornDateValid'))
          .value;
  Computed<Function> _$savePressedComputed;

  @override
  Function get savePressed =>
      (_$savePressedComputed ??= Computed<Function>(() => super.savePressed,
              name: '_PersonsControllerBase.savePressed'))
          .value;

  final _$statusAtom = Atom(name: '_PersonsControllerBase.status');

  @override
  enumStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(enumStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$nameAtom = Atom(name: '_PersonsControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$bornDateAtom = Atom(name: '_PersonsControllerBase.bornDate');

  @override
  String get bornDate {
    _$bornDateAtom.reportRead();
    return super.bornDate;
  }

  @override
  set bornDate(String value) {
    _$bornDateAtom.reportWrite(value, super.bornDate, () {
      super.bornDate = value;
    });
  }

  final _$bornHourAtom = Atom(name: '_PersonsControllerBase.bornHour');

  @override
  String get bornHour {
    _$bornHourAtom.reportRead();
    return super.bornHour;
  }

  @override
  set bornHour(String value) {
    _$bornHourAtom.reportWrite(value, super.bornHour, () {
      super.bornHour = value;
    });
  }

  final _$phoneAtom = Atom(name: '_PersonsControllerBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$emailAtom = Atom(name: '_PersonsControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$localBornAtom = Atom(name: '_PersonsControllerBase.localBorn');

  @override
  String get localBorn {
    _$localBornAtom.reportRead();
    return super.localBorn;
  }

  @override
  set localBorn(String value) {
    _$localBornAtom.reportWrite(value, super.localBorn, () {
      super.localBorn = value;
    });
  }

  final _$grupoAtom = Atom(name: '_PersonsControllerBase.grupo');

  @override
  String get grupo {
    _$grupoAtom.reportRead();
    return super.grupo;
  }

  @override
  set grupo(String value) {
    _$grupoAtom.reportWrite(value, super.grupo, () {
      super.grupo = value;
    });
  }

  final _$titleAtom = Atom(name: '_PersonsControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$personsListAtom = Atom(name: '_PersonsControllerBase.personsList');

  @override
  ObservableList<PersonModel> get personsList {
    _$personsListAtom.reportRead();
    return super.personsList;
  }

  @override
  set personsList(ObservableList<PersonModel> value) {
    _$personsListAtom.reportWrite(value, super.personsList, () {
      super.personsList = value;
    });
  }

  final _$actualPersonAtom = Atom(name: '_PersonsControllerBase.actualPerson');

  @override
  PersonModel get actualPerson {
    _$actualPersonAtom.reportRead();
    return super.actualPerson;
  }

  @override
  set actualPerson(PersonModel value) {
    _$actualPersonAtom.reportWrite(value, super.actualPerson, () {
      super.actualPerson = value;
    });
  }

  final _$listAtom = Atom(name: '_PersonsControllerBase.list');

  @override
  ObservableList<PersonModel> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(ObservableList<PersonModel> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  final _$getPersonsAsyncAction =
      AsyncAction('_PersonsControllerBase.getPersons');

  @override
  Future<ObservableList<PersonModel>> getPersons() {
    return _$getPersonsAsyncAction.run(() => super.getPersons());
  }

  final _$saveDataAsyncAction = AsyncAction('_PersonsControllerBase.saveData');

  @override
  Future<void> saveData() {
    return _$saveDataAsyncAction.run(() => super.saveData());
  }

  final _$removeAsyncAction = AsyncAction('_PersonsControllerBase.remove');

  @override
  Future<void> remove(int id) {
    return _$removeAsyncAction.run(() => super.remove(id));
  }

  final _$calcularDataAsyncAction =
      AsyncAction('_PersonsControllerBase.calcularData');

  @override
  Future<void> calcularData(PersonModel model) {
    return _$calcularDataAsyncAction.run(() => super.calcularData(model));
  }

  final _$_PersonsControllerBaseActionController =
      ActionController(name: '_PersonsControllerBase');

  @override
  dynamic setTitle(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setName(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBornDate(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setBornDate');
    try {
      return super.setBornDate(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setBornHour(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setBornHour');
    try {
      return super.setBornHour(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPhone(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setEmail(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setGrupo(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setGrupo');
    try {
      return super.setGrupo(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLocalBorn(String value) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setLocalBorn');
    try {
      return super.setLocalBorn(value);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActualPerson(PersonModel p) {
    final _$actionInfo = _$_PersonsControllerBaseActionController.startAction(
        name: '_PersonsControllerBase.setActualPerson');
    try {
      return super.setActualPerson(p);
    } finally {
      _$_PersonsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
name: ${name},
bornDate: ${bornDate},
bornHour: ${bornHour},
phone: ${phone},
email: ${email},
localBorn: ${localBorn},
grupo: ${grupo},
title: ${title},
personsList: ${personsList},
actualPerson: ${actualPerson},
list: ${list},
isNameValid: ${isNameValid},
isBornDateValid: ${isBornDateValid},
savePressed: ${savePressed}
    ''';
  }
}
