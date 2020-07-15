import 'package:mobx/mobx.dart';

part 'numerology_controller.g.dart';

class NumerologyController = _NumerologyControllerBase
    with _$NumerologyController;

abstract class _NumerologyControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
