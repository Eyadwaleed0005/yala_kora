import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_date_widgets/stadium_date_item_card.dart';

class StadiumDatesStrip extends StatefulWidget {
  const StadiumDatesStrip({
    super.key,
    required this.items,
    this.onDateSelected,
  });

  final List<StadiumDateItem> items;
  final ValueChanged<DateTime>? onDateSelected;
  @override
  State<StadiumDatesStrip> createState() => _StadiumDatesStripState();
}

class _StadiumDatesStripState extends State<StadiumDatesStrip> {
  DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
    final firstOpen = widget.items.where((e) => e.isOpen).toList();
    if (firstOpen.isNotEmpty) {
      selectedDate = firstOpen.first.date;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onDateSelected?.call(selectedDate!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SizedBox(
        height: 100.h,
        child: ListView.separated(
          clipBehavior: Clip.hardEdge,
          scrollDirection: Axis.horizontal,
          itemCount: widget.items.length,
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          separatorBuilder: (_, __) => horizontalSpace(10),
          itemBuilder: (context, index) {
            final item = widget.items[index];
            final isSelected = selectedDate != null &&
                selectedDate!.year == item.date.year &&
                selectedDate!.month == item.date.month &&
                selectedDate!.day == item.date.day;
            return StadiumDateItemCard(
              dayName: item.dayName,
              dayNumber: item.dayNumber,
              monthName: item.monthName,
              isOpen: item.isOpen,
              isSelected: isSelected,
              onTap: () {
                setState(() => selectedDate = item.date);
                widget.onDateSelected?.call(item.date);
              },
            );
          },
        ),
      ),
    );
  }
}
