import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:url_launcher/url_launcher.dart';

_launchURL() async {
  const String url = 'https://thingspeak.com/login?skipSSOCheck=true';
  if (await canLaunch(url)) {
    await launch(url, forceWebView: true, enableJavaScript: true);
  } else {
    throw 'Could not launch $url';
  }
}

class ThingSpeakPage extends StatefulWidget {
  const ThingSpeakPage({Key? key}) : super(key: key);

  @override
  _ThingSpeakState createState() => _ThingSpeakState();
}

class _ThingSpeakState extends State<ThingSpeakPage> {
  RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)));

  @override
  Widget build(BuildContext context) {
    return Center(
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
                    style: Theme.of(context).textTheme.headline6!)),
            ElevatedButton.icon(
              icon: const Icon(Icons.outbond),
              style: ElevatedButton.styleFrom(
                  shape: buttonRoundBorder,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 100.0)),
              onPressed: _launchURL,
              label: Text('New Channel',
                  style: Theme.of(context).textTheme.headline5!),
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.biotech),
                  Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(5.0),
                      child: const Text('CO2')),
                  const Icon(Icons.thermostat),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Temperature'),
                  ),
                  const Icon(Icons.water),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(5.0),
                    child: const Text('Humidity'),
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
                child:
                    Text('Save', style: Theme.of(context).textTheme.headline4!))
          ],
        ),
      ),
    );
  }
}
