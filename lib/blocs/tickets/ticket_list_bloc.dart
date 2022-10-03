import '../base_bloc/base_cubit.dart';
import 'ticket_list_state.dart';

class TicketListCubit extends BaseCubit<TicketListState> {
  TicketListCubit():super(const TicketListState.initial());
  
}