import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../models/services/service_model.dart';
part 'ticket_detail_state.freezed.dart';

@freezed
class TicketDetailState with _$TicketDetailState {
  const factory TicketDetailState.initial() = TicketDetailInitial;
  const factory TicketDetailState.success({TicketResultResponse? ticketDetailModel}) =
      TicketDetailSuccess;

  const factory TicketDetailState.error({required String message}) =
      TicketDetailError;
}
