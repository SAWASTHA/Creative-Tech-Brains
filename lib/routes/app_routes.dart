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
import 'package:hiw/presentation/Homescreen/home_screen.dart';
import 'package:hiw/presentation/calinderscreen/calander_screen.dart';
import 'package:hiw/presentation/mapscreen/maps_screen.dart';
import 'package:hiw/presentation/profilescreen/profile_screen.dart';
import 'package:hiw/presentation/searchscreen/search_screen.dart';
import 'package:hiw/presentation/searchscreen/binding/startupscreen_binding.dart';
import 'package:hiw/presentation/profilescreen/binding/profilebinding.dart';
import 'package:hiw/presentation/mapscreen/binding/mapbinding.dart';
import 'package:hiw/presentation/Homescreen/binding/homebinding.dart';
import 'package:hiw/presentation/calinderscreen/binding/calinderbinding.dart';

import '../presentation/EditProfile/binding/editbinding.dart';
import '../presentation/EditProfile/editprofile.dart';
import '../presentation/doctorsappointment/binding/doctorsappointment_binding.dart';
import '../presentation/doctorsappointment/doctorsappointmenttt.dart';
import '../presentation/hospitalData/binding/hospitalData_binding.dart';
import '../presentation/hospitalData/hospitalDataa.dart';
import '../presentation/searchscreen/doctor search/binding/doctorsearchbinding.dart';
import '../presentation/searchscreen/doctor search/doctorsearch.dart';
import '../presentation/searchscreen/hospitalsearch/binding/hospitalsearchbinding.dart';
import '../presentation/searchscreen/hospitalsearch/hospitalsearch.dart';
import '../presentation/searchscreen/store search/binding/storesearchbinding.dart';
import '../presentation/searchscreen/store search/storesearch.dart';

class AppRoutes {
  static const String startupscreenScreen = '/startupscreen_screen';

  static const String walkthroughOneScreen = '/walkthrough_one_screen';

  static const String walkthroughTwoScreen = '/walkthrough_two_screen';

  static const String walkthroughThreeScreen = '/walkthrough_three_screen';

  static const String losScreen = '/los_screen';

  static const String loginScreen = '/login_screen';

  static const String signUpScreen = '/sign_up_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static const String searchScreen = '/search_screen';
  static const String calanderScreen = '/calander_screen';
  static const String profileScreen = '/profile_screen';
  static const String mapsScreen = '/maps_screen';
  static const String homeScreen = '/home_screen';
  static const String editprofilescreen = '/editprofile';
  static const String hospitalDataa = '/hospitalDataa';
  static const String hospitalsearchh = '/hospitalsearch';
  static const String doctor = '/doctorsearch';
  static const String store = '/storesearch';
  static const String doctorappointmentt = '/doctorsapponitmenttt';

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
    ),
    GetPage(
      name: searchScreen,
      page: () => search(),
      bindings: [
        searchBinding(),
      ],
    ),
    GetPage(
      name: profileScreen,
      page: () => profile(),
      bindings: [
        profileBinding(),
      ],
    ),
    GetPage(
      name: mapsScreen,
      page: () => Mapp(),
      bindings: [
        mapBinding(),
      ],
    ),
    GetPage(
      name: homeScreen,
      page: () => Home(),
      bindings: [
        homeBinding(),
      ],
    ),
    GetPage(
      name: calanderScreen,
      page: () => calander(),
      bindings: [
        calinderBinding(),
      ],
    ),
    GetPage(name: editprofilescreen, page: () => editprofile(), bindings: [
      editBinding(),
    ]),
    GetPage(
      name: hospitalDataa,
      page: () => hospitalData(
        email: null,
      ),
      bindings: [
        hospitalDataBinding(),
      ],
    ),
    GetPage(
      name: hospitalsearchh,
      page: () => hospitalsearch(),
      bindings: [
        hospitalsearchBinding(),
      ],
    ),
    GetPage(
      name: doctor,
      page: () => doctorsearch(),
      bindings: [
        doctorsearchBinding(),
      ],
    ),
    GetPage(
      name: store,
      page: () => storesearch(),
      bindings: [
        storesearchBinding(),
      ],
    ),
    GetPage(
      name: doctorappointmentt,
      page: () => Doctorsappointmenttt(dname: null,),
      bindings: [
        doctorsappointmentBinding(),
      ],
    ),
  ];
}
