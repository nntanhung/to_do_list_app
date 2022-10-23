import '../helpers/helper.dart';
import '../models/services/service_model.dart';
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

  Future<DataResult<DataResponse<CreateTicketResponse>>> updateTask(
      CreateTicketRequest createTicketRequest, String id) async {
    return rest.request<CreateTicketResponse>(
      Method.post,
      APIConfigPath.tasksId.replaceAll(':id', id),
      data: createTicketRequest.toJson(),
    );
  }
}
