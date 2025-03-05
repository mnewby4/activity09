import 'package:flutter/material.dart';
import 'cards_screen.dart';
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
      title: 'Card Organizer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyHomePage(title: 'Activity 08'),
    );
  }
}

// Data model for a Folder.
class Folder {
  final String name;
  final String previewImageUrl;
  final int cardCount;

  Folder({
    required this.name,
    required this.previewImageUrl,
    required this.cardCount,
  });
}
/*class FoldersScreen extends StatelessWidget {
  final List<Folder> folders = [
    Folder(name: 'Hearts', previewImageUrl: 'https://example.com/heart.jpg', cardCount: 4),
    Folder(name: 'Spades', previewImageUrl: 'https://example.com/spade.jpg', cardCount: 5),
    Folder(name: 'Diamonds', previewImageUrl: 'https://example.com/diamond.jpg', cardCount: 3),
    Folder(name: 'Clubs', previewImageUrl: 'https://example.com/club.jpg', cardCount: 6),
  ];
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}*/

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _FoldersScreen();
}

class _FoldersScreen extends State<MyHomePage> {
  final List<Folder> folders = [
    Folder(name: 'Hearts', previewImageUrl: 'https://example.com/heart.jpg', cardCount: 4),
    Folder(name: 'Spades', previewImageUrl: 'https://example.com/spade.jpg', cardCount: 5),
    Folder(name: 'Diamonds', previewImageUrl: 'https://example.com/diamond.jpg', cardCount: 3),
    Folder(name: 'Clubs', previewImageUrl: 'https://example.com/club.jpg', cardCount: 6),
  ];

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
        title: Text('Card Organizer App'),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: folders.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 2 columns
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemBuilder: (context, index) {
          final folder = folders[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CardsScreen(folder: folder)),
              );
            },
            child: Card(
              elevation: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    folder.previewImageUrl,
                    height: 80,
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                  SizedBox(height: 10),
                  Text(
                    folder.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Cards: ${folder.cardCount}'),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}