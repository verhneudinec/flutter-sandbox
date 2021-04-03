import 'package:mobx/mobx.dart';

part 'my_profile_store.g.dart';

class MyProfileStore = MyProfileStoreBase with _$MyProfileStore;

abstract class MyProfileStoreBase with Store {
  final String _userName;

  @observable
  ObservableFuture<String> getUserNameFuture;

  MyProfileStoreBase(this._userName);

  @action
  void getUserName() {
    getUserNameFuture = ObservableFuture(getUserNameFuture);
  }
}
