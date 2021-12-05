import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('UA-IoTENSR', style: TextStyle(fontSize: 32.0)),
          toolbarHeight: 96.0,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 32.0),
                    backgroundColor: Colors.blue[600],
                    alignment: Alignment.center),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WiFiPage()));
                },
                child: Text('BlueTooth Connect ',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 82.0),
                    backgroundColor: Colors.blue[600]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WiFiPage()));
                },
                child: Text('Device Setup',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 99.5),
                    backgroundColor: Colors.blue[600]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WiFiPage()));
                },
                child: Text('WiFi Setup',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 43.5),
                    backgroundColor: Colors.blue[600]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThingSpeakPage()));
                },
                child: Text('ThingSpeak Setup',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
              TextButton(
                style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16.0, horizontal: 43.5),
                    backgroundColor: Colors.blue[600]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThingSpeakPage()));
                },
                child: Text('Send To Device',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: Colors.white)),
              ),
            ],
          ),
        ));
  }
}

class WiFiPage extends StatefulWidget {
  const WiFiPage({Key? key}) : super(key: key);

  @override
  _WiFiPageState createState() => _WiFiPageState();
}

class _WiFiPageState extends State<WiFiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('WiFi Setup')),
        body: Center(
          child: Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 15.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Please insert your WiFi Credentials below',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                    )),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'SSID'),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Username'),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Password'),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 132.0),
                        backgroundColor: Colors.blue[600]),
                    onPressed: () {},
                    child: Text('Continue',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white)))
              ],
            ),
          ),
        ));
  }
}

class ThingSpeakPage extends StatefulWidget {
  const ThingSpeakPage({Key? key}) : super(key: key);

  @override
  _ThingSpeakState createState() => _ThingSpeakState();
}

class _ThingSpeakState extends State<ThingSpeakPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('ThingSpeakPage Setup')),
        body: Center(
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                    padding: const EdgeInsets.all(8.0),
                    margin: const EdgeInsets.symmetric(vertical: 8.0),
                    alignment: Alignment.center,
                    child: Text(
                      'Please insert your ThingSpeakPage Channel Credentials below',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.black),
                    )),
                TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 100.0),
                      backgroundColor: Colors.blue[600]),
                  onPressed: () {},
                  child: Text('New Channel',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white)),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Write API Key'),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Read API Key'),
                ),
                const TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Channel ID'),
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 132.0),
                        backgroundColor: Colors.blue[600]),
                    onPressed: () {},
                    child: Text('Continue',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.white)))
              ],
            ),
          ),
        ));
  }
}
