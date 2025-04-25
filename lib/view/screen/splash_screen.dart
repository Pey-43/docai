import 'package:dr_ai/utils/constant/image.dart';
import 'package:dr_ai/utils/constant/routes.dart';
import 'package:dr_ai/utils/helper/extention.dart';
import 'package:dr_ai/utils/helper/scaffold_snakbar.dart';
import 'package:dr_ai/logic/auth/log_out/log_out_cubit.dart';
import 'package:dr_ai/view/widget/loading_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constant/color.dart';
import '../../logic/chat/chat_cubit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    print('SplashScreen: initState called');
    getToLoginScreen();
  }

  void getToLoginScreen() {
    print('SplashScreen: Starting navigation delay');
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        print('SplashScreen: Navigation delay completed');
        if (mounted) {
          final user = FirebaseAuth.instance.currentUser;
          print('SplashScreen: Current user: ${user?.email}');
          print('SplashScreen: Email verified: ${user?.emailVerified}');

          final route = (user != null && user.emailVerified)
              ? RouteManager.nav
              : RouteManager.login;
          print('SplashScreen: Navigating to: $route');

          Navigator.pushReplacementNamed(context, route);
        } else {
          print('SplashScreen: Widget not mounted, skipping navigation');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    print('SplashScreen: Building widget');
    return Scaffold(
      backgroundColor: Colors.white, // Force white background for testing
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            SvgPicture.asset(
              ImageManager.splashLogo,
              width: context.width / 3,
              height: context.width / 3,
              colorFilter: const ColorFilter.mode(Colors.black,
                  BlendMode.srcIn), // Force black color for testing
            ),
            const BuidSplashLoadingIndicator(),
          ],
        ),
      ),
    );
  }
}
