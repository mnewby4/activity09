import 'package:flutter/material.dart';
import 'cards_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Card Organizer App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FoldersScreen(),
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

class FoldersScreen extends StatelessWidget {
  final List<Folder> folders = [
    Folder(name: 'Hearts', previewImageUrl: 'https://example.com/heart.jpg', cardCount: 4),
    Folder(name: 'Spades', previewImageUrl: 'https://example.com/spade.jpg', cardCount: 5),
    Folder(name: 'Diamonds', previewImageUrl: 'https://example.com/diamond.jpg', cardCount: 3),
    Folder(name: 'Clubs', previewImageUrl: 'https://example.com/club.jpg', cardCount: 6),
  ];

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
    );
  }
}
