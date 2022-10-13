import 'package:todo_list/models/views/ticket_list_model.dart';

import '../../models/services/service_model.dart';
import '../../services/ticket_list_service.dart';
import '../base_bloc/bloc.dart';
import 'ticket_list_state.dart';

class TicketListBloc extends BaseCubit<TicketListState> {
  final TicketListService? ticketListService;
  late List<TicketListModel> _listItem;

  TicketListBloc(this.ticketListService) : super(TicketListState.initial());


  Future<void> requestTicketListData() async {
    final request = TicketListRequest()..id ='2300287753';
    try {
      final res = await ticketListService?.getTaskList(request);
      print('---------------------- $res');
      if (res!.isSuccess) {
        final list = res.data!.dataResponse.result!.listItem;
        emit(TicketListState.success(ticketList: list));
      } else {
        emit(TicketListState.error(message: 'message faild'));
      }
    } catch (e) {
      return emit(TicketListState.error(message: 'message faild'));
    }
  }
}
