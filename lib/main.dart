import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:los_hambrientos/src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // * For more info on error handling, see:
  // * https://docs.flutter.dev/testing/errors

  await runZonedGuarded(() async {
// turn off the # in the URLs on the web
    GoRouter.setUrlPathStrategy(UrlPathStrategy.path);

// * Entry point of the app
    runApp(const ProviderScope(child: MyApp()));

    // * This code will present some error UI if any uncaught exception happens
    FlutterError.onError = (FlutterErrorDetails details) {
      FlutterError.presentError(details);
    };
    ErrorWidget.builder = (FlutterErrorDetails details) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text('An error occurred'),
        ),
        body: Center(child: Text(details.toString())),
      );
    };
  }, (Object error, StackTrace stack) {
    // * log any errors to console
    debugPrint(error.toString());
  });
}
