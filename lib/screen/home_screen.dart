import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Indent Management System',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(

        children: <Widget>[
          // Side Menu
          Container(
            width: MediaQuery.of(context).size.width * 0.2, // 30% of the screen width
            color: Colors.blue[100],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                ListTile(
                  title: Text('Indents List'),
                  onTap: () {
                    _onItemTapped(0);
                  },
                ),
                ListTile(
                  title: Text('Create Indent'),
                  onTap: () {
                    _onItemTapped(1);
                  },
                ),
                ListTile(
                  title: Text('Profile'),
                  onTap: () {
                    _onItemTapped(2);
                  },
                ),
                ListTile(
                  title: Text('Settings'),
                  onTap: () {
                    _onItemTapped(3);
                  },
                ),
                // Add more menu items as needed
              ],
            ),
          ),
          // Main Content
          Expanded(
            child: _selectedIndex == 0
                ? IndentsListScreen()
                : _selectedIndex == 1
                ? CreateIndentScreen()
                : _selectedIndex == 2
                ? ProfileScreen()
                : SettingsScreen(),
          ),
        ],
      ),
    );
  }
}

class IndentsListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated Data
    List<String> indents = ["Indent 1", "Indent 2", "Indent 3"];

    return ListView.builder(
      itemCount: indents.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(indents[index]),
          subtitle: Text('Details of ${indents[index]}'),
        );
      },
    );
  }
}

class CreateIndentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy UI for Create Indent
    return Center(
      child: Text('Create Indent Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Settings Screen'),
    );
  }
}
