import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return const TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: Color.fromARGB(220, 228, 230, 234),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
                color: Color.fromARGB(220, 228, 230, 234), width: 2.0),
            borderRadius: BorderRadius.all(Radius.circular(5))),
        hintText: 'Search',
        prefixIcon: Icon(Icons.search_outlined),
      ),
    );
  }
}
