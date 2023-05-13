import 'package:flutter/material.dart';
import 'package:poke_picture_book/data/region_info.dart';

class RegionChips extends StatefulWidget {
  final ValueChanged onRegionSelected;
  const RegionChips({Key? key, required this.onRegionSelected}) : super(key: key);

  @override
  State<RegionChips> createState() => _RegionChipsState();
}



class _RegionChipsState extends State<RegionChips> {
  var value = 0;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 1.0,
        children: List.generate(regions.length, (int index) {

          return ChoiceChip(
            label: Text(regions[index].regionName, style: TextStyle(color: Colors.white),),
            selected: value == index,
            selectedColor: Colors.red,
            backgroundColor: Colors.grey,
            onSelected: (bool isSelected) {
              setState(() {
                value = isSelected ? index : 0;
                widget.onRegionSelected(regions[index]);
              });
            }
          );
        }).toList()
    );
  }
}
