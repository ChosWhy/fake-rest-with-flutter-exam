import 'package:chats_list_with_service_example/models/user_model.dart';
import 'package:chats_list_with_service_example/service/service_json_place_holder.dart';
import 'package:chats_list_with_service_example/service/service_local.dart';
import 'package:chats_list_with_service_example/widgets/custom_comment_container_widget.dart';
import 'package:flutter/material.dart';
import 'models/comment_model.dart';
import 'widgets/custom_button_widget.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with _PageUtility {
  List<CommentsModel>? _commentsItems;
  List<UserModel>? _usersItems;
  bool _isLoading = false;
  late final INetworkService _commentManager;
  late final INetworkService _userManager;

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  Future<void> fetchCommentItems() async {
    _changeLoading();
    _commentsItems = await _commentManager.fetchCommentItems();
    _usersItems = await _userManager.fetchUserItems();
    _changeLoading();
  }

  @override
  void initState() {
    super.initState();
    _commentManager = NetworkService();
    _userManager = NetworkService();
    fetchCommentItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          comments,
          style: Theme.of(context)
              .textTheme
              .headlineSmall
              ?.copyWith(color: Colors.black),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                color: Colors.black45,
                size: normalIconSize,
              ))
        ],
      ),
      body: _usersItems == null || _commentsItems == null
          ? const Center(child: CircularProgressIndicator.adaptive())
          : Column(
              children: [
                _customButtonField(),
                _divider(),
                _commentsField()
              ],
            ),
    );
  }

  SizedBox _customButtonField() {
    return SizedBox(
                height: generalSize,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomButtonWidget(
                        height: generalSize, text: buttonRecentMessage,index: 0),
                    CustomButtonWidget(
                        height: generalSize, text: buttonMostLiked,index: 1),
                  ],
                ),
              );
  }

  Padding _divider() {
    return Padding(
                padding: largeTopPadding,
                child: Container(
                  decoration: const BoxDecoration(boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 10),
                    )
                  ]),
                  child: const Divider(
                    color: Colors.black,
                    thickness: 0.1,
                  ),
                ),
              );
  }

  Expanded _commentsField() {
    return Expanded(
                  child: ListView.builder(
                itemCount: LocalService.commentContainerImages.length,
                itemBuilder: (context, index) {
                  return CustomCommentContainer(
                    imageUrl: LocalService.commentContainerImages[index],
                    time: LocalService.commentContainerTimes[index],
                    comment: _commentsItems?[index].body,
                    name: _usersItems?[index].name,
                    index: index,
                  );
                },
              ));
  }
}

mixin _PageUtility {
  final String comments = "Comments";
  final String buttonRecentMessage = "Recent Message";
  final String buttonMostLiked = "Most Liked";
  final double normalIconSize = 35;
  final double generalSize = 50;
  final EdgeInsets largeTopPadding = const EdgeInsets.only(top: 20);
}

///sonra da toggleButton yapcam biticek
