import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';

import '../blocs/base_bloc/base_cubit.dart';

abstract class BaseCubitStatefulWidget extends StatefulWidget {
  const BaseCubitStatefulWidget({Key? key}) : super(key: key);
}

abstract class BaseCubitStateFulWidgetState<B extends BaseCubit,
        S extends BaseCubitStatefulWidget> extends State<S>
    with WidgetsBindingObserver, AutomaticKeepAliveClientMixin<S> {
  final B bloc = GetIt.I.get<B>();

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      bloc.loadingStream.listen((event) {
        if (event) {
          EasyLoading.show();
        } else {
          EasyLoading.dismiss();
        }
      });

      bloc.errorStream.listen((event) {
        showErrorMessage(context, event);
      });
    });
    bloc.initState();
    super.initState();
  }

  @override
  bool get wantKeepAlive => false;

  @override
  void didChangeDependencies() {
    bloc.didChangeDependencies();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    bloc.close();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        onResume();
        break;
      case AppLifecycleState.paused:
        onPause();
        break;
      case AppLifecycleState.inactive:
        onInactive();
        break;
      default:
        onDetach();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: buildAppbar(context),
      drawer: buildDrawer(context),
      body: buildBody(context)
    );
  }

  @mustCallSuper
  void onResume() {
    bloc.onResume();
  }

  @mustCallSuper
  void onPause() {
    bloc.onPause();
  }

  @mustCallSuper
  void onDetach() {
    bloc.onDetach();
  }

  @mustCallSuper
  void onInactive() {
    bloc.onInactive();
  }

  Widget buildBody(BuildContext context);
  Widget? buildShimmer(BuildContext context) {}
  PreferredSizeWidget? buildAppbar(BuildContext context) {}
  Widget? buildDrawer(BuildContext context) {}
  void showErrorMessage(BuildContext context, String message) {}
}
