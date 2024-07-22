import 'package:anga/controllers/cinema.dart';
import 'package:anga/controllers/navigation.dart';
import 'package:anga/views/functions/resolution.dart';
import 'package:anga/views/pages/Components/AppBar/wide_screen.dart';
import 'package:anga/views/pages/Payment/Tickets/ticketLayout.dart';
import 'package:anga/views/pages/Show/booking_stages.dart';
import 'package:anga/views/pages/Components/Footer/footer.dart';
import 'package:anga/views/themes/themes.dart';
import 'package:anga/views/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TicketView extends StatefulWidget {
  const TicketView({
    super.key,
  });

  @override
  State<TicketView> createState() => _TicketViewState();
}

class _TicketViewState extends State<TicketView> {
  final ScrollController filmScrollController = ScrollController();
  final NavigationController navigationController =
      Get.put(NavigationController());
  final CinemaController cinemaController = Get.put(CinemaController());

  @override
  Widget build(BuildContext context) {
    Map resolution = getResolution(context);
    double width = resolution['width'];
    double height = resolution['height'];

    navigationController.activePage.value = "";
    navigationController.activeIndex.value = 4;

    return Scaffold(
      backgroundColor: primaryBackGround(),
      body: Stack(children: [
        SizedBox(
          height: height,
          child: ScrollbarTheme(
            data: ScrollbarThemeData(
              thumbColor:
                  WidgetStateProperty.all(primaryForeGround().withOpacity(.75)),
              radius: const Radius.circular(5.0),
              thickness: WidgetStateProperty.all(width > 500 ? 7.0 : 3.0),
              thumbVisibility: WidgetStateProperty.all(true),
              trackVisibility: WidgetStateProperty.all(false),
              interactive: true,
              trackColor:
                  WidgetStateProperty.all(primaryColor().withOpacity(.2)),
            ),
            child: Scrollbar(
              controller: filmScrollController,
              radius: const Radius.circular(5.0),
              thickness: width > 500 ? 7.0 : 3.0,
              child: SingleChildScrollView(
                controller: filmScrollController,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const BookingStages(stage: 'ticket'),
                    SizedBox(width: width * .65, child: const TicketWidget()),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: SizedBox(
                        width: 250.0,
                        child: TextButton(
                            onPressed: () {},
                            child: Row(
                              children: [
                                Icon(
                                  Icons.download,
                                  color: secondaryColor(),
                                  size: 20.0,
                                ),
                                const SizedBox(
                                  width: 5.0,
                                ),
                                CustomText(
                                  text: 'download ticket',
                                  color: secondaryColor(),
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.w500,
                                  selectableText: false,
                                ),
                              ],
                            )),
                      ),
                    ),
                    Footer(width: width),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: width > 800
              ? CustomAppBar(
                  scrollController: filmScrollController,
                )
              : const SizedBox(),
        ),
      ]),
    );
  }
}
