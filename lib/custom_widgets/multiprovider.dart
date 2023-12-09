import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../pages/home_page.dart';
import '../provider/home_provider.dart';

class MltProvider extends StatelessWidget {
  const MltProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: HomeController()),
      ],
      child: MaterialApp(
        home: HomePage(),
      ),
    );
  }
}
