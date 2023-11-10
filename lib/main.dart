// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';

import 'time.dart';

void main() {
  runApp(MaterialApp(
    title: "World Time App",
    initialRoute: '/main',
    routes: {
      '/main': (context) => const MyApp(),
      '/Display': (context) => const Display(),
    },
  ));
}

List<OnlineTime> countryList = [
  OnlineTime(location: 'Egypt', url: '/Africa/Cairo'),
  OnlineTime(location: 'Dubai', url: '/Asia/Dubai'),
  OnlineTime(location: 'Colombo', url: '/Asia/Colombo'),
  OnlineTime(location: 'Hong Kong', url: '/Asia/Hong_Kong'),
  OnlineTime(location: 'London', url: '/Europe/London'),
  OnlineTime(location: 'Moscow', url: '/Europe/Moscow'),
  OnlineTime(location: 'Berlin', url: '/Europe/Berlin'),
  OnlineTime(location: 'Tokyo', url: '/Asia/Tokyo'),
  OnlineTime(location: 'Paris', url: '/Europe/Paris'),
  OnlineTime(location: 'Johannesburg', url: '/Africa/Johannesburg'),
];

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Time App'),
      ),
      body: ListView.builder(
        itemCount: countryList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(countryList[index].location!),
            onTap: () {
              Navigator.pushNamed(context, '/Display',
                  arguments: countryList[index]);
            },
          );
        },
      ),
    );
  }
}

class Display extends StatefulWidget {
  const Display({super.key});
  @override
  State<Display> createState() => _MyDisplayState();

}

class _MyDisplayState extends State<Display> {
  @override
  Widget build(BuildContext context) {
    final OnlineTime myTime =
        ModalRoute.of(context)!.settings.arguments as OnlineTime;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Time Display'),
        ),
        body: Center(
          child: FutureBuilder<void>(

              future: myTime.gettime(),
              builder: (context, snapshot) {
                return Column(children: [
                  Text(
                    'Location: ${myTime.location}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Time:${myTime.time} ',
                    style: const TextStyle(fontSize: 30),
                  ),
                ]);
              },
              initialData: ()),
        ));
  }
}
