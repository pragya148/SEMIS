import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  bool isGroupChatSelected = true;

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF0B2457);
    const Color whiteColor = Colors.white;
    const Color greyColor = Color.fromARGB(255, 181, 177, 177);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chat'),
      ),
      body: Column(
        children: [
          // Search bar
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),

          // Options for Group Chat and Individual Chat
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Group Chat button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isGroupChatSelected = true;
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 8, left: 2),
                      decoration: BoxDecoration(
                        color: isGroupChatSelected ? blueColor : greyColor,
                        borderRadius: BorderRadius.circular(12.0),
                        // border: Border.all(color: greyColor),
                      ),
                      child: Center(
                        child: Text(
                          'Group Chat',
                          style: TextStyle(
                            fontSize: 16,
                            color: isGroupChatSelected ? whiteColor : blueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              // Individual Chat button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isGroupChatSelected = false;
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const IndividualChatPage()),
                      );
                    });
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: const EdgeInsets.only(
                          top: 8.0, bottom: 8.0, right: 8, left: 2),
                      decoration: BoxDecoration(
                        color: !isGroupChatSelected ? blueColor : greyColor,
                        borderRadius: BorderRadius.circular(12.0),
                        //   border: Border.all(color: blueColor),
                      ),
                      child: Center(
                        child: Text(
                          'Individual Chat',
                          style: TextStyle(
                            fontSize: 16,
                            color:
                                !isGroupChatSelected ? whiteColor : blueColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          // List of Group Chats (Only shown when Group Chat is selected)
          if (isGroupChatSelected)
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16.0),
                itemCount: 10, // Example list count
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text('Group Chat ${index + 1}'),
                    subtitle: const Text('Last message...'),
                    leading: const CircleAvatar(
                      child: Icon(Icons.group),
                    ),
                    onTap: () {
                      // Open chat page
                    },
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

// Placeholder for the Individual Chat page
class IndividualChatPage extends StatelessWidget {
  const IndividualChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Individual Chat'),
      ),
      body: const Center(
        child: Text('Individual Chat Page'),
      ),
    );
  }
}
