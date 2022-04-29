import 'package:devbook/src/binding/initbinding.dart';
import 'package:devbook/src/middlewares/auth_middleware.dart';
import 'package:devbook/src/ui/home/home_page.dart';
import 'package:devbook/src/ui/login/binding.dart';
import 'package:devbook/src/ui/login/login_page.dart';
import 'package:devbook/src/ui/signup/binding.dart';
import 'package:devbook/src/ui/signup/signup.dart';
import 'package:get/get.dart';

class MyRoutes {
  static const String signUp = '/signup';
  static const String signIn = '/signin';
  static const String home = '/home';
  static const String profile = '/profile';
  static const String settings = '/settings';
  static const String search = '/search';
  static const String message = '/message';
  static const String rootPage = '/';

  static List<GetPage> getPages = <GetPage>[
    // GetPage(
    //     name: rootPage, page: () => const RootPage(), binding: AuthBinding()),
    GetPage(
        name: signIn, page: () => const LoginPage(), binding: LoginBinding()),

    GetPage(
        name: signUp, page: () => const SignUpPage(), binding: SignUpBinding()),
    GetPage(
        name: home,
        page: () => const HomePage(),
        middlewares: [AuthMiddleware()],
        binding: InitialBinding()),

    // GetPage(name: profile, page: ()=>Profile()),
    // GetPage(name: settings, page: ()=>Settings()),
  ];
}
