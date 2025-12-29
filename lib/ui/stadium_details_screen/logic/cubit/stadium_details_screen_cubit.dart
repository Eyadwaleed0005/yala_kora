import 'package:bloc/bloc.dart';
import 'package:yalakora/core/helper/stadium_slots_calculator.dart';
import 'package:yalakora/core/models/booking_model.dart';
import 'package:yalakora/core/models/stadium_model.dart';
import 'stadium_details_screen_state.dart';

class StadiumDetailsScreenCubit extends Cubit<StadiumDetailsScreenState> {
  StadiumDetailsScreenCubit() : super(StadiumDetailsScreenState.initial());

  StadiumModel? _stadium;
  List<BookingModel> _bookings = const [];

  void init({
    required StadiumModel stadium,
    required List<BookingModel> bookings,
    DateTime? initialDate,
    int? initialDuration,
  }) {
    _stadium = stadium;
    _bookings = bookings;

    emit(
      state.copyWith(
        selectedDate: initialDate == null
            ? null
            : DateTime(initialDate.year, initialDate.month, initialDate.day),
        selectedDuration: initialDuration,
        selectedSlotStart: const Nullable<DateTime?>(null),
        selectedSlotEnd: const Nullable<DateTime?>(null),
        selectedIsExtra: false,
        normalSlots: const [],
        extraSlots: const [],
        isSubmitting: false,
      ),
    );

    _rebuildSlotsIfReady();
  }

  void updateBookings(List<BookingModel> bookings) {
    _bookings = bookings;
    _rebuildSlotsIfReady();
  }

  void selectDate(DateTime day) {
    emit(
      state.copyWith(
        selectedDate: DateTime(day.year, day.month, day.day),
        selectedSlotStart: const Nullable<DateTime?>(null),
        selectedSlotEnd: const Nullable<DateTime?>(null),
        selectedIsExtra: false,
      ),
    );
    _rebuildSlotsIfReady();
  }

  void selectDuration(int minutes) {
    emit(
      state.copyWith(
        selectedDuration: minutes,
        selectedSlotStart: const Nullable<DateTime?>(null),
        selectedSlotEnd: const Nullable<DateTime?>(null),
        selectedIsExtra: false,
      ),
    );
    _rebuildSlotsIfReady();
  }

  void selectSlotByLabel({
    required String label,
    required bool isExtra,
  }) {
    final list = isExtra ? state.extraSlots : state.normalSlots;
    final slot = list.where((e) => e.label == label).toList();
    if (slot.isEmpty) return;

    final s = slot.first;
    if (s.isDisabled) return;

    emit(
      state.copyWith(
        selectedSlotStart: Nullable<DateTime?>(s.start),
        selectedSlotEnd: Nullable<DateTime?>(s.end),
        selectedIsExtra: isExtra,
      ),
    );
  }

  bool get canSubmit {
    if (state.isSubmitting) return false;
    if (state.selectedDate == null) return false;
    if (state.selectedDuration == null) return false;
    if (state.selectedSlotStart == null || state.selectedSlotEnd == null) return false;

    final list = state.selectedIsExtra ? state.extraSlots : state.normalSlots;
    final found = list.where((e) => e.start == state.selectedSlotStart).toList();
    if (found.isEmpty) return false;
    if (found.first.isDisabled) return false;
    return true;
  }

  Future<void> submitBooking() async {
    if (!canSubmit) return;
    emit(state.copyWith(isSubmitting: true));
    await Future.delayed(const Duration(milliseconds: 900));
    emit(state.copyWith(isSubmitting: false));
  }

  void _rebuildSlotsIfReady() {
    final stadium = _stadium;
    final day = state.selectedDate;
    final duration = state.selectedDuration;

    if (stadium == null || day == null || duration == null) {
      emit(state.copyWith(normalSlots: const [], extraSlots: const []));
      return;
    }

    final res = StadiumSlotsCalculator.buildForDay(
      stadium: stadium,
      selectedDay: day,
      bookings: _bookings,
      durationMinutes: duration,
      timeLabelLocale: 'ar',
    );

    var next = state.copyWith(
      normalSlots: res.normal.items,
      extraSlots: res.extra.items,
    );

    if (next.selectedSlotStart != null) {
      final list = next.selectedIsExtra ? next.extraSlots : next.normalSlots;
      final found = list.where((e) => e.start == next.selectedSlotStart).toList();

      if (found.isEmpty || found.first.isDisabled) {
        next = next.copyWith(
          selectedSlotStart: const Nullable<DateTime?>(null),
          selectedSlotEnd: const Nullable<DateTime?>(null),
          selectedIsExtra: false,
        );
      } else {
        next = next.copyWith(
          selectedSlotEnd: Nullable<DateTime?>(found.first.end),
        );
      }
    }

    emit(next);
  }
}
