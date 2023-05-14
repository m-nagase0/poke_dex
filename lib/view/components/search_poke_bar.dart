import 'package:flutter/material.dart';

class SearchPokeBar extends StatelessWidget {
  final ValueChanged searchPoke;

  SearchPokeBar({super.key, required this.searchPoke});

  final TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(50.0),
      )),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: TextField(
          onSubmitted: searchPoke,
          maxLines: 1,
          controller: textEditingController,
          decoration: const InputDecoration(
            icon: Icon(Icons.search),
            hintText: "search for name or number",
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
