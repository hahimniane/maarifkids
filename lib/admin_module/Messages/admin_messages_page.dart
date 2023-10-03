import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:chat_bubbles/date_chips/date_chip.dart';
import 'package:chat_bubbles/message_bars/message_bar.dart';
import 'package:flutter/material.dart';

import '../../utils/contants.dart';
import '../../utils/search_functionality.dart';

import '../../utils/custom_nav_bar.dart';
import '../../menu_page.dart';

class AdminMessagesPage extends StatelessWidget {
  final bool isFromSearch;
  const AdminMessagesPage({super.key, required this.isFromSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE7F7F8),
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Messages',
        context: context,
        isFromSearch: false,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 5,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.90,
            height: MediaQuery.of(context).size.height * 0.07,
            child: TextField(
              style: TextStyle(
                color: Colors.white,
              ),
              decoration: InputDecoration(
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                hintStyle: TextStyle(
                  color: Colors.white,
                ),
                contentPadding: EdgeInsets.fromLTRB(4, 0, 0, 0),
                filled: true,
                fillColor: adminAppColor,
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                labelText: 'Search',
                hintText: 'Search...',
                suffixIcon: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              shrinkWrap: false,
              padding: EdgeInsets.all(16),
              children: [
                MessageCard(
                  avatarColor: Colors.blue,
                  parentName: 'John Doe',
                  studentName: 'Hashim Niane',
                  unreadCount: 3,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => AdminDiscussedMessages(
                                  personName: 'Principal',
                                  isFromSearch: false,
                                )));
                  },
                ),
                MessageCard(
                  avatarColor: Colors.red,
                  parentName: 'Jane Smith',
                  studentName: 'Ibrahim Smith',
                  unreadCount: 0,
                  onTap: () {},
                ),
                MessageCard(
                  avatarColor: Colors.green,
                  parentName: 'Michael Johnson',
                  studentName: 'Ali johnson',
                  unreadCount: 1,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          } else if (value == 1) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => SearchFieldSample()));
          }
        },
      ),
    );
  }
}

class MessageCard extends StatelessWidget {
  final Color avatarColor;
  final String parentName;
  final String studentName;
  final int unreadCount;

  final VoidCallback onTap;

