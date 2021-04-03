// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_profile_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyProfileStore on MyProfileStoreBase, Store {
  final _$getUserNameFutureAtom =
      Atom(name: 'MyProfileStoreBase.getUserNameFuture');

  @override
  ObservableFuture<String> get getUserNameFuture {
    _$getUserNameFutureAtom.reportRead();
    return super.getUserNameFuture;
  }

  @override
  set getUserNameFuture(ObservableFuture<String> value) {
    _$getUserNameFutureAtom.reportWrite(value, super.getUserNameFuture, () {
      super.getUserNameFuture = value;
    });
  }

  final _$MyProfileStoreBaseActionController =
      ActionController(name: 'MyProfileStoreBase');

  @override
  void getUserName() {
    final _$actionInfo = _$MyProfileStoreBaseActionController.startAction(
        name: 'MyProfileStoreBase.getUserName');
    try {
      return super.getUserName();
    } finally {
      _$MyProfileStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
getUserNameFuture: ${getUserNameFuture}
    ''';
  }
}
