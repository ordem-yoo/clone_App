// ignore_for_file: use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:math';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:kakao_clone/data/data.dart';

class KakaoHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    List<IconData> icons = [
      FontAwesomeIcons.magnifyingGlass,
      FontAwesomeIcons.comment,
      FontAwesomeIcons.comments,
      FontAwesomeIcons.gear
    ];

    return Scaffold(
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Color(0xff181818),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.user), label: ''),
            BottomNavigationBarItem(
                icon: Badge(
                    padding: EdgeInsets.all(3),
                    shape: BadgeShape.square,
                    borderRadius: BorderRadius.circular(12),
                    badgeContent: Text(
                      "351",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    child: Icon(icons[1])),
                label: ''),
            BottomNavigationBarItem(
                icon: Icon(FontAwesomeIcons.eye), label: ''),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ''),
            BottomNavigationBarItem(
                icon: Badge(
                    position: BadgePosition.topStart(top: 0, start: 23),
                    padding: EdgeInsets.all(2),
                    child: Icon(FontAwesomeIcons.ellipsis)),
                label: ''),
          ],
        ),
      ),
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Row(
          children: [
            GestureDetector(
              onTap: () {},
              child: Badge(
                position: BadgePosition.topStart(top: -1, start: 30),
                padding: EdgeInsets.all(2),
                child: Text("채팅"),
              ),
            ),
            SizedBox(
              width: 15,
            ),
            GestureDetector(
              onTap: () {},
              child: Badge(
                position: BadgePosition.topStart(top: -1, start: 60),
                padding: EdgeInsets.all(2),
                child: Text("오픈채팅"),
              ),
            ),
          ],
        ),
        actions: [
          ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 4,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return IconButton(
                icon: FaIcon(icons[index], size: 18),
                onPressed: () {},
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(
                'images/banner.jpg',
              ),
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(
              height: 652,
              child: ListView.builder(
                itemCount: 30,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 4.0),
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                      ),
                      child: Image.network(
                        "https://picsum.photos/${index}00/${index}00",
                        fit: BoxFit.cover,
                      ),
                      clipBehavior: Clip.antiAlias,
                    ),
                    minVerticalPadding: 22,
                    title: Text(KakaoData().friendsName[index]),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 0),
                      child: Text(
                        KakaoData().chatContent[index],
                        style: TextStyle(color: Colors.white70, fontSize: 12),
                      ),
                    ),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          KakaoData().chatTime[index],
                          style: TextStyle(color: Colors.white70, fontSize: 10),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        if (index == index / 2 + 3)
                          Badge(
                            padding: EdgeInsets.all(5),
                            badgeContent: Text('${index + 25}'),
                          )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
