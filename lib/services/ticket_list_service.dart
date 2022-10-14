
import 'package:todo_list/helpers/api_config_path.dart';

import '../models/services/service_model.dart';
import '../utilities/network/base_response.dart';
import '../utilities/network/data_result.dart';
import '../utilities/network/rest_utility.dart';
import 'base_service.dart';

class TicketListService extends BaseService {

  Future<DataResult<DataResponse<TicketListResponse>>> getTaskList(
      TicketListRequest? request) async {
    return rest.request<TicketListResponse>(
      Method.get,
      APIConfigPath.tasks,
      queryParameters: request!.toJson(),
    );
  }
  
}