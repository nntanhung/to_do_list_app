import '../../models/services/ticket_list.dart';
import '../../services/ticket_list_service.dart';
import '../base_bloc/bloc.dart';
import 'ticket_list_state.dart';

class TicketListBloc extends BaseCubit<TicketListState> {
  final TicketListService? ticketListService;

  TicketListBloc(this.ticketListService) : super(TicketListState.initial());

  Future<void> requestTicketListData() async {
    try {
      final res = await ticketListService?.getTaskList();

      if (res!.isSuccess) {
        print('--------------res ${res.data!.dataResponse.result}');
        emit(TicketListState.success(
            ticketList: res.data?.dataResponse.result ?? []));
      } else {
        emit(TicketListState.error(message: 'message faild'));
      }
    } catch (e) {
      emit(TicketListState.error(message: 'dgdgdgdgddddddddddddddddddddddd'));
    }
  }
}
