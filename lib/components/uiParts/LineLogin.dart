import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:flutter_starter/auth/AuthManager.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineLogin extends ConsumerWidget {
  const LineLogin({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
        width: 300,
        height: 50,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff06C755),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () => ref.read(authManagerProvider).signInWithLine(),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  flex: 1,
                  child: Center(
                    child: SvgPicture.asset(
                      'assets/images/line.svg',
                      semanticsLabel: 'LINE',
                      width: 30,
                      height: 30,
                    ),
                  )),
              const Expanded(
                  flex: 1,
                  child: Center(
                      child: VerticalDivider(
                    color: Colors.white,
                  ))),
              const Expanded(
                  flex: 8,
                  child: Center(
                    child: Text(
                      'Sign In with LINE',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
            ],
          ),
        ));
  }
}
