import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/stadium_time_slot_item_card.dart';

class StadiumTimeSlotsGrid extends StatelessWidget {
  const StadiumTimeSlotsGrid({
    super.key,
    required this.slots,
    required this.selectedSlot,
    this.onSlotSelected,
    this.isEnabled = true,
  });

  final List<SlotUiModel> slots;
  final String? selectedSlot;
  final ValueChanged<String>? onSlotSelected;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: slots.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10.w,
          mainAxisSpacing: 10.h,
          childAspectRatio: 2.9,
        ),
        itemBuilder: (context, index) {
          final slot = slots[index];
          final isSelected = selectedSlot == slot.label;
          final isDisabled = slot.isDisabled || !isEnabled;

          return StadiumTimeSlotItemCard(
            label: slot.label,
            isSelected: isSelected,
            isDisabled: isDisabled,
            onTap: isDisabled ? null : () => onSlotSelected?.call(slot.label),
          );
        },
      ),
    );
  }
}

class SlotUiModel {
  const SlotUiModel({required this.label, required this.isDisabled});

  final String label;
  final bool isDisabled;
}
