import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/bloc.dart';
import '../../../constants.dart';
import '../../../helpers/helper.dart';
import '../../../routers/app_router.dart';
import '../../../routers/route_keys.dart';
import '../../../styles/style.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/commons/common.dart';
import '../../../widgets/widget.dart';

class TicketDetailScreen extends BaseCubitStatefulWidget {
  final String? ticketId;
  const TicketDetailScreen({Key? key, @PathParam('id') this.ticketId})
      : super(key: key);

  @override
  State<TicketDetailScreen> createState() => _TicketDetailScreenState();
}

class _TicketDetailScreenState
    extends BaseCubitStateFulWidgetState<TicketDetailBloc, TicketDetailScreen> {
  @override
  void initState() {
    bloc.ticketDetailData(widget.ticketId ?? '');
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final double h = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: SvgPicture.asset(ImageAssetPath.backIcon),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          IconButton(
            onPressed: null,
            icon: SvgPicture.asset(ImageAssetPath.clockIcon),
          ),
          BlocBuilder(
            bloc: bloc,
            builder: (context, TicketDetailState state) {
              return state.maybeWhen(
                orElse: () => IconButton(
                  onPressed: () {},
                  icon: SvgPicture.asset(ImageAssetPath.editIcon),
                ),
                success: (ticketList) => IconButton(
                  onPressed: () => AutoRouter.of(context).push(
                      CreateTicketScreenRoute(
                          ticketList: ticketList,
                          titleScreen: tr('edit_todo'))),
                  icon: SvgPicture.asset(ImageAssetPath.editIcon),
                ),
              );
            },
          ),
          IconButton(
            onPressed: () => _buildBottomSheet(context),
            icon: SvgPicture.asset(ImageAssetPath.trashIcon),
          ),
        ],
      ),
      bottomSheet: BlocBuilder(
        bloc: bloc,
        builder: (context, TicketDetailState state) {
          return state.maybeWhen(
            orElse: () => const LoadingStateWidget(),
            success: (ticketList) => Container(
              width: double.infinity,
              color: AppColors.primaryWhite,
              padding: const EdgeInsets.only(
                  top: Dimens.size12, bottom: Dimens.size16),
              child: Text(
                tr('created_at',
                    args: [ticketList?.createdAt!.toddMMMMyDate() ?? '']),
                textAlign: TextAlign.center,
                style: theme.headline6,
              ),
            ),
          );
        },
      ),
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, TicketDetailState state) {
            return state.maybeWhen(
              orElse: () => const LoadingStateWidget(),
              error: ((message) => const LoadingStateWidget()),
              success: (ticketList) => Padding(
                padding: const EdgeInsets.only(
                  left: Dimens.size24,
                  right: Dimens.size24,
                ),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (ticketList?.content ?? '').toUpperCase(),
                        style: theme.headline4,
                      ),
                      const SizedBox(height: Dimens.size24),
                      Text(
                        ticketList?.description ?? '',
                        style: theme.headline6,
                      ),
                      SizedBox(height: h / 2),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  _buildBottomSheet(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (builder) {
        return Container(
          height: Dimens.size160,
          padding: EdgeInsets.symmetric(horizontal: Dimens.size24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              BlocBuilder(
                bloc: bloc,
                builder: (context, TicketDetailState state) {
                  return state.maybeWhen(
                    orElse: () => const LoadingStateWidget(),
                    success: (ticketList) => SingleButton(
                      text: 'delete_todo'.tr(),
                      borderRadius: Dimens.size12,
                      textStyle:
                          theme.bodyText1!.copyWith(color: AppColors.appColor),
                      backgroundColor: AppColors.primaryWhite,
                      onTapped: () async {
                        await bloc.removeTicket(ticketList!.id);
                        AutoRouter.of(context).pushNamed(RouteKey.tickets);
                      },
                    ),
                  );
                },
              ),
              const SizedBox(height: Dimens.size16),
              SingleButton(
                text: 'cancel'.tr(),
                borderRadius: Dimens.size12,
                backgroundColor: AppColors.primaryWhite,
                textStyle:
                    theme.bodyText1!.copyWith(color: AppColors.greenLight),
                onTapped: () {
                  AutoRouter.of(context).pop();
                },
              ),
              const SizedBox(height: Dimens.size55),
            ],
          ),
        );
      },
    );
  }
}
