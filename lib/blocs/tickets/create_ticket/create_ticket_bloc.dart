import '../../../models/services/service_model.dart';
import '../../../models/views/view_model.dart';
import '../../../services/create_ticket_service.dart';
import '../../base_bloc/base_bloc.dart';
import 'create_ticket_state.dart';

class CreateTicketBloc extends BaseCubit<CreateTicketState> {
  final CreateTicketService? _service;
  var now = DateTime.now();

  CreateTicketBloc(this._service) : super(const CreateTicketState.initial());
  late TicketListModel ticketItem = TicketListModel();

  Future<void> requestData(
      {String? content,
      String? id,
      String? dueDatetime,
      String? description,
      DateTime? createdAt}) async {
    final request = CreateTicketRequest()
      ..content = ticketItem.content ?? ''
      ..dueDatetime = ticketItem.dueDatetime
      ..createdAt = DateTime(now.year + 100, now.month, now.day)
      ..description = ticketItem.description;

    print('--------------request ${request.dueDatetime?.toString()}');
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
