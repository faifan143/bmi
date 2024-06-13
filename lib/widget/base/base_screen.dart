
import 'package:bmi/constants.dart';
import 'package:bmi/widget/custom_button.dart';
import 'package:flutter/material.dart';
import '../../screens/history_screen.dart';
import '../../screens/home_screen.dart';
import 'navigation_drawer.dart';
class BaseScreen extends StatefulWidget {
  final Widget childWidget;
  final VoidCallback onButtonPressed;
  final String buttonText;

  const BaseScreen({Key? key,
    required this.childWidget,
    required this.onButtonPressed,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<BaseScreen> createState() => _BaseScreenState();
}

class _BaseScreenState extends State<BaseScreen> {
  var scaffoldKey = GlobalKey<ScaffoldState>();
  int _selectedDestination = 0;


  @override
  Widget build(BuildContext context) {
    void selectDestination(int index) {
      setState(() {
        _selectedDestination = index;
      });
    }

    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kBackgroundColor,
          leading: IconButton(
            onPressed: () {
              scaffoldKey.currentState?.openDrawer();
            },
            icon: const Icon(Icons.more_vert),
            color: kTextColor,
          ),
          centerTitle: true,
          title: const Text(
            'bmi',
            style: TextStyle(color: kTextColor, fontWeight: FontWeight.w400),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: widget.childWidget,
            ),
            const SizedBox(
              height: 10,
            ),
            CustomButton(widget.buttonText, widget.onButtonPressed),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
        drawer:  Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              Container(
                width: 200,
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/bmi6.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.home),
                title: const Text('Home'),
                selected: _selectedDestination == 1,
                onTap: () {
                  selectDestination(1);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HomeScreen();
                  }));
                },
              ),
              ListTile(
                leading: const Icon(Icons.history),
                title: const Text('History'),
                selected: _selectedDestination == 1,
                onTap: () {
                  selectDestination(1);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const HistoryScreen();
                  }));
                },
              ),
              const Divider(
                height: 1,
                thickness: 1,
              ),
              Container(
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'Copyright',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


