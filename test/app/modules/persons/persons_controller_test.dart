import 'package:flutter_modular/flutter_modular_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:trackville/app/modules/persons/persons_controller.dart';
import 'package:trackville/app/modules/persons/persons_module.dart';

void main() {
  initModule(PersonsModule());
  // PersonsController persons;
  //
  setUp(() {
    //     persons = PersonsModule.to.get<PersonsController>();
  });

  group('PersonsController Test', () {
    //   test("First Test", () {
    //     expect(persons, isInstanceOf<PersonsController>());
    //   });

    //   test("Set Value", () {
    //     expect(persons.value, equals(0));
    //     persons.increment();
    //     expect(persons.value, equals(1));
    //   });
  });
}
