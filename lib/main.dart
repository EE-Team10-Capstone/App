import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';

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
      theme: FlexThemeData.light(scheme: FlexScheme.deepBlue),
      darkTheme: FlexThemeData.dark(scheme: FlexScheme.deepBlue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    EdgeInsets padding = const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 60);

    return Scaffold(
        appBar: AppBar(
          title: const Text('UA-IoTENSR', style: TextStyle(fontSize: 32.0)),
          toolbarHeight: 80,
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 20,),
                  ElevatedButton.icon(
                    label: Text('BlueTooth Connect',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(color: Colors.white)
                          ),

                    icon: const Icon(Icons.bluetooth),

                    onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const WiFiPage()));
                    },

                    style: ElevatedButton.styleFrom(
                      padding: padding,
                      primary: Colors.lightBlue[600],
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      ),

                  ),                  
                ]
              ),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10,),
                  const Icon(Icons.devices_rounded),
                  SizedBox(width: 30,),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      padding: padding,
                      onSurface: FlexColor.blueDarkPrimaryVariant),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WiFiPage()));
                    },
                    child: Text(
                      'Device Setup',
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                    ),
                  ),
                ]
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,

                children: [
                  SizedBox(width: 10,),
                  const Icon(Icons.wifi),
                  SizedBox(width: 30,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 99.5),
                    ),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const WiFiPage()));
                    },
                    child: Text('WiFi Setup',
                        style: Theme.of(context)
                            .textTheme
                            .headline6!
                            .copyWith(color: Colors.white)),
                  ),

                ]
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
                        vertical: 16.0, horizontal: 48.0),
                    backgroundColor: Colors.blue[600]),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThingSpeakPage()));
                },
                child: Text('Begin Sampling',
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
                            .copyWith(color: Colors.white))),
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
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('CO2 Field'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Temperature Field'),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Humidity Field'),
                      ),
                    ]),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        value: '1',
                        items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        value: '2',
                        items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 48.0),
                      child: DropdownButton<String>(
                        alignment: Alignment.center,
                        value: '3',
                        items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                            .map((String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                ),
                TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 100.0),
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
