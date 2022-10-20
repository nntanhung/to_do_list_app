import '../helpers/helper.dart';
import '../models/services/create_ticket.dart';
import '../utilities/network/network.dart';
import 'base_service.dart';

class CreateTicketService extends BaseService {
  Future<DataResult<DataResponse<CreateTicketResponse>>> getCreateTask(
      CreateTicketRequest request) async {
    return rest.request<CreateTicketResponse>(
      Method.post,
      APIConfigPath.tasks,
      data: request.toJson(),
      
    );
  }

  Future<DataResult<DataResponse<CreateTicketResponse>>> getDeleteTask(
      CreateTicketRequest request) async {
    return rest.request<CreateTicketResponse>(
      Method.post,
      APIConfigPath.tasksId,
      data: request.toJson(),
    );
  }
}
