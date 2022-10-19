import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';

import '../../routers/route_keys.dart';
import '../../themes/theme.dart';
import '../../widgets/commons/common.dart';
import '../../blocs/bloc.dart';
import '../../constants.dart';
import '../../styles/dimens.dart';
import '../../widgets/widget.dart';

class TicketListPage extends BaseCubitStatefulWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState
    extends BaseCubitStateFulWidgetState<TicketListBloc, TicketListPage> {
  @override
  void initState() {
    bloc.requestTicketListData();
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(tr('exit_app'),
                  style: theme.headline5!
                      .copyWith(color: AppColors.primaryBlack80)),
              actionsAlignment: MainAxisAlignment.spaceBetween,
              actions: [
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pop(RouteKey.signIn);
                  },
                  child: Text(tr('yes')),
                ),
                TextButton(
                  onPressed: () {
                    AutoRouter.of(context).pop();
                  },
                  child: Text(tr('cancel')),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(Dimens.size40),
          child: AppBarCustom(),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: Dimens.size24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(ImageAssetPath.logoSimple),
                  const SizedBox(
                    width: Dimens.size10,
                  ),
                  Text(tr('list_of_todo').toUpperCase(),
                      style: theme.headline3),
                  const Spacer(),
                  IconButton(
                    icon: SvgPicture.asset(ImageAssetPath.filterIcon),
                    onPressed: () {},
                  ),
                ],
              ),
              Expanded(
                child: BlocProvider(
                  create: (context) => bloc,
                  child: BlocBuilder(
                    bloc: bloc,
                    builder: (context, TicketListState state) {
                      return state.maybeWhen(
                        initial: (() => const LoadingStateWidget()),
                        orElse: () => const LoadingStateWidget(),
                        success: (ticketList) => AnimationLimiter(
                          child: ListView.builder(
                            itemCount: ticketList?.length ?? 0,
                            padding: EdgeInsets.only(bottom: Dimens.size16),
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              final item = ticketList![index];
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 1000),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Dismissible(
                                      key: Key(item.toString()),
                                      background: Container(
                                        alignment: Alignment.centerRight,
                                        margin: const EdgeInsets.only(
                                          top: Dimens.size16,
                                          bottom: Dimens.size24,
                                        ),
                                        padding: const EdgeInsets.only(
                                            right: Dimens.size16),
                                        color:
                                            AppColors.appColor.withOpacity(0.5),
                                        child: SvgPicture.asset(
                                          ImageAssetPath.trashIcon,
                                          color: Colors.white,
                                        ),
                                      ),
                                      onDismissed: (direction) {
                                        bloc.removeTicketListData(item.id);
                                        setState(() {
                                          ticketList.remove(index);
                                        });
                                      },
                                      child: TicketCard(
                                        title: item.content,
                                        createdAt: item.createdAt,
                                        description: item.description,
                                        onTap: () {
                                          AutoRouter.of(context).pushNamed(
                                            RouteKey.ticketDetail.replaceAll(
                                                ':id', item.id ?? '123456789'),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            AutoRouter.of(context).pushNamed(RouteKey.createTicket);
            // _buildBottomSheet(context);
          },
          tooltip: tr('add_todo'),
          child: const Icon(
            Icons.add,
            size: Dimens.size24,
          ),
        ),
      ),
    );
  }
}



// _buildBottomSheet(BuildContext context) {
//   final theme = Theme.of(context).textTheme;
//   final h = MediaQuery.of(context).size.height;

//   var now = DateTime.now();
//   final _formKey = GlobalKey<FormBuilderState>();
//   return showModalBottomSheet(
//       isScrollControlled: true,
//       shape: RoundedRectangleBorder(
//         borderRadius: new BorderRadius.only(
//           topLeft: const Radius.circular(Dimens.size24),
//           topRight: const Radius.circular(Dimens.size24),
//         ),
//       ),
//       backgroundColor: AppColors.appColor,
//       context: context,
//       builder: (builder) {
//         return BlocProvider(
//             create: (context) => bloc,
//             child: BlocBuilder(
//                 bloc: CreateTicketBloc,
//                 builder: (context, CreateTicketState state) {
//                   return state.maybeWhen(
//                     orElse: () => Container(
//                       color: Colors.amber,
//                       height: 400,
//                       width: 400,
//                     ),
//                     success: (createModel) => CreateTicketScreen(
//                         formKey: _formKey, h: h, now: now, theme: theme),
//                   );
//                 })
//             // ),
//             );
//       });
// }
