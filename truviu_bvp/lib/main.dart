import 'package:flutter/material.dart';

void main() {
  runApp(const TruviuApp());
}

class TruviuApp extends StatelessWidget {
  const TruviuApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Truviu Demo",
        home: DefaultTabController(
            length: 2,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.black,
                    elevation: 0,
                    title: const TabBar(
                        tabs: [Tab(text: 'List v. Grid'), Tab(text: 'More')])),
                body: const TabBarView(children: [
                  ListTruviu(),
                  Center(child: Text("More coming soon"))
                ]))));
  }
}

class ListTruviu extends StatelessWidget {
  const ListTruviu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(children: [
      Column(children: const [UserInfo(), ListSection()])
    ]));
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
      decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(width: 0.5, color: Colors.grey))),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            ProfilePic(),
            Padding(
              padding: EdgeInsets.fromLTRB(13, 0, 0, 0),
              child: UserInfoText(),
            ),
          ]),
    );
  }
}

class ProfilePic extends StatelessWidget {
  const ProfilePic({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 90,
        height: 90,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: const AssetImage('assets/images/profile_pic.jpeg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.darken)),
            shape: BoxShape.circle));
  }
}

class UserInfoText extends StatelessWidget {
  const UserInfoText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      Column(children: const [
        Text("Farhan Tajwar", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("2000 followers")
      ]),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(2)),
            child: const Text("Follow", style: TextStyle(color: Colors.white))),
      )
    ]);
  }
}

class ListSection extends StatelessWidget {
  const ListSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Column(children: const [HeadingText(), TileList()]),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(8),
        child: Text("Farhan's Folders",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)));
  }
}

class TileList extends StatelessWidget {
  const TileList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: const [
      CustomTile('assets/images/us_visa.jpeg', 'US VISA'),
      CustomTile('assets/images/uniapps.jpeg', 'University Applications'),
      CustomTile('assets/images/cooking.jpeg', 'Cooking')
    ]);
  }
}

class CustomTile extends StatelessWidget {
  final String _imgPath;
  final String _text;

  const CustomTile(this._imgPath, this._text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5),
        child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(_imgPath),
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.darken)),
              borderRadius: BorderRadius.circular(3),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[800]!,
                    blurRadius: 1,
                    spreadRadius: 1,
                    offset: const Offset(3, 3))
              ],
            ),
            child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 1),
                  child: Text(_text,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25)),
                ))));
  }
}
