import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/bloc.dart';
import '../../../constants.dart';
import '../../../models/services/service_model.dart';
import '../../../routers/route_keys.dart';
import '../../../styles/style.dart';
import '../../../themes/theme.dart';
import '../../../widgets/commons/common.dart';
import '../../../widgets/widget.dart';

class CreateTicketScreen extends BaseCubitStatefulWidget {
  final TicketResultResponse? ticketList;
  final String? titleScreen;
  const CreateTicketScreen({Key? key, this.ticketList, this.titleScreen})
      : super(key: key);

  @override
  State<CreateTicketScreen> createState() => _CreateTicketScreenState();
}

class _CreateTicketScreenState
    extends BaseCubitStateFulWidgetState<CreateTicketBloc, CreateTicketScreen> {
  final contentFocusNode = FocusNode();

  @override
  void dispose() {
    contentFocusNode.dispose();
    contentFocusNode.unfocus();
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>(
        debugLabel: 'GlobalFormKey #Create Ticket ');
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: AppColors.appColor,
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        leading: IconButton(
          icon: SvgPicture.asset(ImageAssetPath.backIcon,
              color: AppColors.primaryWhite),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          widget.titleScreen ?? tr('add_todo'),
          style: theme.headline5,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
              left: Dimens.size24,
              top: Dimens.size16,
              right: Dimens.size24,
              bottom: Dimens.size24),
          child: FormBuilder(
            key: _formKey,
            child: BlocProvider(
              create: (context) => bloc,
              child: BlocBuilder<CreateTicketBloc, CreateTicketState>(
                bloc: bloc,
                builder: (context, CreateTicketState state) {
                  return state.maybeWhen(
                    orElse: () => const LoadingStateWidget(
                      color: AppColors.primaryWhite,
                    ),
                    initial: () => _FormCreateTask(
                      contentFocusNode: contentFocusNode,
                      bloc: bloc,
                      formKey: _formKey,
                      ticketList: widget.ticketList,
                    ),
                    success: (createModel) => _FormCreateTask(
                      contentFocusNode: contentFocusNode,
                      bloc: bloc,
                      formKey: _formKey,
                      ticketList: widget.ticketList,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormCreateTask extends StatelessWidget {
  const _FormCreateTask(
      {Key? key,
      this.contentFocusNode,
      this.bloc,
      this.formKey,
      this.titleScreen,
      this.ticketList})
      : super(key: key);

  final FocusNode? contentFocusNode;
  final CreateTicketBloc? bloc;
  final GlobalKey<FormBuilderState>? formKey;
  final TicketResultResponse? ticketList;
  final String? titleScreen;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;

    var now = DateTime.now();

    return SingleChildScrollView(
      child: Column(
        children: [
          TextFieldInput(
            name: 'title',
            hintText: 'title'.tr(),
            initText: ticketList?.content ?? '',
            refreshAfterBuild: true,
            validateOnFocusChange: true,
            focusNode: contentFocusNode,
            onChanged: (value) {
              if (value != null) {
                bloc?.ticketItem.content = value;
              } else {
                bloc?.ticketItem.content = ticketList?.content;
              }
            },
            validator: (value) {
              if (value!.isEmpty) {
                return tr('required_field');
              }
              return null;
            },
            colorText: AppColors.primaryWhite,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          TextFieldInput(
            name: 'description',
            hintText: 'description'.tr(),
            initText: ticketList?.description ?? '',
            refreshAfterBuild: true,
            validateOnFocusChange: true,
            onChanged: (value) {
              if (value != null) {
                bloc?.ticketItem.description = value;
              } else {
                bloc?.ticketItem.description = ticketList?.description;
              }
            },
            maxLines: 15,
            colorText: AppColors.primaryWhite,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          CustomDatePicker(
            key: ValueKey('issue'),
            isEditable: isCheckDate(titleScreen),
            initialDate: ticketList?.due?.datetime,
            hintText: tr('deadline_optional'),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            firstDate: DateTime(now.year, now.month, now.day),
            lastDate: DateTime(now.year + 100, now.month, now.day),
            errorMaxLines: 2,
            colorField: AppColors.primaryWhite,
            pickerType: DatePickerType.dateTime,
            errorInvalidText: tr('issue_day_error'),
            onChanged: (value) {
              if (value != null) {
                bloc?.ticketItem.dueDatetime = value.toString();
              } else {
                bloc?.ticketItem.dueDatetime =
                    ticketList?.due?.datetime.toString();
              }
            },
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          TextFieldInput(
            name: 'add_image_optional',
            hintText: 'add_image_optional'.tr(),
            enabled: false,
            backgroundColor: AppColors.appColor,
            validator: (value) {
              return null;
            },
            suffixIcon: SvgPicture.asset(
              ImageAssetPath.imageIcon,
              color: AppColors.primaryWhite.withOpacity(0.5),
              height: Dimens.size22,
              width: Dimens.size22,
            ),
            colorText: AppColors.primaryWhite.withOpacity(0.5),
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          SingleButton(
            text: ticketList == null ? tr('add_todo') : tr('edit_todo'),
            textStyle: theme.button!.copyWith(color: AppColors.appColor),
            borderRadius: Dimens.size12,
            backgroundColor: AppColors.primaryWhite,
            onTapped: () async {
              if (ticketList == null) {
                if (formKey!.currentState!.validate()) {
                  await bloc?.requestData(
                    content: bloc?.ticketItem.content,
                    id: bloc?.ticketItem.id,
                    dueDatetime: bloc?.ticketItem.dueDatetime,
                    description: bloc?.ticketItem.description,
                  );
                  AutoRouter.of(context).pushNamed(RouteKey.tickets);
                }
              } else {
                if (formKey!.currentState!.validate()) {
                  await bloc?.updateTicket(
                    id: ticketList!.id ?? '',
                    content: bloc?.ticketItem.content,
                    dueDatetime: bloc?.ticketItem.dueDatetime,
                    description: bloc?.ticketItem.description,
                  );
                  AutoRouter.of(context).pushNamed(RouteKey.tickets);
                }
              }
            },
          ),
          const SizedBox(
            height: Dimens.size76,
          ),
        ],
      ),
    );
  }

  bool isCheckDate(String? title) {
    var now = DateTime.now();
    var dateTime = ticketList?.due?.datetime;
    if (title == 'add_todo'.tr() && dateTime != null && now.isBefore(dateTime) || (title == 'edit_todo'.tr() && dateTime == null) )  {
      return false;
    } else {
      return true;
    }
  }

}
