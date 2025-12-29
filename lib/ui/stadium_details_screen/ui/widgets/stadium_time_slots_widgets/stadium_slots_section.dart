import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_time_slots_widgets/stadium_time_slots_grid.dart';

class StadiumSlotsSection extends StatefulWidget {
  const StadiumSlotsSection({
    super.key,
    required this.normalSlots,
    required this.extraSlots,
    this.onSlotSelected,
  });

  final List<SlotUiModel> normalSlots;
  final List<SlotUiModel> extraSlots;

  final void Function(String slotLabel, bool isExtra)? onSlotSelected;

  @override
  State<StadiumSlotsSection> createState() => _StadiumSlotsSectionState();
}

class _StadiumSlotsSectionState extends State<StadiumSlotsSection> {
  String? _selectedSlot;
  bool _selectedIsExtra = false;

  void _selectNormal(String label) {
    setState(() {
      _selectedSlot = label;
      _selectedIsExtra = false;
    });
    widget.onSlotSelected?.call(label, false);
  }

  void _selectExtra(String label) {
    setState(() {
      _selectedSlot = label;
      _selectedIsExtra = true;
    });
    widget.onSlotSelected?.call(label, true);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StadiumTimeSlotsGrid(
          slots: widget.normalSlots,
          selectedSlot: _selectedIsExtra ? null : _selectedSlot,
          onSlotSelected: _selectNormal,
        ),
        if (widget.extraSlots.isNotEmpty) ...[
          verticalSpace(14),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(Icons.info_outline, size: 16.sp, color: ColorPalette.grey),
              horizontalSpace(6),
              SectionTitle(
                title: "مواعيد إضافية",
                textStyle: Textstyles.font15GreySemiBold(),
              ),
            ],
          ),
          verticalSpace(10),
          StadiumTimeSlotsGrid(
            slots: widget.extraSlots,
            selectedSlot: _selectedIsExtra ? _selectedSlot : null,
            onSlotSelected: _selectExtra,
          ),
        ],
      ],
    );
  }
}
