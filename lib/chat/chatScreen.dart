import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser; //this will give us the email
final ImagePicker _picker = ImagePicker();

class ChatScreen extends StatefulWidget {
  static const String routeName = "ChatScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController(); //clear textField
  final _auth = FirebaseAuth.instance;
  String? messageText; //this will give us the message

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      print(e);
    }
  }

  _sendMessageArea() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      color: Color.fromRGBO(237, 237, 237, 5),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.add_a_photo),
            iconSize: 30,
            color: Colors.black54,
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: ((builder) => bottomSheet()),
              );
            },
          ),
          Expanded(
            child: TextField(
              controller: messageTextController,
              onChanged: (value) {
                messageText = value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your message...',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              messageTextController.clear();
              _firestore.collection('messages').add({
                'text': messageText,
                'sender': loggedInUser!.email,
                'time': FieldValue.serverTimestamp(),
              });
            },
            child: Text(
              'Send',
              style: TextStyle(
                color: Colors.black54,
                fontFamily: "Inter",
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(255, 255, 255, 1.0),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: const Color.fromRGBO(118, 189, 178, 1),
          title: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                    text: "Chat",
                    style: TextStyle(
                      fontSize: 25,
                      fontFamily: "Inter",
                    )),
              ],
            ),
          ),
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            ),
            onPressed: () {
              // to get back to previous screen
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MessageStreamBuilder(),
              _sendMessageArea(),
            ],
          ),
        ));
  }
}

class MessageStreamBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('time').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //has no data
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.black,
            ),
          );
        }
        final messages = snapshot.data!.docs
            .reversed; // make the message appears at bottom of list .. reverse order
        List<MessageBubble> messageWidgets = [];
        for (var message in messages) {
          final messageText = message.get('text');
          final messageSender = message.get('sender');
          final currentUser = loggedInUser?.email;

          final messageWidget = MessageBubble(
            sender: messageSender,
            text: messageText,
            isMe: currentUser == messageSender,
          );
          messageWidgets.add(messageWidget);
        }
        return Expanded(
          child: ListView(
            reverse: true, // bottom of the listview showing
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            children: messageWidgets,
          ),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({this.sender, this.text, required this.isMe});

  final String? sender;
  final String? text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(
            sender!,
            style: TextStyle(
              fontSize: 12,
              color: Colors.black54,
              fontFamily: 'Inter',
            ),
          ),
          Material(
            elevation: 4,
            borderRadius: isMe
                ? BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomLeft: Radius.circular(5),
                  )
                : BorderRadius.only(
                    topRight: Radius.circular(5),
                    topLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5),
                  ),
            color: isMe
                ? Color.fromRGBO(118, 189, 178, 1)
                : Color.fromRGBO(237, 237, 237, 5),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(
                text!,
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontFamily: 'inter',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomSheet() {
  return Container(
    height: 55,
    margin: EdgeInsets.symmetric(
      horizontal: 5,
      vertical: 15,
    ),
    child: Column(
      children: <Widget>[
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                child: TextButton.icon(
                  icon: Icon(Icons.camera_alt, color: Colors.black54, size: 35),
                  onPressed: () {
                    takePhoto(ImageSource.camera);
                  },
                  label: Text(
                    "Camera",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'inter',
                        color: Colors.black54),
                  ),
                ),
              ),
              Expanded(
                child: TextButton.icon(
                  icon: Icon(Icons.image, color: Colors.black54, size: 35),
                  onPressed: () {
                    takePhoto(ImageSource.gallery);
                  },
                  label: Text(
                    "Gallery",
                    style: TextStyle(
                        fontSize: 17,
                        fontFamily: 'inter',
                        color: Colors.black54),
                  ),
                ),
              ),
            ])
      ],
    ),
  );
}

void takePhoto(ImageSource source) async {
  final pickedFile = await _picker.pickImage(
    source: source,
  );
}
