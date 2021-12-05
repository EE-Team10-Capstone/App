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

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //     body: SafeArea(
        //         child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Container(
        //       constraints: BoxConstraints.expand(
        //         height:
        //             Theme.of(context).textTheme.headline4!.fontSize! * 1 + 100.0,
        //       ),
        //       padding: const EdgeInsets.all(20.0),
        //       color: Colors.blue[600],
        //       alignment: Alignment.center,
        //       child: Text('UA-IOTENSR',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline4!
        //               .copyWith(color: Colors.white)),
        //     ),
        //     Container(
        //       constraints: BoxConstraints.expand(
        //           height:
        //               Theme.of(context).textTheme.headline4!.fontSize! * 1 + 50),
        //       margin: const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
        //       padding: const EdgeInsets.symmetric(horizontal: 15.0),
        //       color: Colors.blue[600],
        //       alignment: Alignment.center,
        //       child: Text('Bluetooth Connect',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline4!
        //               .copyWith(color: Colors.white)),
        //     ),
        //     Container(
        //       constraints: BoxConstraints.expand(
        //           height:
        //               Theme.of(context).textTheme.headline4!.fontSize! * 1 + 50.0),
        //       margin: const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
        //       padding: const EdgeInsets.all(8.0),
        //       color: Colors.blue[600],
        //       alignment: Alignment.center,
        //       child: Text('Device Setup',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline4!
        //               .copyWith(color: Colors.white)),
        //     ),
        //     Container(
        //       constraints: BoxConstraints.expand(
        //           height:
        //               Theme.of(context).textTheme.headline4!.fontSize! * 1 + 50.0),
        //       margin: const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
        //       padding: const EdgeInsets.all(8.0),
        //       color: Colors.blue[600],
        //       alignment: Alignment.center,
        //       child: Text('WiFi Setup',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline4!
        //               .copyWith(color: Colors.white)),
        //     ),
        //     Container(
        //       constraints: BoxConstraints.expand(
        //           height:
        //               Theme.of(context).textTheme.headline4!.fontSize! * 1 + 50.0),
        //       margin: const EdgeInsets.only(top: 50.0, right: 15.0, left: 15.0),
        //       padding: const EdgeInsets.all(8.0),
        //       color: Colors.blue[600],
        //       alignment: Alignment.center,
        //       child: Text('ThingSpeak Setup',
        //           style: Theme.of(context)
        //               .textTheme
        //               .headline4!
        //               .copyWith(color: Colors.white)),
        //     ),
        //   ],
        // )));

        // WiFi Setup Page
        appBar: AppBar(title: Text('WiFi Setup')),
        body: Container(
          alignment: Alignment.center,
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
              Container(
                  padding: const EdgeInsets.all(16.0),
                  margin: const EdgeInsets.symmetric(
                      vertical: 30.0, horizontal: 15.0),
                  alignment: Alignment.center,
                  color: Colors.blue[600],
                  child: Text('Continue',
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(color: Colors.white)))
            ],
          ),
        ));

    // Thingspeak Setup Page
    // appBar: AppBar(title: const Text('ThingSpeak Setup')),
    // body: Container(
    //   alignment: Alignment.center,
    //   margin: const EdgeInsets.symmetric(horizontal: 8.0),
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Container(
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(vertical: 16.0),
    //           alignment: Alignment.center,
    //           child: Text(
    //             'Please insert your ThingSpeak Channel Credentials below',
    //             style: Theme.of(context)
    //                 .textTheme
    //                 .headline6!
    //                 .copyWith(color: Colors.black),
    //           )),
    //       Container(
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(
    //               vertical: 16.0, horizontal: 16.0),
    //           alignment: Alignment.center,
    //           color: Colors.blue[600],
    //           child: Text('New Channel',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .headline4!
    //                   .copyWith(color: Colors.white))),
    //       const TextField(
    //         decoration: InputDecoration(
    //             border: OutlineInputBorder(), labelText: 'Write API Key'),
    //       ),
    //       const TextField(
    //         decoration: InputDecoration(
    //             border: OutlineInputBorder(), labelText: 'Read API Key'),
    //       ),
    //       const TextField(
    //         decoration: InputDecoration(
    //             border: OutlineInputBorder(), labelText: 'Channel ID'),
    //       ),
    //       Container(
    //           padding: const EdgeInsets.all(8.0),
    //           margin: const EdgeInsets.symmetric(
    //               vertical: 16.0, horizontal: 16.0),
    //           alignment: Alignment.center,
    //           color: Colors.blue[600],
    //           child: Text('Continue',
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .headline4!
    //                   .copyWith(color: Colors.white)))
    //     ],
    //   ),
    // ));
  }
}
