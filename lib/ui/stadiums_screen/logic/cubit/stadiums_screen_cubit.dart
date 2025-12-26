import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'stadiums_screen_state.dart';

class StadiumsScreenCubit extends Cubit<StadiumsScreenState> {
  StadiumsScreenCubit() : super(StadiumsScreenInitial());
}
