import 'package:todo_list/helpers/api_config_path.dart';

import '../models/services/create_ticket.dart';
import '../utilities/network/base_response.dart';
import '../utilities/network/data_result.dart';
import '../utilities/network/rest_utility.dart';
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

  Future<DataResult<DataResponse<CreateTicketResponse>>> getUpdateTask(
      CreateTicketRequest request) async {
    return rest.request<CreateTicketResponse>(
      Method.post,
      APIConfigPath.tasks,
      data: request.toJson(),
    );
  }
}
