import 'package:flutter/material.dart';

class BottomnavigationBar extends StatelessWidget {
  const BottomnavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.lightbulb),
        ),
        ElevatedButton(
          onPressed: () {try{
            Navigator.pushNamed(context, "MapPage");}catch(e){
              print(e) ;
            }
          },
          child: const Icon(Icons.map),
        ),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.search),
        ),
      ],
    );
  }
}
