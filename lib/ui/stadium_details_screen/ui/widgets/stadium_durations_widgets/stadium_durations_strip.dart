import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_durations_widgets/stadium_duration_item_card.dart';

class StadiumDurationsStrip extends StatefulWidget {
  const StadiumDurationsStrip({
    super.key,
    this.onDurationSelected,
    this.initialDuration,
    this.isEnabled = true,
  });

  final ValueChanged<int>? onDurationSelected;
  final int? initialDuration;
  final bool isEnabled;

  @override
  State<StadiumDurationsStrip> createState() => _StadiumDurationsStripState();
}

class _StadiumDurationsStripState extends State<StadiumDurationsStrip> {
  int? selectedDuration;

  final List<int> durations = const [60, 90, 120];

  @override
  void initState() {
    super.initState();
    selectedDuration = widget.initialDuration;

    if (selectedDuration != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        widget.onDurationSelected?.call(selectedDuration!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Row(
        children: durations.map((minutes) {
          final isSelected = selectedDuration == minutes;

          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w),
              child: StadiumDurationItemCard(
                minutes: minutes,
                isSelected: isSelected,
                onTap: widget.isEnabled
                    ? () {
                        setState(() => selectedDuration = minutes);
                        widget.onDurationSelected?.call(minutes);
                      }
                    : null,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
