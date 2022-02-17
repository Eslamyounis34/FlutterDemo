import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          title: Text('I Am Rich'),
          actions: [
            IconButton(onPressed: onSearchPressed, icon: Icon(Icons.search))
          ],
          centerTitle: true,
          elevation: 10.00,
          backgroundColor: Colors.blue,
        ),
        body: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(50.0),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius:BorderRadius.circular(20.0)
              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  const Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/125779/pexels-photo-125779.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.cover,
                    height: 200.0,
                    width: 200.0,
                  ),
                  Container(
                    padding: const EdgeInsetsDirectional.only(
                      top: 10.0,
                      bottom: 10.0,
                    ),
                    color: Colors.black.withOpacity(0.5),
                    width: 200.0,
                    child: const Text('Amazing watch',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      color: Colors.white

                    )
                      ,),
                  )
                ],
              ),
            )
          ],
        ));
  }

  void onSearchPressed() {
    print('Eslam');
  }
}
