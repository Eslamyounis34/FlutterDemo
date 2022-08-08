import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

class UserMessage {
  int id;
  String userName;
  String userMsg;

  UserMessage({required this.id, required this.userName, required this.userMsg});
}

class ChatScreen extends StatelessWidget {
  List<UserMessage> usersList = [
    UserMessage(id: 1, userName: "Eslam Younis", userMsg: "Hello there .."),
    UserMessage(id: 1, userName: "Mostafa Younis", userMsg: "I am looking for you"),
    UserMessage(id: 1, userName: "Hanaa Younis", userMsg: "How Are you ?"),
    UserMessage(id: 1, userName: "Hassan Younis", userMsg: "can you call me now ?"),
    UserMessage(id: 1, userName: "Ahmed Younis", userMsg: "Amazing !!"),
    UserMessage(id: 1, userName: "Ashraf Saleh", userMsg: "fe le3p kora pokra gy !!"),
    UserMessage(id: 1, userName: "Mohamed Rafaat", userMsg: "hemdan shlhoop  :) "),
    UserMessage(id: 1, userName: "Eslam Sayed", userMsg: "tapla  :) "),
    UserMessage(id: 1, userName: "Apdo Doda", userMsg: "bayern ? "),
    UserMessage(id: 1, userName: "Hussien sisi", userMsg: "hahahahaha XD "),

  ];

  @override
  Widget build(Object context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Chat"),
        leading: Icon(Icons.arrow_back),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(5.0),
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7.0),
                    color: Colors.grey[350]),
                child: Row(
                  children: const [
                    Icon(Icons.search),
                    SizedBox(
                      width: 10.00,
                    ),
                    Text("search")
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.0, top: 5.0),
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: const [
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          "https://avatars.githubusercontent.com/u/41061865?v=4"),
                      radius: 25,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      radius: 7,
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 5.00, bottom: 10.00),
                child: const Text("Eslam Younis",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => buildChatItem(usersList[index]),
                shrinkWrap: true,
                separatorBuilder: (context, index) => SizedBox(
                  height: 20.00,
                ),
                itemCount: usersList.length,
                scrollDirection: Axis.vertical,
              ),
            ],
          ),
        ),
      ),
    );
  }

  // buiud item
  Widget buildChatItem(UserMessage user) => Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: const [
                CircleAvatar(
                  backgroundImage: NetworkImage(
                      "https://avatars.githubusercontent.com/u/41061865?v=4"),
                  radius: 25,
                ),
                CircleAvatar(
                  radius: 7,
                  backgroundColor: Colors.green,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10.00),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                Text(
                  '${user.userName}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.userMsg}',
                  style: TextStyle(fontWeight: FontWeight.normal),
                )
              ],
            ),
          )
        ],
      );
}
