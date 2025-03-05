import 'package:flutter/material.dart';
import 'helper.dart';

DatabaseHelper myHelper = DatabaseHelper();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  await myHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ACTIVITY 09'),
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
  @override
  void initState() {
    super.initState();
    Map<String, dynamic> Spades = {
      DatabaseHelper.columnFolderId: 2,
      DatabaseHelper.columnFolderName: "Spades"
    };
    Map<String, dynamic> Diamonds = {
      DatabaseHelper.columnFolderId: 3,
      DatabaseHelper.columnFolderName: "Diamonds"
    };
    Map<String, dynamic> Clubs = {
      DatabaseHelper.columnFolderId: 4,
      DatabaseHelper.columnFolderName: "Clubs"
    };
    myHelper.insert(Spades);
    myHelper.insert(Diamonds);
    myHelper.insert(Clubs);
  }
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    print(await _display());
    print(await myHelper.queryRowCount());
  }

  Future<List<Map<String, dynamic>>> _display() async {
    return await myHelper.queryAllRows();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
