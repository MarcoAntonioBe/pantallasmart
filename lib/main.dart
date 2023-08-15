import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Marco App Reloj',
      theme: ThemeData(
        colorSchemeSeed: Colors.indigo,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
        brightness: Brightness.dark,
      ),
      home: const MyHomePage(title: 'Flutter Example App'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentTime = '';
  String _currentWeather = 'Soleado';
  String _currentTemperature = '25°C';

  @override
  void initState() {
    super.initState();
    _updateTime();
  }

  void _updateTime() {
    final now = DateTime.now();
    final formattedTime = DateFormat('HH:mm:ss').format(now);
    setState(() {
      _currentTime = formattedTime;
    });
    Future.delayed(const Duration(seconds: 1), _updateTime);
  }

  void _navigateToWeatherPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WeatherPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.red,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                _currentTime,
                style: const TextStyle(fontSize: 24, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                'Clima: $_currentWeather',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                'Temperatura: $_currentTemperature',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              Text(
                'Profesor Hector Saldaña Benitez',
                style: const TextStyle(fontSize: 18, color: Colors.white),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  _navigateToWeatherPage(context);
                },
                child: const Text('Ver Clima'),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Clima'),
      ),
      body: Center(
        child: Text(
          '25°C',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
