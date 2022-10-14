import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/widgets/ticket_card.dart';

import '../../blocs/bloc.dart';
import '../../constants.dart';

import '../../styles/dimens.dart';
import '../../widgets/base_cubit_stateful_widget.dart';

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

    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(ImageAssetPath.todolist),
        centerTitle: false,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(ImageAssetPath.setting))
        ],
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
                Text(tr('list_of_todo').toUpperCase(), style: theme.headline3),
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
                      // orElse: () => Container(
                      //   height: 120,
                      //   child: TicketCard(
                      //     title: 'item.content',
                      //     dateTime: DateTime.now(),
                      //     description: 'item.description',
                      //     onTap: () {
                      //       AutoRouter.of(context).pushNamed(
                      //         RouteKey.ticketDetail
                      //             .replaceAll(':id', 'item.id'),
                      //       );
                      //     },
                      //   ),
                      // ),
                      orElse: () => Container(
                        color: Colors.amber,
                        height: 200,
                        width: 400,
                        child: Text('OrElse'),
                      ),
                      success: (ticketList) => AnimationLimiter(
                        child: ListView.builder(
                          itemCount: ticketList?.length ?? 1,
                          padding: EdgeInsets.only(bottom: Dimens.size16),
                          itemBuilder: (context, index) {
                          final item  =  ticketList![index];
                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 1000),
                              child: SlideAnimation(
                                verticalOffset: 50.0,
                                child: FadeInAnimation(
                                  child: TicketCard(
                                    title: item.content,
                                    dateTime: item.due?.datetime,
                                    description: item.description,
                                    onTap: () {
                                      AutoRouter.of(context).pushNamed(
                                          RouteKey.ticketDetail.replaceAll(
                                              ':id',
                                              item.id ?? '123456789'
                                              ),
                                            );
                                    },
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
