import '../helpers/helper.dart';
import '../models/services/service_model.dart';
import '../utilities/network/network.dart';
import 'base_service.dart';

class TicketListService extends BaseService {
  Future<DataResult<DataResponse<TicketListResponse>>> getTaskList() async {
    return rest.request<TicketListResponse>(
      Method.get,
      APIConfigPath.tasks,
      // queryParameters: {"Authorization": "Bearer f09da0692d671f4a3dde13a43f7c316bbc8e693b"},
    );
  }

  Future<DataResult<DataResponse<TicketListResponse>>> removeTaskList(String id) async {
    return rest.request<TicketListResponse>(
      Method.delete,
      APIConfigPath.tasksId.replaceAll(':id', id),
    );
  }
}
