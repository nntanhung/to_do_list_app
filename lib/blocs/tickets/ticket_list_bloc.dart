import '../../services/ticket_list_service.dart';
import '../base_bloc/base_bloc.dart';
import 'ticket_list_state.dart';

class TicketListBloc extends BaseCubit<TicketListState> {
  final TicketListService? ticketListService;

  TicketListBloc(this.ticketListService) : super(TicketListState.initial());

  Future<void> requestTicketListData() async {
    try {
      final res = await ticketListService?.getTaskList();

      if (res!.isSuccess) {
        emit(TicketListState.success(
            ticketList: res.data?.dataResponse.result ?? []));
      } else {
        emit(TicketListState.error(message: 'Message fail'));
      }
    } catch (e) {
      emit(TicketListState.error(message: 'Message fail'));
    }
  }

  Future<void> removeTicketListData(String? id) async {
    try {
      final res = await ticketListService?.removeTaskList(id ?? '');

      if (res!.isSuccess) {
        if (res.data?.dataResponse.result == null) {
          final aaa = await ticketListService?.getTaskList();
          emit(TicketListState.success(
              ticketList: aaa?.data?.dataResponse.result ?? []));
        }
      } else {
        emit(TicketListState.error(message: 'Message fail'));
      }
    } catch (e) {
      emit(TicketListState.error(message: 'Message fail'));
    }
  }
}
