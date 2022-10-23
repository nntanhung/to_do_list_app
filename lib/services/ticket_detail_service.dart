import '../helpers/helper.dart';
import '../models/services/service_model.dart';
import '../utilities/network/network.dart';
import 'base_service.dart';

class TicketDetailService extends BaseService {
  Future<DataResult<DataResponse<TicketResultResponse>>> getDetail(String id) async {
    return rest.request<TicketResultResponse>(
      Method.get,
      APIConfigPath.tasksId.replaceAll(':id', id),
      );
  }
    Future<DataResult<DataResponse<TicketListResponse>>> removeTask(String id) async {
    return rest.request<TicketListResponse>(
      Method.delete,
      APIConfigPath.tasksId.replaceAll(':id', id),
    );
  }
}
