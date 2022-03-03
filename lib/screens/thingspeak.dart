import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:regexpattern/regexpattern.dart';

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

  final _TSKey = GlobalKey<FormState>();

  //Creating TextEditingControllers
  late TextEditingController _WRAPIcontroller;
  late TextEditingController _RDAPIcontroller;
  late TextEditingController _CHANIDcontroller;

  //Initializing string values for text values
  String writeapikey = '';
  String readapikey = '';
  String channelid = '';

  //Setting default channel values for dropdown menus.
  String channelCO2 = '1';
  String channelTemp = '2';
  String channelRH = '3';

  //Defining ThingSpeak Credential max lengths
  int APImaxlength = 16;
  int ChannelIDmaxlength = 7;

  @override
  void initState() {
    super.initState();
    _WRAPIcontroller = TextEditingController();
    _RDAPIcontroller = TextEditingController();
    _CHANIDcontroller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _TSKey,
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
                style: Theme.of(context).textTheme.headline6!),
          ),
          TextFormField(
            controller: _WRAPIcontroller,
            maxLength: APImaxlength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Write API Key'),
            validator: (text) {
              if (text == null || text.length != APImaxlength) {
                return 'Please Enter the Correct Write API Key';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _RDAPIcontroller,
            maxLength: APImaxlength,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Read API Key'),
            validator: (text) {
              if (text == null || text.length != APImaxlength) {
                return 'Please Enter the Correct Read API Key';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _CHANIDcontroller,
            maxLength: ChannelIDmaxlength,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
                border: OutlineInputBorder(), labelText: 'Channel ID'),
            validator: (text) {
              if (text == null ||
                  text.length != ChannelIDmaxlength ||
                  !text.isNumeric()) {
                return 'Please Enter the Correct Channel ID';
              }
              return null;
            },
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
                  value: channelCO2,
                  items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newchannelCO2) {
                    setState(() {
                      channelCO2 = newchannelCO2!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: DropdownButton<String>(
                  alignment: Alignment.center,
                  value: channelTemp,
                  items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newchannelTemp) {
                    setState(() {
                      channelTemp = newchannelTemp!;
                    });
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 48.0),
                child: DropdownButton<String>(
                  alignment: Alignment.center,
                  value: channelRH,
                  items: <String>['1', '2', '3', '4', '5', '6', '7', '8']
                      .map((String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: Text(value));
                  }).toList(),
                  onChanged: (String? newchannelRH) {
                    setState(() {
                      channelRH = newchannelRH!;
                    });
                  },
                ),
              ),
            ],
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: buttonRoundBorder,
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 100.0)),
              onPressed: () {
                if (_TSKey.currentState!.validate()) {
                  // Process data.
                }
              },
              child:
                  Text('Save', style: Theme.of(context).textTheme.headline4!))
        ],
      ),
    );
  }
}
