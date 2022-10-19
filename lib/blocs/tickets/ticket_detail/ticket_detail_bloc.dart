import '../../../services/service.dart';
import '../../base_bloc/base_bloc.dart';
import '../../bloc.dart';

class TicketDetailBloc extends BaseCubit<TicketDetailState> {
  final TicketDetailService? ticketDetailService;

  TicketDetailBloc(this.ticketDetailService)
      : super(const TicketDetailState.initial());
  Future<void> ticketDetailData(String id) async {
    try {
      final res = await ticketDetailService?.getDetail(id);
 
      if (res!.isSuccess) {
        emit(TicketDetailState.success(
            ticketDetailModel: res.data?.dataResponse));
        print(
            '-------------------- res detail ${res.data?.dataResponse} ');
      } else {
        emit(TicketDetailState.error(message: 'Message fail'));
      }
    } catch (e) {
      emit(TicketDetailState.error(message: 'Message fail'));
    }
  }
}
