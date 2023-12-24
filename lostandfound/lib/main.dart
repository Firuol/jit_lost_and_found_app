import 'package:flutter/material.dart';

class Item {
  final String title;
  final String description;
  final String imageUrl; // Add image URL property

  Item(
      {required this.title, required this.description, required this.imageUrl});
}

class ItemListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: Fetch the list of items from the Django backend
    List<Item> items = [
      Item(
        title: 'Lost Id near cafe',
        description:
            'National identification card lost near the main cafeteria during lunchtime.',
        imageUrl: 'assets/images/id.webp',
      ),
      Item(
        title: 'Lost door key',
        description:
            'Lost door key near the library on Monday. Anyone who finds it, please contact me on +251963178122.',
        imageUrl: 'assets/images/key.jpg',
      ),
      Item(
        title: 'Found Wallet',
        description:
            'i found wallet near the library on Monday. Anyone who finds it, please contact me on +251963178122.',
        imageUrl: 'assets/images/wallet.jpg',
      ),
      Item(
        title: 'Found Trouser',
        description:
            'i found trouser near the library on Monday. Anyone who finds it, please contact me on +251963178122.',
        imageUrl: 'assets/images/trouser.webp',
      ),
      // Add more items as needed
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lost and Found Items'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 170.0,
              decoration: BoxDecoration(
                color: Colors.white, // Set the background color to white
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: const TextField(
                decoration: InputDecoration(
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  items[index].imageUrl,
                  width: double.infinity,
                  height: 200.0,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    items[index].title,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    navigateToItemDetails(context, items[index]);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'See details',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToPostItemScreen(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void navigateToItemDetails(BuildContext context, Item selectedItem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ItemDetailsScreen(item: selectedItem),
      ),
    );
  }

  void navigateToPostItemScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PostItemScreen(),
      ),
    );
  }
}

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            item.imageUrl,
            width: double.infinity,
            height: 200.0,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 16.0),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Title: ${item.title}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description: ${item.description}'),
            // Add more details as needed
          ),
        ],
      ),
    );
  }
}

class PostItemScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post New Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Title'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {},
              child: Text('Post Item'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ItemListScreen(),
  ));
}
