import '../../../models/services/service_model.dart';
import '../../../models/views/view_model.dart';
import '../../../services/service.dart';
import '../../base_bloc/base_bloc.dart';
import '../../bloc.dart';

class TicketDetailBloc extends BaseCubit<TicketDetailState> {
  final TicketDetailService? ticketDetailService;
  late TicketListModel ticketItem = TicketListModel();

  TicketDetailBloc(this.ticketDetailService)
      : super(const TicketDetailState.initial());
  Future<void> ticketDetailData(String id) async {
    try {
      final res = await ticketDetailService?.getDetail(id);

      if (res!.isSuccess) {
        emit(TicketDetailState.success(
            ticketDetailModel: res.data?.dataResponse));
        print('-------------------- res detail ${res.data?.dataResponse.toJson().toString()} ');
      } else {
        emit(TicketDetailState.error(message: 'Message fail'));
      }
    } catch (e) {
      emit(TicketDetailState.error(message: 'Message fail'));
    }
  }

  Future<void> removeTicket(String? id) async {
    try {
      final res = await ticketDetailService?.removeTask(id ?? '');
      // showLoading();
      if (res!.isSuccess) {
      } else {
        emit(TicketDetailState.error(message: 'Message fail'));
      }
      // await dismissLoading();
    } catch (e) {
      emit(TicketDetailState.error(message: 'Message fail'));
    }
  }

  var now = DateTime.now();

  Future<void> updateTicket(
      String? content, String? id, Due? due, String? description) async {
    final request = TicketListRequest()
      ..id = ticketItem.id
      ..content = ticketItem.content ?? ''
      ..due = Due(ticketItem.due?.datetime ?? now , date: '3535353535356363636')
      ..createdAt = DateTime(now.year + 100, now.month, now.day).toString()
      ..description = ticketItem.description;

    try {
      final res = await ticketDetailService?.updateTask(request);
      if (res!.isSuccess) {
        emit(TicketDetailState.success(
            ticketDetailModel: res.data!.dataResponse));
      } else {
        emit(TicketDetailState.error(message: 'message faild'));
      }
    } catch (e) {
      return emit(TicketDetailState.error(message: 'message faild'));
    }
  }
}
