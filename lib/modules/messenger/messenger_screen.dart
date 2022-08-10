import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MessengerScreen extends StatelessWidget {
  const MessengerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 10.0,
        title: Row(
          children: const [
            CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/41061865?v=4'),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('Chats',
            style: TextStyle(
              color: Colors.black
            ),)
          ],
        ),

        actions: [
          IconButton(onPressed: (){}, icon:const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 15,
            child: Icon(
              Icons.camera_alt,
              size: 16.0,
              color: Colors.white,
            ),
          )
          ),
          IconButton(onPressed: (){}, icon:const CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 15,
            child: Icon(
              Icons.edit,
              size: 16.0,
              color: Colors.white,
            ),
          )
          )
        ],
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(5.0),
            margin: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.0),
              color: Colors.grey[350],
            ),
            child: Row(
              children: const [
                Icon(
                  Icons.search,
                ),
                SizedBox(
                  width: 10.0,
                ),
                Text("Search"),

              ],
            ),
          ),
          Column(

            children:  [
              Container(
                width: 50.0,
                margin: EdgeInsets.all(5.0),
                child: Container(
                  width: 50,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: const [
                      CircleAvatar(
                        radius: 25.0,
                        backgroundImage: NetworkImage('https://avatars.githubusercontent.com/u/41061865?v=4'),
                      ),
                       CircleAvatar(
                        radius: 7.0,
                        backgroundColor: Colors.green,

                      ),
                    ],
                  ),
                ),
              ),
              const Text("Eslam Younis Elsayed Mohamed",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              )
            ],
          )
        ],
        ),
      ),
    );
  }
}
