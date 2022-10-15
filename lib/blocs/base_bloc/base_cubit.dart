import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'base_state.dart';

abstract class BaseCubit<S> extends Cubit<S> {
  final StreamController<bool> _loadingController =
      StreamController<bool>.broadcast();
  StreamSink<bool> get loadingSink => _loadingController.sink;
  Stream<bool> get loadingStream => _loadingController.stream;

  final StreamController<String> _errorController =
      StreamController<String>.broadcast();
  StreamSink<String> get errorSink => _errorController.sink;
  Stream<String> get errorStream => _errorController.stream;

  BaseCubit(S state) : super(state);

  LoadedState? get latestLoadedState {
    if (state is LoadedState) {
      return state as LoadedState;
    }
    return null;
  }
  
  void initState() {}

  void didChangeDependencies() {}

  void onResume() {}

  void onPause() {}

  void onDetach() {}

  void onInactive() {}

  void showLoading() => EasyLoading.show();

  Future<void> dismissLoading() async {
    await EasyLoading.dismiss();
  }
  @mustCallSuper
  @override
  Future<void> close() async {
    // TODO: implement close
    await _loadingController.close();
    await _errorController.close();
    await super.close();
  }
}
