import 'package:hiw/presentation/startupscreen_screen/startupscreen_screen.dart';
import 'package:hiw/presentation/startupscreen_screen/binding/startupscreen_binding.dart';
import 'package:hiw/presentation/walkthrough_one_screen/walkthrough_one_screen.dart';
import 'package:hiw/presentation/walkthrough_one_screen/binding/walkthrough_one_binding.dart';
import 'package:hiw/presentation/walkthrough_two_screen/walkthrough_two_screen.dart';
import 'package:hiw/presentation/walkthrough_two_screen/binding/walkthrough_two_binding.dart';
import 'package:hiw/presentation/walkthrough_three_screen/walkthrough_three_screen.dart';
import 'package:hiw/presentation/walkthrough_three_screen/binding/walkthrough_three_binding.dart';
import 'package:hiw/presentation/los_screen/los_screen.dart';
import 'package:hiw/presentation/los_screen/binding/los_binding.dart';
import 'package:hiw/presentation/login_screen/login_screen.dart';
import 'package:hiw/presentation/login_screen/binding/login_binding.dart';
import 'package:hiw/presentation/sign_up_screen/sign_up_screen.dart';
import 'package:hiw/presentation/sign_up_screen/binding/sign_up_binding.dart';
import 'package:hiw/presentation/app_navigation_screen/app_navigation_screen.dart';
import 'package:hiw/presentation/app_navigation_screen/binding/app_navigation_binding.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String startupscreenScreen = '/startupscreen_screen';

  static const String walkthroughOneScreen = '/walkthrough_one_screen';

  static const String walkthroughTwoScreen = '/walkthrough_two_screen';

  static const String walkthroughThreeScreen = '/walkthrough_three_screen';

  static const String losScreen = '/los_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static String initialRoute = '/initialRoute';

  static List<GetPage> pages = [
    GetPage(
      name: startupscreenScreen,
      page: () => StartupscreenScreen(),
      bindings: [
        StartupscreenBinding(),
      ],
    ),
    GetPage(
      name: walkthroughOneScreen,
      page: () => WalkthroughOneScreen(),
      bindings: [
        WalkthroughOneBinding(),
      ],
    ),
    GetPage(
      name: walkthroughTwoScreen,
      page: () => WalkthroughTwoScreen(),
      bindings: [
        WalkthroughTwoBinding(),
      ],
    ),
    GetPage(
      name: walkthroughThreeScreen,
      page: () => WalkthroughThreeScreen(),
      bindings: [
        WalkthroughThreeBinding(),
      ],
    ),
    GetPage(
      name: losScreen,
      page: () => LosScreen(),
      bindings: [
        LosBinding(),
      ],
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginScreen(),
      bindings: [
        LoginBinding(),
      ],
    ),
    GetPage(
      name: signUpScreen,
      page: () => SignUpScreen(),
      bindings: [
        SignUpBinding(),
      ],
    ),
    GetPage(
      name: appNavigationScreen,
      page: () => AppNavigationScreen(),
      bindings: [
        AppNavigationBinding(),
      ],
    ),
    GetPage(
      name: initialRoute,
      page: () => StartupscreenScreen(),
      bindings: [
        StartupscreenBinding(),
      ],
    )
  ];
}
