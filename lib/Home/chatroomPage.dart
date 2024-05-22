import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChatMessage {
  String messageText;
  bool isSentByCurrentUser;

  ChatMessage({required this.messageText, required this.isSentByCurrentUser});
}

class ChatScreen extends StatefulWidget {
  final String chatroomName;
  final List<ChatMessage> messages;

  const ChatScreen({required this.chatroomName, required this.messages});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CHATROOM',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              // Add logic to enter edit mode
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.messages.length,
              itemBuilder: (context, index) {
                final message = widget.messages[index];
                return Align(
                  alignment: message.isSentByCurrentUser
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    padding: EdgeInsets.all(12),
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    decoration: BoxDecoration(
                      color: message.isSentByCurrentUser
                          ? Colors.blue[200]
                          : Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      message.messageText,
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 60,
                    padding: EdgeInsets.only(left: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextField(
                      controller: _messageController,
                      decoration: InputDecoration(
                        hintText: "Type a message",
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                FloatingActionButton(
                  onPressed: () {
                    if (_messageController.text.isNotEmpty) {
                      setState(() {
                        widget.messages.add(ChatMessage(
                          messageText: _messageController.text,
                          isSentByCurrentUser: true,
                        ));
                        _messageController.clear();
                      });
                    }
                  },
                  child: Icon(Icons.arrow_forward),
                  backgroundColor: Colors.blue[900],
                  elevation: 0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatroomsPage extends StatefulWidget {
  const ChatroomsPage({super.key});

  @override
  State<ChatroomsPage> createState() => _ChatroomsPageState();
}

class _ChatroomsPageState extends State<ChatroomsPage> {
  List<String> _chatroomNames = [
    'General',
    'Random',
    'Announcements',
    'Support',
  ];
  List<String> _filteredChatroomNames = [];
  Map<String, List<ChatMessage>> _chatroomMessages = {};

  @override
  void initState() {
    super.initState();
    _filteredChatroomNames = _chatroomNames;
    _chatroomNames.forEach((chatroom) {
      _chatroomMessages[chatroom] = [];
    });
  }

  void _searchChatrooms(String query) {
    setState(() {
      if (query.isEmpty) {
        _filteredChatroomNames = _chatroomNames;
      } else {
        _filteredChatroomNames = _chatroomNames
            .where((name) => name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  void _navigateToChatScreen(String chatroomName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ChatScreen(
          chatroomName: chatroomName,
          messages: _chatroomMessages[chatroomName]!,
        ),
      ),
    );
  }

  void _createNewChat() {
    showDialog(
      context: context,
      builder: (context) {
        String? _chatName;
        return AlertDialog(
          title: Text("Create a new chat"),
          content: TextField(
            onChanged: (value) {
              _chatName = value;
            },
            decoration: InputDecoration(hintText: "Enter a chat name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (_chatName != null && _chatName!.isNotEmpty) {
                  Navigator.pop(context);
                  setState(() {
                    _chatroomNames.add(_chatName!);
                    _filteredChatroomNames = _chatroomNames;
                    _chatroomMessages[_chatName!] = [];
                  });
                }
              },
              child: Text("Create"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'CHATROOM',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            onPressed: () {
              // Add logic to enter edit mode
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              onChanged: _searchChatrooms,
              decoration: InputDecoration(
                hintText: "Search...",
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _filteredChatroomNames.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blue[900],
                    child: Icon(Icons.chat, color: Colors.white),
                  ),
                  title: Text(
                    _filteredChatroomNames[index],
                    style: TextStyle(fontSize: 20),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    _navigateToChatScreen(_filteredChatroomNames[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _createNewChat,
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[900],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatroomsPage(),
  ));
}


