import '../../../models/services/create_ticket.dart';
import '../../../models/services/ticket_list.dart';
import '../../../models/views/ticket_list_model.dart';
import '../../../services/create_ticket_service.dart';
import '../../base_bloc/bloc.dart';
import 'create_ticket_state.dart';

class CreateTicketBloc extends BaseCubit<CreateTicketState> {
  final CreateTicketService? _service;

  CreateTicketBloc(this._service) : super(const CreateTicketState.initial()){
       ticketItem = TicketListModel()
      ..content = DateTime.now().toString()
      ..id = '677ticketItem.id'
      ..projectId = '2300287753'
      ..createdAt  = '31/12'
      ..creatorId ='12345'
      ..isCompleted  = true
      ..labels = ['fhf']
      ..parentId = 'ffhhfh'
      ..due = DueResponse( )
      ..description = '5553ticketItem.description';
  }
  late TicketListModel ticketItem;

  Future<void> requestData({ String? content, String? id, String? due, String? description}) async {
    final request = CreateTicketRequest()
      ..content = ticketItem.content
      ..id = ticketItem.id
      ..due = ticketItem.due?.datetime ?? DateTime.now().toString()
      ..description = ticketItem.description;

    try {
      final res = await _service?.getCreateTask(request);
      print('---------------------- $res');
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
