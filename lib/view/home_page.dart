import 'package:chat/provider/home_provider.dart';
import 'package:chat/view/second_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Homeprovider(),
      builder: (context, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title: const Text(
              "Chats",
              style: TextStyle(color: Colors.black),
            ),
            actions: [
              SizedBox(
                height: 30.0,
                width: 30.0,
                child: CircleAvatar(
                  backgroundImage:
                      NetworkImage("https://source.unsplash.com/random/"),
                ),
              )
            ],
          ),
          body: Builder(builder: (context) {
            var provider = Provider.of<Homeprovider>(context);
            if (provider.isLoading) {
              return const Center(
                child: CircularProgressIndicator.adaptive(),
              );
            } else if (provider.error.isNotEmpty) {
              return Center(
                child: Text(provider.error),
              );
            } else {
              return ListView.builder(
                itemBuilder: (context, index) {
                  return Dismissible(
                    key: UniqueKey(),
                    background: Row(children: [
                      Expanded(
                          child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.yellow,
                        child: const Icon(Icons.archive),
                      )),
                      Expanded(
                          child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.red,
                        child: const Icon(Icons.delete),
                      )),
                    ]),
                    onDismissed: (DismissDirection direction) {
                      if (direction == DismissDirection.endToStart) {
                        provider.deleteElement(index);
                        print("delete");
                      } else if (direction == DismissDirection.startToEnd) {
                        print("Archived");
                      }
                    },
                    child: ListTile(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage()));
                      },
                      leading: const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://source.unsplash.com/random/")),
                      title: Text(provider.data!.getAt(index)!.name.toString()),
                      subtitle: Text("This Your Messages"),
                      trailing: Text("09:50 PM"),
                    ),
                  );
                },
                itemCount: provider.data!.length,
              );
            }
          }),
          bottomNavigationBar: Container(
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0),
              ),
              child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  selectedItemColor: const Color(0xFFE8EAF6),
                  unselectedItemColor: Colors.white,
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.chat_bubble_outline,
                          color: Colors.black,
                        ),
                        label: "chats",
                        backgroundColor: Color(0xFFFFFFFF)),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.call_end_outlined,
                          color: Colors.grey,
                        ),
                        label: "calls",
                        backgroundColor: Color(0xFFFFFFFF)),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.group_outlined,
                          color: Colors.grey,
                        ),
                        label: "contacts",
                        backgroundColor: Color(0xFFFFFFFF)),
                    BottomNavigationBarItem(
                        icon: Icon(
                          Icons.settings_outlined,
                          color: Colors.grey,
                        ),
                        label: "settings",
                        backgroundColor: Color(0xFFFFFFFF))
                  ]),
            ),
          ),
        );
      },
    );
  }
}