  const MessageCard(
      {Key? key,
      required this.avatarColor,
      required this.parentName,
      required this.studentName,
      required this.unreadCount,
      required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        color: unreadCount == 0 ? Colors.white : adminAppColor,
        elevation: 5,
        child: ListTile(
          onTap: onTap,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.person,
              color: unreadCount == 0 ? adminAppColor : Colors.white,
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                parentName,
                style: TextStyle(
                  color: unreadCount != 0 ? Colors.white : adminAppColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                studentName,
                style: TextStyle(
                  color: unreadCount != 0 ? Colors.white : adminAppColor,
                ),
              ),
            ],
          ),
          trailing: unreadCount > 0
              ? Container(
                  padding: EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    unreadCount.toString(),
                    style: TextStyle(color: adminAppColor),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}

class AdminDiscussedMessages extends StatefulWidget {
  final bool isFromSearch;
  final String personName;

  AdminDiscussedMessages(
      {required this.personName, required this.isFromSearch});

  @override
  _AdminDiscussedMessagesState createState() => _AdminDiscussedMessagesState();
}

class _AdminDiscussedMessagesState extends State<AdminDiscussedMessages> {
  List<String> messages = [];

  TextEditingController _textEditingController = TextEditingController();
  ScrollController _scrollController = ScrollController();

  void _sendMessage() {
    String message = _textEditingController.text;
    if (message.isNotEmpty) {
      setState(() {
        messages.add(message);
        _textEditingController.clear();
        _scrollToBottom();
      });
    }
  }

  void _scrollToBottom() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: profileSecimiBackgroundColor,
      appBar: buildAppBar(
        isAdminColor: true,
        title: 'Messages',
        context: context,
        isFromSearch: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                'John Doe',
                style: TextStyle(
                  color: adminAppColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              )),
            ),
            Expanded(
              child: SingleChildScrollView(
                reverse: true,
                controller: _scrollController,
                child: Column(
                  children: [
                    DateChip(
                      date: new DateTime(2021, 5, 7),
                      color: Colors.white,
                    ),
                    BubbleSpecialThree(
                      sent: true,
                      delivered: true,
                      // seen: true,
                      text: 'Hello How are you',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      seen: true,
                      text: 'Have you sent your kid to school?',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Yes I have sent him',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Havent you seen him at school?',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'please let me know when he reaches',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      delivered: true,
                      seen: true,
                      text: 'Hello How are you',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      seen: true,
                      text: 'Have you sent your kid to school?',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Yes I have sent him',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Havent you seen him at school?',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'please let me know when he reaches',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      delivered: true,
                      seen: true,
                      text: 'Hello How are you',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      seen: true,
                      text: 'Have you sent your kid to school?',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Yes I have sent him',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Havent you seen him at school?',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'please let me know when he reaches',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      delivered: true,
                      seen: true,
                      text: 'Hello How are you',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      seen: true,
                      text: 'Have you sent your kid to school?',
                      color: Color(0xffBBE4A2),
                      tail: false,
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Yes I have sent him',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'Havent you seen him at school?',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                    BubbleSpecialThree(
                      textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                      text: 'please let me know when he reaches',
                      color: Colors.white,
                      tail: false,
                      isSender: false,
                    ),
                  ],
                  // crossAxisAlignment: CrossAxisAlignment.end,
                  // children: messages.reversed
                  //     .map((message) => MessageBubble(
                  //           message: message,
                  //           isSent: message == messages.first,
                  //         ))
                  //     .toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MessageBar(
                sendButtonColor: Colors.green,
                onSend: (_) => print(_),
                actions: [
                  // InkWell(
                  //   child: Icon(
                  //     Icons.add,
                  //     color: Colors.black,
                  //     size: 24,
                  //   ),
                  //   onTap: () {},
                  // ),
                  // Padding(
                  //   padding: EdgeInsets.only(left: 8, right: 8),
                  //   child: InkWell(
                  //     child: Icon(
                  //       Icons.camera_alt,
                  //       color: Colors.green,
                  //       size: 24,
                  //     ),
                  //     onTap: () {},
                  //   ),
                  // ),
                ],
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: TextField(
              //         controller: _textEditingController,
              //         decoration: InputDecoration(
              //           hintText: 'Type your message...',
              //           contentPadding: EdgeInsets.all(16.0),
              //           border: OutlineInputBorder(
              //             borderRadius: BorderRadius.circular(15.0),
              //           ),
              //         ),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.all(8.0),
              //       child: Container(
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(10),
              //           color: Colors.green,
              //         ),
              //         child: IconButton(
              //           icon: Icon(
              //             Icons.send,
              //             color: Colors.white,
              //           ),
              //           onPressed: _sendMessage,
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(
        currentIndex: 0,
        onTap: (int value) {
          if (value == 0) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MenuPage()));
          }
        },
      ),
    );
  }
}

class AdminMessageBubble extends StatelessWidget {
  final String message;
  final bool isSent;

  const AdminMessageBubble({
    Key? key,
    required this.message,
    required this.isSent,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: isSent ? parentAppColor : Colors.white,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment:
            isSent ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            message,
            style: TextStyle(
              color: isSent ? Colors.black : Colors.blue,
            ),
          ),
          SizedBox(height: 4.0),
          // Text(
          //   'Sent at ${DateTime.now().toString()}',
          //   style: TextStyle(
          //     color: isSent ? Colors.grey : Colors.grey,
          //     fontSize: 12.0,
          //   ),
          // ),
        ],
      ),
    );
  }
}
