import 'package:mobx/mobx.dart';

part 'persons_controller.g.dart';

class PersonsController = _PersonsControllerBase with _$PersonsController;

abstract class _PersonsControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
