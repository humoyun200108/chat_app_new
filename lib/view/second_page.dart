import 'package:chat/view/home_page.dart';
import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});

  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> messages = ['Salom', 'Yaxshimisiz?', 'Nima gaplar?'];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50.0),
        child: AppBar(
          backgroundColor: Colors.white,
          leading: const CircleAvatar(
            radius: 10.0,
            backgroundColor: Colors.black,
            backgroundImage:
                NetworkImage("https://source.unsplash.com/random/"),
          ),
          title: const Text(
            "Chat Field",
            style: TextStyle(color: Colors.black),
          ),
          actions: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: const Icon(
                Icons.cancel_sharp,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(messages[index]),
                );
              },
            ),
          ),
          TextField(
            controller: textController,
            decoration: InputDecoration(
              hintText: 'Xabar yozish ....',
              suffixIcon: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),
    );
  }
}
