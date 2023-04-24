import 'package:chats_list_with_service_example/local_database.dart';
import 'package:flutter/material.dart';

class CustomCommentContainer extends StatefulWidget {
  const CustomCommentContainer({
    super.key, required this.imageUrl, required this.name, required this.comment, required this.time, required this.index,
  });
  final String imageUrl;
  final String? name;
  final String? comment;
  final String time;
  final int index;

  @override
  State<CustomCommentContainer> createState() => _CustomCommentContainerState();
}

class _CustomCommentContainerState extends State<CustomCommentContainer> with _CustomContainerUtility{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: paddingValue),
      child: Container(
        height: cardHeight,
        color: LocalDataBase.colors[widget.index],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //Image Container
            Padding(
              padding: EdgeInsets.all(paddingValue),
              child: Container(
                width: imageWidth,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imageUrl.toString()),
                      fit: BoxFit.cover),
                  borderRadius: borderRadiusNormal,
                ),
              ),
            ),
            //Text place
            Container(
              width: cardWidth,
              padding: EdgeInsets.symmetric(vertical: paddingValue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.name ?? "",
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(widget.comment ?? "",
                      style: Theme.of(context).textTheme.titleMedium,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            //Like and Time
            Container(
              padding: EdgeInsets.all(paddingValue),
              child: Text(widget.time.toString()),
            ),
          ],
        ),
      ),
    );
  }
}

mixin _CustomContainerUtility {
  final double paddingValue = 10;
  final BorderRadius borderRadiusNormal = BorderRadius.circular(12);
  final double imageWidth = 80;
  final double cardHeight = 100;
  final double cardWidth = 240;
}
