import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/routers/route_keys.dart';
import 'package:todo_list/widgets/ticket_card.dart';

import '../../blocs/tickets/ticket_list_bloc.dart';
import '../../constants.dart';

import '../../styles/dimens.dart';
import '../../themes/theme.dart';
import '../../widgets/base_cubit_stateful_widget.dart';
import '../../widgets/commons/common.dart';
import '../../widgets/date_picker.dart';

class TicketListScreen extends BaseCubitStatefulWidget {
  const TicketListScreen({Key? key}) : super(key: key);

  @override
  State<TicketListScreen> createState() => _TicketListPageState();
}

class _TicketListPageState
    extends BaseCubitStateFulWidgetState<TicketListCubit, TicketListScreen>
    with SingleTickerProviderStateMixin {
  var titleController = TextEditingController();
  var timeController = TextEditingController();
  var dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget buildBody(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    var scaffoldKey = GlobalKey<ScaffoldState>();
    var formKey = GlobalKey<FormState>();

    var now = DateTime.now();
    return Scaffold(
      key: scaffoldKey,
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
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: 12,
                  padding: EdgeInsets.only(bottom: Dimens.size16),
                  itemBuilder: (context, index) {
                    return AnimationConfiguration.staggeredList(
                      position: index,
                      duration: const Duration(milliseconds: 1000),
                      child: SlideAnimation(
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                          child: TicketCard(onTap: () {
                            print('ddggdggdgdggdgdg');
                            AutoRouter.of(context).pushNamed(
                                RouteKey.ticketDetail.replaceAll(
                                    ':id', '$index candidate.candidateId'));
                          }),
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
        // onPressed: () {
        //  scaffoldKey.currentState!
        //             .showBottomSheet(
        //               (context) => Container(
        //             color: Colors.white,
        //             padding: EdgeInsets.all(20),
        //             child: Form(
        //               key: formKey,
        //               child: Column(
        //                 mainAxisSize: MainAxisSize.min,
        //                 children: [
        //                   TextFieldInput(
        //                     keyboardType: TextInputType.text,
        //                   ),
        //                   SizedBox(
        //                     height: 15,
        //                   ),
        //                   TextFieldInput(
        //                     labelText: 'fhhfffh',
        //                     keyboardType: TextInputType.datetime,
        //                   ),
        //                   SizedBox(
        //                     height: 15,
        //                   ),
        //                   TextFieldInput(
        //                     keyboardType: TextInputType.datetime,
        //                     onTap: () {
        //                       showDatePicker(context: context, initialDate: DateTime.now(), firstDate: DateTime.now(), lastDate: DateTime.parse('2030-10-15')).then((value) {
        //                         dateController.text = DateFormat.yMMMd().format(value!);
        //                       });
        //                     },
        //                    labelText: 'asrdtfgh4577575',
        //                   ),
        //                 ],
        //               ),
        //             ),
        //           ),
        //           elevation: 15,
        //         )
        //             .closed
        //             .then((value) {
        //         });
        // },

        onPressed: () {
          _buildBottomSheet(context);
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

_buildBottomSheet(BuildContext context) {
  final theme = Theme.of(context).textTheme;
  final h = MediaQuery.of(context).size.height;

  var now = DateTime.now();
  final _formKey = GlobalKey<FormBuilderState>();
  return showModalBottomSheet(
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: new BorderRadius.only(
          topLeft: const Radius.circular(Dimens.size24),
          topRight: const Radius.circular(Dimens.size24),
        ),
      ),
      backgroundColor: AppColors.appColor,
      context: context,
      builder: (builder) {
        return FormBuilder(
          key: _formKey,
          child: Container(
            height: h - 100,
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
                    // controller: widget.confirmPasswordController,
                    refreshAfterBuild: true,
                    validateOnFocusChange: true,
                    onChanged: (value) {},
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
                    // controller: widget.confirmPasswordController,
                    refreshAfterBuild: true,
                    validateOnFocusChange: true,
                    onChanged: (value) {},
                    validator: (value) {},
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
                    firstDate: DateTime(now.year - 100, now.month, now.day),
                    lastDate: DateTime(now.year + 100, now.month, now.day),
                    errorMaxLines: 2,
                    colorField: AppColors.primaryWhite,
                    errorInvalidText: tr('issue_day_error'),
                    // validator: (value) => widget.onFieldValidators(CandidateKeys.idIssueDate,value),
                    onChanged: (value) {
                      if (value != null) {
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
                    // controller: widget.confirmPasswordController,
                    refreshAfterBuild: true,
                    validateOnFocusChange: true,
                    onChanged: (value) {},
                    validator: (value) {},
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
                      onTapped: () {}),
                ],
              ),
            ),
          ),
        );
      });
}
