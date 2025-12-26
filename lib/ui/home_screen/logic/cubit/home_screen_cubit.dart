import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:yalakora/ui/home_screen/data/models/stadium_model.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(const HomeScreenState.initial()) {
    _load();
  }

  Timer? _timer;

  static const List<StadiumModel> _stadiums = [
    StadiumModel(
      name: "ملعب جرين فيلد",
      rating: 4.7,
      location: "القاهرة – مدينة نصر",
     imageUrl: "https://th.bing.com/th/id/R.aaa58b2811872e90f9cc43be150d2a89?rik=x5oy%2f8A0IjFqEw&riu=http%3a%2f%2fphotos.wikimapia.org%2fp%2f00%2f05%2f31%2f19%2f60_full.jpg&ehk=ph3nR7ao4Q9VTuIPcS%2fPkesl%2fuv86nVjKbOuGR1kfn8%3d&risl=&pid=ImgRaw&r=0",

    ),
    StadiumModel(
      name: "ملعب بلازا",
      rating: 4.5,
      location: "الجيزة – الدقي",
      imageUrl:
          "https://images.unsplash.com/photo-1521412644187-c49fa049e84d?q=80&w=800",
    ),
    StadiumModel(
      name: "ملعب سكاي سبورت",
      rating: 4.9,
      location: "الإسكندرية – سموحة",
      imageUrl:
          "https://images.unsplash.com/photo-1518091043644-c1d4457512c6?q=80&w=800",
    ),
    StadiumModel(
      name: "ملعب إيجل أرينا",
      rating: 4.6,
      location: "القاهرة – التجمع",
      imageUrl:
          "https://images.unsplash.com/photo-1483721310020-03333e577078?q=80&w=800",
    ),
    StadiumModel(
      name: "ملعب فايف ستار",
      rating: 4.3,
      location: "القاهرة – المعادي",
      imageUrl:
          "https://images.unsplash.com/photo-1508098682722-e99c43a406b2?q=80&w=800",
    ),
  ];

  void _load() {
    emit(state.copyWith(isLoading: true));

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 2), () {
      emit(state.copyWith(
        isLoading: false,
        stadiums: _stadiums,
      ));
    });
  }

  void changeTab(int index) {
    emit(state.copyWith(currentIndex: index));
  }

  void refresh() {
    _load();
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
