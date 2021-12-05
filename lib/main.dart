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
        //    body: SafeArea(
        //Home Page View
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
        // )
        //)
        appBar: AppBar(title: Text('WiFi Setup')),
        body: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  padding: EdgeInsets.all(8.0),
                  margin: EdgeInsets.symmetric(vertical: 15.0),
                  alignment: Alignment.center,
                  child: Text(
                    'Please insert your WiFi Credentials below',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.black),
                  )),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(15.0),
                      margin: EdgeInsets.symmetric(vertical: 30),
                      alignment: Alignment.centerLeft,
                      child: Text('SSID',
                          style: Theme.of(context)
                              .textTheme
                              .headline6!
                              .copyWith(color: Colors.black))),
                  Flexible(
                      child: const TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(), labelText: 'SSID'),
                  ))
                ],
              )
            ],
          ),
        ));
  }
}
