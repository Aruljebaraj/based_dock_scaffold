import 'package:flutter/material.dart';
import 'package:based_dock_scaffold/based_dock_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          brightness: MediaQuery.platformBrightnessOf(context),
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: BasedDockScaffold(
        appBar: AppBar(
          title: const Text('BasedDockScaffold'),
        ),
        body: const Center(
          child: Wrap(
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            children: [
              Text('Pull Up The Dock!'),
              ShowButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ShowButton extends StatelessWidget {
  const ShowButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        final state = BasedDockScaffold.of(context);
        state.show();
      },
      child: const Text('Show Up The Dock!'),
    );
  }
}
