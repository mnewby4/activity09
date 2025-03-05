import 'package:flutter/material.dart';
import 'main.dart';

/// Data model for a CardItem.
class CardItem {
  final String name;
  final String imageUrl;

  CardItem({
    required this.name,
    required this.imageUrl,
  });
}

class CardsScreen extends StatefulWidget {
  final Folder folder;

  CardsScreen({required this.folder});

  @override
  _CardsScreenState createState() => _CardsScreenState();
}

class _CardsScreenState extends State<CardsScreen> {
  // Example list of cards for demonstration.
  // In a real app, this data would come from SQLite.
  List<CardItem> cards = [
    CardItem(
        name: 'Ace of Hearts', imageUrl: 'https://example.com/ace_hearts.jpg'),
    CardItem(name: '2 of Hearts', imageUrl: 'https://example.com/2_hearts.jpg'),
    CardItem(name: '3 of Hearts', imageUrl: 'https://example.com/3_hearts.jpg'),
    CardItem(name: '4 of Hearts', imageUrl: 'https://example.com/4_hearts.jpg'),
  ];

  // Functions for card CRUD operations can be added here.
  // For example: _addCard(), _updateCard(), _deleteCard().

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.folder.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          itemCount: cards.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // 2 columns for a grid layout
            childAspectRatio: 0.8,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            final cardItem = cards[index];
            return Card(
              elevation: 3,
              child: Column(
                children: [
                  Expanded(
                    child: Image.network(
                      cardItem.imageUrl,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      cardItem.name,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  // Action buttons for update and delete.
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          // TODO: Add update logic.
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          // TODO: Add delete logic.
                        },
                      ),
                    ],
                  )
                ],
              ),
            );
          },
        ),
      ),
      // Floating Action Button to add a new card.
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Add logic to add a new card.
          // Make sure to enforce folder limits (3-6 cards) here.
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
