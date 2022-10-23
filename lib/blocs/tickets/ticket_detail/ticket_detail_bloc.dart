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
}
