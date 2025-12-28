import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yalakora/core/fake_data/fake_stadiums_data.dart';
import 'package:yalakora/core/helper/app_system_ui.dart';
import 'package:yalakora/core/helper/spacer.dart';
import 'package:yalakora/core/style/app_color.dart';
import 'package:yalakora/core/style/textstyles.dart';
import 'package:yalakora/core/widgets/section_title.dart';
import 'package:yalakora/core/widgets/system_ui_wrapper.dart';
import 'package:yalakora/core/helper/stadium_booking_date_helper.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/green_outline_action_button.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_basic_info_card.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/stadium_details_cover.dart';
import 'package:yalakora/ui/stadium_details_screen/ui/widgets/booking_details_card.dart';

class StadiumDetailsScreen extends StatelessWidget {
  const StadiumDetailsScreen({super.key, required this.stadiumId});

  final String stadiumId;

  @override
  Widget build(BuildContext context) {
    final stadium = FakeStadiumsData.getById(stadiumId)!;

    final dateItems = StadiumBookingDateHelper.buildDateStrip(
      workingDays: stadium.workingDays,
      count: 8,
    );

    return SystemUiWrapper(
      style: AppSystemUi.dark(),
      child: Scaffold(
        backgroundColor: ColorPalette.offWhite,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StadiumDetailsCover(
                imageUrl: stadium.coverImage,
                rating: stadium.rating,
                onFavoriteTap: () {},
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SectionTitle(
                      title: "تفاصيل الملعب",
                      textStyle: Textstyles.font17DarkBlueMedium(),
                    ),
                    verticalSpace(15),
                    StadiumBasicInfoCard(
                      stadiumName: stadium.name,
                      ownerName: stadium.ownerName!,
                      location: stadium.location,
                      address: stadium.address!,
                    ),
                    verticalSpace(20),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          GreenOutlineActionButton(
                            title: 'الخريطة',
                            icon: Icons.location_on_outlined,
                            onTap: () {},
                          ),
                          horizontalSpace(8),
                          GreenOutlineActionButton(
                            title: 'واتساب',
                            icon: FontAwesomeIcons.whatsapp,
                            onTap: () {},
                          ),
                          horizontalSpace(8),
                          GreenOutlineActionButton(
                            title: 'اتصال',
                            icon: Icons.call_outlined,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ),
                    verticalSpace(20),
                    BookingDetailsCard(
                      dateItems: dateItems,
                      onDateSelected: (date) {},
                    ),
                    verticalSpace(30),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
