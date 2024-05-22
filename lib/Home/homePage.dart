import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Post> posts = [
    Post(
      username: 'user1',
      profileImage: 'assets/images/user1.jpg',
      imageUrl: 'assets/images/user1.jpg',
      caption: 'Beautiful sunset at the beach!',
    ),
    Post(
      username: 'user2',
      profileImage: 'assets/images/user2.jpg',
      imageUrl: 'assets/images/user2.jpg',
      caption: 'Enjoying a delicious pizza!',
    ),
    Post(
      username: 'user3',
      profileImage: 'assets/images/user3.jpg',
      imageUrl: 'assets/images/user3.jpg',
      caption: 'Hiking in the mountains.',
    ),
    Post(
      username: 'user4',
      profileImage: 'assets/images/user4.jpg',
      imageUrl: 'assets/images/user4.jpg',
      caption: 'Exploring a new city.',
    ),
    Post(
      username: 'user5',
      profileImage: 'assets/images/user5.jpg',
      imageUrl: 'assets/images/user5.jpg',
      caption: 'Cooking a new recipe.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'HOME',
          style: GoogleFonts.poppins(
            textStyle: TextStyle(color: Colors.white),
          ),
        ),
        backgroundColor: Colors.blue,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(Icons.message, color: Colors.white),
            onPressed: () {
              // Navigate to inbox page or show dialog
              Navigator.push(context, MaterialPageRoute(builder: (context) => InboxPage()));
            },
          )
        ],
        automaticallyImplyLeading: false,
      ),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];
          return PostCard(post: post);
        },
      ),
    );
  }
}

class Post {
  final String username;
  final String profileImage;
  final String imageUrl;
  final String caption;

  const Post({
    required this.username,
    required this.profileImage,
    required this.imageUrl,
    required this.caption,
  });
}

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      elevation: 5.0,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(post.profileImage),
                ),
                SizedBox(width: 10.0),
                Text(post.username, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              ],
            ),
            SizedBox(height: 10.0),
            // Use Stack to overlay the shimmer effect and the image
            Stack(
              children: [
                // Placeholder shimmer effect
                Shimmer.fromColors(
                  baseColor: Colors.grey[300]!,
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    width: double.infinity,
                    height: 200, // Adjust the height as needed
                    color: Colors.white,
                  ),
                ),
                // Actual image
                Image.asset(
                  post.imageUrl,
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(post.caption, style: TextStyle(fontSize: 14)),
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    // Handle like button press
                  },
                  child: Text('Like', style: TextStyle(color: Colors.blue)),
                ),
                TextButton(
                  onPressed: () {
                    // Handle comment button press
                  },
                  child: Text('Comment', style: TextStyle(color: Colors.blue)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class InboxPage extends StatelessWidget {
  const InboxPage({Key? key}) : super(key: key);

  final List<User> users = const [
    User(username: 'John Doe', profileImage: 'assets/images/user1.jpg'),
    User(username: 'Jane Smith', profileImage: 'assets/images/user2.jpg'),
    User(username: 'Alice Johnson', profileImage: 'assets/images/user3.jpg'),
    // Add more users as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Inbox", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[900],
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(user.profileImage),
            ),
            title: Text(user.username),
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => MessagePage(user: user),
              );
            },
          );
        },
      ),
    );
  }
}

class User {
  final String username;
  final String profileImage;

  const User({required this.username, required this.profileImage});
}

class MessagePage extends StatefulWidget {
  final User user;

  const MessagePage({required this.user});

  @override
  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final List<Message> messages = [
    Message(content: "Hello!", sender: "user1"),
    Message(content: "How are you?", sender: "user1"),
    Message(content: "Let's catch up soon.", sender: "user1"),
    // Add more messages as needed
  ];

  final TextEditingController _controller = TextEditingController();

  void _addMessage(String content) {
    setState(() {
      messages.add(Message(content: content, sender: widget.user.username));
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      expand: false,
      builder: (context, scrollController) {
        return Scaffold(
          appBar: AppBar(
            title: Text(widget.user.username),
            backgroundColor: Colors.blue[900],
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  controller: scrollController,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      title: Text(message.content),
                      subtitle: Text(message.sender),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _controller,
                        decoration: InputDecoration(
                          hintText: "Type a message",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.send),
                      onPressed: () {
                        if (_controller.text.trim().isNotEmpty) {
                          _addMessage(_controller.text.trim());
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class Message {
  final String content;
  final String sender;

  const Message({required this.content, required this.sender});
}
