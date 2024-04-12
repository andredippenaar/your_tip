import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Your Tip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const YourTip(),
    );
  }
}

class YourTip extends StatefulWidget {
  const YourTip({super.key});

  @override
  State<YourTip> createState() => _YourTipState();
}

class _YourTipState extends State<YourTip> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('You Tip'),
      ),
      body: Column(
        children: [
          Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  const Text("Total per Person"),
                  const Text("R20"),
                ],
              )),
        ],
      ),
    );
  }
}
