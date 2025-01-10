import 'package:flutter/material.dart';

/*
* Todo:
* 1. Search Text Field, that apply search() after 1 second of alerting...
* 2. Filter Chips, (categories-stores-products)
* 3. Body:
*   if(selectedFilterChips.isEmpty) -> select filter chips please
*   else
*     selectedFilterChips.forEach({chip ->  chip.getResult()})
*  for example: selectedFilterChips = [Categories]
*   -> Categories
*   -> C1 - C2 - C3 (Like what saw in Home)
*
* State:
*   - Categories Search State
*   - Stores Search State
*   - Products Search State
*   - SearchTextField Search State
*   - SearchTextField Search State
*
*
* */

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Search"),
      ),
    );
  }
}