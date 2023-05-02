import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _searchController = TextEditingController();
  Color myHexColor = const Color(0xff06D6A0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _searchController,
        decoration: InputDecoration(fillColor: Colors.white24,filled: true,
          hintText: 'Search...',
          hintStyle: const TextStyle(color: Colors.white70),
          suffixIcon: IconButton(
            icon: const Icon(Icons.clear,color: Colors.white30),
            onPressed: () => _searchController.clear(),
          ),
          prefixIcon: IconButton(
            color: myHexColor,
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: myHexColor,style: BorderStyle.solid,width: 50),
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    );
  }
}
