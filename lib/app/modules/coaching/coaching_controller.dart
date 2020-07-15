import 'package:mobx/mobx.dart';

part 'coaching_controller.g.dart';

class CoachingController = _CoachingControllerBase with _$CoachingController;

abstract class _CoachingControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
