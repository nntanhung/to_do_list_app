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
}
