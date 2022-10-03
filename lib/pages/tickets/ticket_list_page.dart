import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_list/widgets/ticket_card.dart';

import '../../blocs/tickets/ticket_list_bloc.dart';
import '../../constants.dart';

import '../../../themes/app_colors.dart';
import '../../styles/dimens.dart';
import '../../widgets/base_cubit_stateful_widget.dart';

class TicketListPage extends BaseCubitStatefulWidget {
  const TicketListPage({Key? key}) : super(key: key);

  @override
  State<TicketListPage> createState() => _TicketListPageState();
}

class _TicketListPageState
    extends BaseCubitStateFulWidgetState<TicketListCubit, TicketListPage>
    with SingleTickerProviderStateMixin {
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
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(ImageAssetPath.todolist),
        centerTitle: false,
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
         
            TicketCard()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );

    // return Container(
    //   height: 800,
    //   width: 258,
    //   color: Colors.amber,
    // );
  }
}
