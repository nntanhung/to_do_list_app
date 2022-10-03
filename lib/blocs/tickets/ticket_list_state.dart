import 'package:freezed_annotation/freezed_annotation.dart';

part 'ticket_list_state.freezed.dart';

@freezed
class TicketListState with _$TicketListState {
  const factory TicketListState.initial() = _Initial;
}
