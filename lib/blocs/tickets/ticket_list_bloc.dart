import 'package:todo_list/models/views/ticket_list_model.dart';

import '../../models/services/service_model.dart';
import '../../services/ticket_list_service.dart';
import '../base_bloc/bloc.dart';
import 'ticket_list_state.dart';

class TicketListBloc extends BaseCubit<TicketListState> {
  final TicketListService? ticketListService;
  late List<TicketResultResponse> _listItem;

  TicketListBloc(this.ticketListService) : super(TicketListState.initial());

  Future<void> requestTicketListData() async {
    final request = TicketListRequest()..id = '2300287753';
    try {
      final res = await ticketListService?.getTaskList(request);
      final a = res!.data!.dataResponse.result!.listItem!;
      print('----------------------ticketLsit $_listItem');
      if (res.isSuccess) {
        emit(TicketListState.success(ticketList: a));
      } else {
        emit(TicketListState.error(message: 'message faild'));
      }
    
    } catch (e) {
      return emit(TicketListState.error(message: 'message faild'));
    }
     
  }
}
