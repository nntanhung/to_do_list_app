import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:todo_list/models/services/create_ticket.dart';

part 'create_ticket_state.freezed.dart';

@freezed
class CreateTicketState with _$CreateTicketState {
  const factory CreateTicketState.initial({CreateTicketResponse? createTicketResponse}) = CreateTicketInitial;
  const factory CreateTicketState.success(
      { CreateTicketResponse? createModel}) = CreateTicketSuccess;

  const factory CreateTicketState.error(
      { CreateTicketResponse? createModel, required String message}) = CreateTicketError;
}
