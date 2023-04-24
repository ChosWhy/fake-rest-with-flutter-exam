import 'package:chats_list_with_service_example/local_database.dart';
import 'package:flutter/material.dart';

class CustomButtonWidget extends StatefulWidget {
  const CustomButtonWidget({
    super.key,
    required this.height,
    required this.text,
    required this.index,
  });

  final double height;
  final String text;
  final int index;

  @override
  State<CustomButtonWidget> createState() => _CustomButtonWidgetState();
}

class _CustomButtonWidgetState extends State<CustomButtonWidget>
    with _CustomButtonWidgetUtility {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        _toggleTheColor();
      },
      child: Container(
        decoration: BoxDecoration(
          color: LocalDataBase.mainPageCustomButtonColorsActive[widget.index] == true ? Colors.indigo : Colors.grey,
          borderRadius: BorderRadius.circular(widget.height / 2),
        ),
        height: widget.height,
        padding: normalPadding,
        child: Center(
            child: Text(
          widget.text,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(color: Colors.white),
        )),
      ),
    );
  }

  void _toggleTheColor() {
    setState(() {
      if(LocalDataBase.mainPageCustomButtonColorsActive[widget.index] == true){
        LocalDataBase.mainPageCustomButtonColorsActive[widget.index] = true;
        for(int i = 0;i<LocalDataBase.mainPageCustomButtonColorsActive.length;i++){
          if(i != widget.index){
            LocalDataBase.mainPageCustomButtonColorsActive[i] = false;
          }
        }
      }
      else if(LocalDataBase.mainPageCustomButtonColorsActive[widget.index] == false){
        LocalDataBase.mainPageCustomButtonColorsActive[widget.index] = true;
        for(int i = 0;i<LocalDataBase.mainPageCustomButtonColorsActive.length;i++){
          if(i != widget.index){
            LocalDataBase.mainPageCustomButtonColorsActive[i] = false;
          }
        }
      }
    });
  }
}

mixin _CustomButtonWidgetUtility {
  final EdgeInsets normalPadding = const EdgeInsets.symmetric(horizontal: 20);
}

//toggle da sıkıntı var çözemedim!
