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

    Map<String, dynamic> HCard1 = {
      DatabaseHelper.columnCardId: 1,
      DatabaseHelper.columnCardName: "Ace of Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/English_pattern_ace_of_hearts.svg/60px-English_pattern_ace_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };
    Map<String, dynamic> HCard2 = {
      DatabaseHelper.columnCardId: 2,
      DatabaseHelper.columnCardName: "2 Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/2/26/English_pattern_2_of_hearts.svg/60px-English_pattern_2_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };
    Map<String, dynamic> HCard3 = {
      DatabaseHelper.columnCardId: 3,
      DatabaseHelper.columnCardName: "3 Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0f/English_pattern_3_of_hearts.svg/60px-English_pattern_3_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };
    Map<String, dynamic> HCard4 = {
      DatabaseHelper.columnCardId: 4,
      DatabaseHelper.columnCardName: "4 Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/English_pattern_4_of_hearts.svg/60px-English_pattern_4_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };
    Map<String, dynamic> HCard5 = {
      DatabaseHelper.columnCardId: 5,
      DatabaseHelper.columnCardName: "5 Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c6/English_pattern_5_of_hearts.svg/60px-English_pattern_5_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };
    Map<String, dynamic> HCard6 = {
      DatabaseHelper.columnCardId: 6,
      DatabaseHelper.columnCardName: "6 Hearts", 
      DatabaseHelper.columnSuit: "Hearts",
      DatabaseHelper.columnImgUrl: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/da/English_pattern_6_of_hearts.svg/60px-English_pattern_6_of_hearts.svg.png",
      DatabaseHelper.cardFolderID: 1,
    };

    myHelper.insertCard(HCard1);
    myHelper.insertCard(HCard2);
    myHelper.insertCard(HCard3);
    myHelper.insertCard(HCard4);
    myHelper.insertCard(HCard5);
    myHelper.insertCard(HCard6);
  }
  int _counter = 0;

  void _incrementCounter() async {
    setState(() {
      _counter++;
    });
    print(await _display());
    print(await myHelper.queryRowCount());
    print(await myHelper.queryCardRowCount());
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
