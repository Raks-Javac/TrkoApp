import 'package:flutter/material.dart';
import 'package:trko/src/animations/page_transition.dart';
import 'package:trko/src/screens/contacts.dart';
import 'package:trko/src/screens/payments.dart';
import 'package:trko/src/screens/project.dart/projectCreate.dart';
import 'package:trko/src/screens/project.dart/projects.dart';
import 'package:trko/src/screens/trkoSignIn.dart';

class TrkoHome extends StatefulWidget {
  @override
  _TrkoHomeState createState() => _TrkoHomeState();
}

class _TrkoHomeState extends State<TrkoHome> {
  void _onTap(int val) {
    setState(() {
      _currentIndex = val;
    });
  }

  String appBarText() {
    switch (_currentIndex) {
      case 0:
        return "Projects";
        break;
      case 1:
        return "Payments";
        break;
      case 2:
        return "Contacts";
        break;
      default:
        return "";
    }
  }

  int _currentIndex = 0;
  final List<Widget> _screens = [Projects(), Payments(), Contacts()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        toolbarHeight: 65,
        title: Text(
          appBarText(),
          style: TextStyle(fontSize: 22),
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.of(context).pushReplacement(
                    PreviewSlideRoute(preview: TrkoSignIn(), duration: 200));
              })
        ],
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        height: 70,
        child: BottomNavigationBar(
          onTap: (val) {
            _onTap(val);
          },
          unselectedIconTheme: IconThemeData(size: 19.0),
          selectedFontSize: 20.0,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/home.png")),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/transaction.png")),
                label: ""),
            BottomNavigationBarItem(
                icon: ImageIcon(AssetImage("assets/icons/profile.png")),
                label: ""),
          ],
        ),
      ),
      // floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     Navigator.of(context)
      //         .push(PreviewSlideRoute(preview: CreateProject(), duration: 200));
      //   },
      //   backgroundColor: Theme.of(context).primaryColor,
      //   child: Icon(
      //     Icons.add,
      //     color: Colors.black.withOpacity(0.4),
      //   ),
      // ),
    );
  }
}
