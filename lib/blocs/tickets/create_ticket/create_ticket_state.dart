import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/services/service_model.dart';

part 'create_ticket_state.freezed.dart';

@freezed
class CreateTicketState with _$CreateTicketState {
  const factory CreateTicketState.initial() = CreateTicketInitial;
  const factory CreateTicketState.success({CreateTicketResponse? createModel}) =
      CreateTicketSuccess;
  const factory CreateTicketState.load({CreateTicketResponse? createModel}) =
      CreateTicketLoad;

  const factory CreateTicketState.error({required String message}) =
      CreateTicketError;
}
