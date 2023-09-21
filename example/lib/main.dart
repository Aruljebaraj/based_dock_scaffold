import 'package:flutter/material.dart';
import 'package:based_dock_scaffold/based_dock_scaffold.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late bool _isDark = true;

  void changeThemeMode() => setState(() => _isDark = !_isDark);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Based Dock Scaffold Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: BasedDockScaffold(
        appBar: AppBar(
          title: const Text('Based Dock Scaffold'),
          actions: [
            IconButton(
              onPressed: changeThemeMode,
              icon: const Icon(Icons.color_lens_rounded),
            )
          ],
        ),
        body: const Center(
          child: Wrap(
            spacing: 8,
            direction: Axis.vertical,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Text('Pull Up The Dock!'),
              ShowButton(),
              Text('Click Outside To Hide The Dock!'),
            ],
          ),
        ),
        dockChild: const Wrap(
          spacing: 8,
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          children: [
            ErrorShowButton(),
          ],
        ),
      ),
    );
  }
}

class ErrorShowButton extends StatelessWidget {
  const ErrorShowButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip:
          '**_DO NOT_** use `BasedDockScaffold.of(context)` in the subtree of `dockChild`',
      onPressed: () {
        final state = BasedDockScaffold.of(context);
        state.showDock();
      },
      icon: const Icon(Icons.error, color: Colors.red),
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
        state.showDock();
      },
      child: const Text('Show Up The Dock!'),
    );
  }
}
