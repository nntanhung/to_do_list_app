import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/models/services/create_ticket.dart';

part 'create_ticket_state.freezed.dart';

@freezed
class CreateTicketState with _$CreateTicketState {
  const factory CreateTicketState.initial({CreateTicketResponse? createTicketResponse}) = _Initial;
  const factory CreateTicketState.success(
      { CreateTicketResponse? createModel}) = Success;

  const factory CreateTicketState.error(
      { CreateTicketResponse? createModel, required String message}) = Error;
}
