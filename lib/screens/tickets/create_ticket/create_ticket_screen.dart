import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../blocs/bloc.dart';
import '../../../constants.dart';
import '../../../routers/route_keys.dart';
import '../../../styles/style.dart';
import '../../../themes/theme.dart';
import '../../../widgets/base_cubit_stateful_widget.dart';
import '../../../widgets/commons/common.dart';
import '../../../widgets/date_picker.dart';

class CreateTicketScreen extends BaseCubitStatefulWidget {
  const CreateTicketScreen({
    Key? key,
  }) : super(key: key);

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

    return Scaffold(
      backgroundColor: AppColors.appColor,
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
                    orElse: () => const LoadingStateWidget(color: AppColors.primaryWhite,),
                    initial: () => _FormCreateTask(
                      contentFocusNode: contentFocusNode,
                      bloc: bloc,
                      formKey: _formKey,
                    ),
                    success: (createModel) => _FormCreateTask(
                      contentFocusNode: contentFocusNode,
                      bloc: bloc,
                      formKey: _formKey,
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
      {Key? key, this.contentFocusNode, this.bloc, this.formKey})
      : super(key: key);

  final FocusNode? contentFocusNode;
  final CreateTicketBloc? bloc;
  final GlobalKey<FormBuilderState>? formKey;

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
            refreshAfterBuild: true,
            validateOnFocusChange: true,
            focusNode: contentFocusNode,
            onChanged: (value) {
              bloc?.ticketItem.content = value;
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
            refreshAfterBuild: true,
            validateOnFocusChange: true,
            onChanged: (value) {
              bloc?.ticketItem.description = value;
            },
            validator: (value) {
              return null;
            },
            maxLines: 13,
            colorText: AppColors.primaryWhite,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          CustomDatePicker(
            key: ValueKey('issue'),
            isEditable: true,
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
             
                print('----- value datetime on ${bloc?.ticketItem.dueDatetime}');
              }
            },
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          TextFieldInput(
            name: 'add_image_optional',
            hintText: 'add_image_optional'.tr(),
            validator: (value) {
              return null;
            },
            suffixIcon: SvgPicture.asset(
              ImageAssetPath.imageIcon,
              color: AppColors.primaryWhite,
              height: Dimens.size22,
              width: Dimens.size22,
            ),
            colorText: AppColors.primaryWhite,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          const SizedBox(
            height: Dimens.size16,
          ),
          SingleButton(
            text: tr('add_todo'),
            textStyle: theme.button!.copyWith(color: AppColors.appColor),
            borderRadius: Dimens.size12,
            backgroundColor: AppColors.primaryWhite,
            onTapped: () async {
              if (formKey!.currentState!.validate()) {
                await bloc?.requestData(
                  content: bloc?.ticketItem.content ?? 'content pikachu',
                  id: bloc?.ticketItem.id,
                  dueDatetime: bloc?.ticketItem.dueDatetime,
                  createdAt: now,
                  description: bloc?.ticketItem.description,
                );
                print('----- value date ${bloc?.ticketItem.dueDatetime}');
                AutoRouter.of(context).pushNamed(RouteKey.tickets);
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
}
