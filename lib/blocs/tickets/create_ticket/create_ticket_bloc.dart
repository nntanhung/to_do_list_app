import '../../../models/services/service_model.dart';
import '../../../models/views/ticket_list_model.dart';
import '../../../services/create_ticket_service.dart';
import '../../base_bloc/bloc.dart';
import 'create_ticket_state.dart';

class CreateTicketBloc extends BaseCubit<CreateTicketState> {
  final CreateTicketService? _service;
    var now = DateTime.now();

  CreateTicketBloc(this._service) : super(const CreateTicketState.initial())
  {
   ticketItem = TicketListModel()
   ..projectId = '2300287753'
   ..createdAt = DateTime(now.year + 100, now.month, now.day)
   ..content ='Completebcbcbcbcb task';
  }
  late TicketListModel ticketItem = TicketListModel();

  Future<void> requestData(
      {String? content, String? id, Due? due, String? description}) async {
    final request = CreateTicketRequest()
      ..content = ticketItem.content ?? ''
      ..due = Due(ticketItem.due?.datetime)
      ..createdAt = DateTime.now()
      ..description = ticketItem.description;

    try {
      final res = await _service?.getCreateTask(request);
      if (res!.isSuccess) {
        emit(CreateTicketState.success(createModel: res.data!.dataResponse));
      } else {
        emit(CreateTicketState.error(message: 'message faild'));
      }
    } catch (e) {
      return emit(CreateTicketState.error(message: 'message faild'));
    }
  }
}
