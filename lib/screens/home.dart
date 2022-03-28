import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:app/providers/ble_provider.dart';
import 'package:app/screens/setup.dart';

//Readjust in the AM for deactivating BLE Connect button after it is pressed, do
//something similar for when the device is disconnected
class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    RoundedRectangleBorder buttonRoundBorder = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)));
    EdgeInsets buttonPadding =
        const EdgeInsets.symmetric(vertical: 16.0, horizontal: 60);

    return Scaffold(
      appBar: AppBar(
        title:
            Text('UA-IoTENSR', style: GoogleFonts.montserrat(fontSize: 36.0)),
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
                label: Text('Bluetooth Connect',
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(color: Colors.white)),
                onPressed: () async {
                  await context.read<BLE>().scanBLE();
                },
                style: ElevatedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: Colors.lightBlue[600],
                )),
            OutlinedButton.icon(
              icon: const Icon(Icons.settings),
              label: Text('Setup Menu',
                  style: Theme.of(context).textTheme.headline6!),
              style: OutlinedButton.styleFrom(
                  padding: buttonPadding,
                  shape: buttonRoundBorder,
                  primary: FlexColor.deepBlueDarkPrimaryVariant),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const SetupMenu()));
              },
            ),
            ElevatedButton.icon(
              icon: const Icon(Icons.done_outline_rounded),
              label: Text('Begin Sampling',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white)),
              style: ElevatedButton.styleFrom(
                  padding: buttonPadding, shape: buttonRoundBorder),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
