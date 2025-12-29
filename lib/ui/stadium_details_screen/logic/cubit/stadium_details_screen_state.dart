import 'package:meta/meta.dart';
import 'package:yalakora/core/helper/stadium_slots_calculator.dart';

@immutable
class StadiumDetailsScreenState {
  final DateTime? selectedDate;
  final int? selectedDuration;

  final DateTime? selectedSlotStart;
  final DateTime? selectedSlotEnd;
  final bool selectedIsExtra;

  final List<SlotUiItem> normalSlots;
  final List<SlotUiItem> extraSlots;

  final bool isSubmitting;

  const StadiumDetailsScreenState({
    required this.selectedDate,
    required this.selectedDuration,
    required this.selectedSlotStart,
    required this.selectedSlotEnd,
    required this.selectedIsExtra,
    required this.normalSlots,
    required this.extraSlots,
    required this.isSubmitting,
  });

  factory StadiumDetailsScreenState.initial() {
    return const StadiumDetailsScreenState(
      selectedDate: null,
      selectedDuration: null,
      selectedSlotStart: null,
      selectedSlotEnd: null,
      selectedIsExtra: false,
      normalSlots: [],
      extraSlots: [],
      isSubmitting: false,
    );
  }

  StadiumDetailsScreenState copyWith({
    DateTime? selectedDate,
    int? selectedDuration,
    Nullable<DateTime?>? selectedSlotStart,
    Nullable<DateTime?>? selectedSlotEnd,
    bool? selectedIsExtra,
    List<SlotUiItem>? normalSlots,
    List<SlotUiItem>? extraSlots,
    bool? isSubmitting,
  }) {
    return StadiumDetailsScreenState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedDuration: selectedDuration ?? this.selectedDuration,
      selectedSlotStart: selectedSlotStart != null
          ? selectedSlotStart.value
          : this.selectedSlotStart,
      selectedSlotEnd:
          selectedSlotEnd != null ? selectedSlotEnd.value : this.selectedSlotEnd,
      selectedIsExtra: selectedIsExtra ?? this.selectedIsExtra,
      normalSlots: normalSlots ?? this.normalSlots,
      extraSlots: extraSlots ?? this.extraSlots,
      isSubmitting: isSubmitting ?? this.isSubmitting,
    );
  }
}

class Nullable<T> {
  final T value;
  const Nullable(this.value);
}
