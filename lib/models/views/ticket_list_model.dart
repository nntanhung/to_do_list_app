import 'package:todo_list/models/services/service_model.dart';

import 'model_mapper.dart';

class TicketListModel extends Mapper<TicketResultResponse, TicketListModel> {
  String? creatorId;
  String? createdAt;
  bool? isCompleted;
  String? content;
  String? description;
  Due? due;
  String? id;
  List<String>? labels;
  String? projectId;
  String? parentId;
  TicketListModel({
    this.creatorId,
    this.createdAt,
    this.isCompleted,
    this.content,
    this.description,
    this.due,
    this.id,
    this.labels,
    this.projectId,
    this.parentId,
  });

  @override
  TicketListModel call(TicketResultResponse object) {
    return TicketListModel(
      creatorId: object.creatorId,
      createdAt: object.createdAt,
      isCompleted: object.isCompleted,
      content: object.content,
      description: object.description,
      due: Due(object.due?.date, object.due?.datetime) ,
      id: object.id,
      labels: object.labels,
      projectId: object.projectId,
      parentId: object.parentId,
    );
  }
}
