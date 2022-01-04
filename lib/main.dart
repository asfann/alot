import 'dart:io';

import 'package:alot/view/crypto_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());

  FlutterError.onError = (FlutterErrorDetails details){
    FlutterError.presentError(details);
    if(kReleaseMode)
      exit(1);
  };
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Crypto currency',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            primaryColor: Colors.white,

        ),
        home: CryptoScreen(),
    );
  }
}
