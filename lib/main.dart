import 'package:flutter/material.dart';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:app_settings/app_settings.dart';

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
      theme: FlexThemeData.light(
        scheme: FlexScheme.deepBlue),
      darkTheme: FlexThemeData.dark(
        scheme: FlexScheme.deepBlue),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));
    EdgeInsets buttonPadding = const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60);

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
              
              ElevatedButton.icon(
                icon: const Icon(Icons.bluetooth),
                label: Text('BlueTooth Connect',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)),

                onPressed: AppSettings.openBluetoothSettings,
                
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: Colors.lightBlue[600],
                  ),
              ),
                   

              OutlinedButton.icon(
                icon: const Icon(Icons.wifi),
                label: Text('WiFi Setup',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!),   
                style: OutlinedButton.styleFrom(
                    padding: buttonPadding,
                    shape: buttonRoundBorder,
                    primary: FlexColor.deepBlueDarkPrimaryVariant
                    ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WiFiPage()));
                },
              ),

              OutlinedButton.icon(
                icon: const Icon(Icons.auto_graph_sharp),
                label: Text('ThingSpeak Setup',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!),
                style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: FlexColor.deepBlueDarkPrimaryVariant
                  ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThingSpeakPage()));
                },
              ),

              OutlinedButton.icon(
                icon: const Icon(Icons.devices_rounded),
                label: Text('Device Setup',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!),
                style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: FlexColor.deepBlueDarkPrimaryVariant),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const WiFiPage()));
                },
              ),

              ElevatedButton.icon(
                icon: const Icon(Icons.done_outline_rounded),
                label: Text('Begin Sampling',
                  style: Theme.of(context)
                    .textTheme
                    .headline6!),
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ThingSpeakPage()));
                },
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 100.0),),
                    onPressed: () {},
                    child: Text('Continue',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!)
                ),
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

  RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20)));
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
                ElevatedButton.icon(
                  icon: const Icon(Icons.outbond),
                  style: ElevatedButton.styleFrom(
                      shape: buttonRoundBorder,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 100.0)),
                  onPressed: () {},
                  label: Text('New Channel',
                      style: Theme.of(context)
                          .textTheme
                          .headline5!),
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
                      const Icon(Icons.biotech),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('CO2 Field')
                      ),
                      const Icon(Icons.thermostat),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(8.0),
                        child: const Text('Temperature Field'),
                      ),
                      const Icon(Icons.water),
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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: buttonRoundBorder,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 100.0)),
                    onPressed: () {},
                    child: Text('Continue',
                        style: Theme.of(context)
                            .textTheme
                            .headline4!)
                )
              ],
            ),
          ),
        ));
  }
}
