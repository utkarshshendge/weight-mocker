import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:ripen/app/services/notification_service.dart';
import 'dart:math' as math;

import 'package:ripen/app/ui/widgets/mocker_title.dart';

class AppIntroPage extends HookWidget {
  const AppIntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent, // <-- SEE HERE
          statusBarIconBrightness:
              Brightness.dark, //<-- For Android SEE HERE (dark icons)
          statusBarBrightness:
              Brightness.light, //<-- For iOS SEE HERE (dark icons)
        ),
        title: MockWeightTitle(),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.transparent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      floatingActionButton: FloatingActionButton.extended(
        heroTag: 'btn2',

        label: Row(
          children: [
            Text(
              "ROAST ME",
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: Theme.of(context).scaffoldBackgroundColor),
            ),
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.arrow_right_alt,
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          ],
        ),

        shape: RoundedRectangleBorder(
            borderRadius:
                BorderRadius.all(Radius.circular(1))), // isExtended: true,

        backgroundColor: Colors.red.shade800,
        onPressed: () {
          LocalNotificationService().showScheduledNotification(
              id: NotificationServiceIDs.postReset,
              title: "Relapsed? ▶️",
              payload: 'postreset',
              body: "📱 Tap to checkout motivational video.",
              scheduleDate: DateTime.now().add(Duration(seconds: 5)));
          // Vibration.vibrate(duration: 50);
          // AnalyticsService().setUserProperties();
          // Get.toNamed(RoutesClass.getOnboardingDateSelectionPage());
        },
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                  Theme.of(context).scaffoldBackgroundColor,
                  Theme.of(context).dialogBackgroundColor,
                ])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  height: kToolbarHeight + 32,
                ),
                Lottie.network(
                    height: MediaQuery.of(context).size.height / 2.5,
                    'https://lottie.host/92ea623f-d052-422a-9c58-1d18b4667f8f/ejj7kgE4Wn.json'),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Text(
                    "Not just a weight tracker.",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 12, top: 4),
                  child: Text(
                    "I will also roast you if your weight is not within the range of 65-75 kg. I'm assuming you're a male with a height of 5'8 for now",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                SizedBox(
                  height: 300,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
