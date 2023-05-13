import 'package:flutter/material.dart';
import 'package:poke_picture_book/view/poke_list_page.dart';
import 'package:poke_picture_book/view/secret_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;
  List pages = [PokeListPage(), SecretPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ポケモン図鑑'),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.book),
                label: "図鑑",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.info),
                label: "シークレット"
            )
          ],
        currentIndex: currentIndex,
        onTap: (int index) {
            setState(() {
              currentIndex = index;
            });
        },
      ),
    );
  }
}
