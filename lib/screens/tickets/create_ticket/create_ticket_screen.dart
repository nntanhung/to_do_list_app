import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_list/models/services/service_model.dart';

import '../../../blocs/bloc.dart';
import '../../../constants.dart';
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
  @override
  void initState() {
    bloc.requestData();
    super.initState();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final h = MediaQuery.of(context).size.height;
    final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>(
        debugLabel: 'GlobalFormKey #Create Ticket ');
    var now = DateTime.now();

    return Scaffold(
      body: BlocProvider(
        create: (context) => bloc,
        child: BlocBuilder(
          bloc: bloc,
          builder: (context, CreateTicketState state) {
            return state.maybeWhen(
              orElse: () => Container(
                color: Colors.blueAccent,
                height: 400,
                width: 400,
              ),
              initial: (createModel) => Container(
                color: Colors.blueAccent,
                height: 400,
                width: 400,
              ),
              success: (createModel) => FormBuilder(
                key: _formKey,
                child: Container(
                  color: AppColors.appColor,
                  // height: h - 150,
                  padding: const EdgeInsets.only(
                      left: Dimens.size24,
                      top: Dimens.size16,
                      right: Dimens.size24,
                      bottom: Dimens.size24),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SvgPicture.asset(ImageAssetPath.line),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFieldInput(
                          name: 'title',
                          hintText: 'title'.tr(),
                          // focusNode: emailFocusNode,
                          refreshAfterBuild: true,
                          validateOnFocusChange: true,
                          onChanged: (value) {
                            bloc.ticketItem.content = value;
                          },
                          validator: (value) {},
                          colorText: AppColors.primaryWhite,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        TextFieldInput(
                          name: 'description',
                          hintText: 'description'.tr(),
                          // focusNode: emailFocusNode,
                          refreshAfterBuild: true,
                          validateOnFocusChange: true,
                          onChanged: (value) {
                            bloc.ticketItem.description = value;
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
                          isEditable: true,
                          key: ValueKey('issue' +
                              'widget.model.transaction.idIssueDate.toString()'),
                          initialDate: now,
                          hintText: tr('deadline_optional'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          firstDate:
                              DateTime(now.year - 100, now.month, now.day),
                          lastDate:
                              DateTime(now.year + 100, now.month, now.day),
                          errorMaxLines: 2,
                          colorField: AppColors.primaryWhite,
                          errorInvalidText: tr('issue_day_error'),
                          // validator: (value) => widget.onFieldValidators(CandidateKeys.idIssueDate,value),
                          onChanged: (value) {
                            if (value != null) {
                              bloc.ticketItem.due?.datetime = value.toString();
                              // widget.model.transaction.idIssueDate = value;
                              // widget.onIssueDateChange(value);
                            }
                          },
                        ),
                        const SizedBox(
                          height: Dimens.size16,
                        ),
                        TextFieldInput(
                          name: 'add_image_optional',
                          hintText: 'add_image_optional'.tr(),
                          // focusNode: emailFocusNode,
                          refreshAfterBuild: true,
                          validateOnFocusChange: true,
                          onChanged: (value) {},
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
                          textStyle:
                              theme.button!.copyWith(color: AppColors.appColor),
                          borderRadius: Dimens.size12,
                          backgroundColor: AppColors.primaryWhite,
                          onTapped: () async {
                            await bloc.requestData(
                              content:
                                  bloc.ticketItem.content ?? 'content pikachu',
                              id: bloc.ticketItem.id,
                              due: DateTime.now().toString(),
                              description: bloc.ticketItem.description ??
                                  'Leader_  AutoRouter.of(context).pushNamed(level05',
                            );
                            AutoRouter.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
