import 'package:mobx/mobx.dart';

part 'app.g.dart';

class AppStore = AppStoreBase with _$AppStore;

abstract class AppStoreBase with Store {
  @observable
  bool isLoading;

  @observable
  bool saveCounterReactionIsInit;

  @observable
  bool loadingCounter;

  AppStoreBase() {
    saveCounterReactionIsInit = false;
    loadingCounter = true;
    isLoading = true;
    when((_) => saveCounterReactionIsInit && !loadingCounter, init);
  }

  @action
  void finishSaveCounterReaction() {
    saveCounterReactionIsInit = true;
  }

  @action
  void finishLoadingCounter() {
    loadingCounter = false;
  }

  @action
  void init() {
    isLoading = false;
  }
}
