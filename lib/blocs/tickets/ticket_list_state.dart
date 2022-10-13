import 'package:freezed_annotation/freezed_annotation.dart';
import '../../models/views/ticket_list_model.dart';
import '../../models/services/service_model.dart';

part 'ticket_list_state.freezed.dart';

@freezed
class TicketListState with _$TicketListState {
  const factory TicketListState.initial() =
      TicketListInitial;
  const factory TicketListState.success({List<TicketResultResponse>? ticketList}) =
      TicketListSuccess;

  const factory TicketListState.error(
      {List<TicketListModel>? ticketList, required String message}) = TicketListError;
}
