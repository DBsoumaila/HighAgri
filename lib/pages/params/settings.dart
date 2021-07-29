import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_settings_screens/flutter_settings_screens.dart';

import 'package:ha2/pages/params/params_ittems.dart';

ValueNotifier<Color> accentColor = ValueNotifier(Colors.blueAccent);

void main() {
  initSettings().then((_) {
    runApp(Params());
  });
}

Future<void> initSettings() async {
  await Settings.init(
    cacheProvider: _isUsingHive ? HiveCache() : SharePreferenceCache(),
  );
  accentColor = ValueNotifier(Colors.blueAccent);
}

bool _isDarkTheme = true;
bool _isUsingHive = true;

class Params extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return MyHomePage(title: 'Paramètres');
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required this.title});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Color>(
      valueListenable: accentColor,
      builder: (_, color, __) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Settings Demo',
        theme: _isDarkTheme
            ? ThemeData.dark().copyWith(accentColor: color)
            : ThemeData.light().copyWith(accentColor: color),
        home: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: <Widget>[
                _buildThemeSwitch(context),
                _buildPreferenceSwitch(context),
                SizedBox(
                  height: 50.0,
                ),
                AppBody(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildPreferenceSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Partager Pref'),
        Switch(
            activeColor: Theme.of(context).accentColor,
            value: _isUsingHive,
            onChanged: (newVal) {
              if (kIsWeb) {
                return;
              }
              _isUsingHive = newVal;
              setState(() {
                initSettings();
              });
            }),
        Text('Stockage Hive'),
      ],
    );
  }

  Widget _buildThemeSwitch(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        Text('Clair'),
        Switch(
            activeColor: Theme.of(context).accentColor,
            value: _isDarkTheme,
            onChanged: (newVal) {
              _isDarkTheme = newVal;
              setState(() {});
            }),
        Text('Mode Nuit'),
      ],
    );
  }
}

class AppBody extends StatefulWidget {
  @override
  _AppBodyState createState() => _AppBodyState();
}

class _AppBodyState extends State<AppBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _buildClearCacheButton(context),
        SizedBox(
          height: 25.0,
        ),
        ElevatedButton(
          onPressed: () {
            openAppSettings(context);
          },
          child: Text('Demo'),
        ),
      ],
    );
  }

  void openAppSettings(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => MyHomePage(title: "h"),
    ));
  }
}

Widget _buildClearCacheButton(BuildContext context) {
  return ElevatedButton(
    onPressed: () {
      Settings.clearCache();
      showSnackBar(
        context,
        'Cache cleared for selected cache.',
      );
    },
    child: Text('Supprimer le cache'),
  );
}