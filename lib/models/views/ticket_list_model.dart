import '../services/service_model.dart';

class TicketListModel {
  String? id;
  String? projectId;
  String? content;
  String? description;
  bool? isCompleted;
  List<String>? labels;
  int? priority;
  String? creatorId;
  DateTime? createdAt;
  Due? due;
  String? url;

  TicketListModel(
      {this.id,
      this.projectId,
      this.content,
      this.description,
      this.isCompleted,
      this.labels,
      this.priority,
      this.creatorId,
      this.createdAt,
      this.due,
      this.url});
}

class ListItem {
  List<TicketListModel> listItem;
  ListItem({
    required this.listItem,
  });
}
