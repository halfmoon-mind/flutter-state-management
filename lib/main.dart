import 'package:flutter/material.dart';
import 'package:statemangement_example/bloc/bloc.dart';
import 'package:statemangement_example/inherited_widget/inherited_widget.dart';
import 'package:statemangement_example/provider/provider.dart';
import 'package:statemangement_example/stateful_widget/stateful_widget.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                title: 'Stateful Widget Example',
                page: StatefulWidgetExample(),
              ),
              _Button(
                title: 'Inherited Widget Example',
                page: InheritedWidgetExample(),
              ),
              _Button(
                title: 'Provider Example',
                page: ProviderExample(),
              ),
              _Button(
                title: 'Bloc Example',
                page: BlocExample(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String title;
  final Widget page;

  const _Button({
    required this.title,
    required this.page,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => page));
        },
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(5),
          ),
          child: Text(title),
        ),
      ),
    );
  }
}
