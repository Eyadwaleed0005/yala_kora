import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stadium_details_screen_state.dart';

class StadiumDetailsScreenCubit extends Cubit<StadiumDetailsScreenState> {
  StadiumDetailsScreenCubit() : super(StadiumDetailsScreenInitial());
}
