import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class MainDialog extends StatelessWidget {
  const MainDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dialogs',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeDialog(),
    );
  }
}

class HomeDialog extends StatelessWidget {
  const HomeDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _showAlert(context);
              },
              child: const Text('Show Alert!'),
            ),
            ElevatedButton(
              onPressed: () {
                _showListAlert(context);
              },
              child: const Text('Show List Alert!'),
            ),
            ElevatedButton(
              onPressed: () {
                _showConfirmationAlert(context);
              },
              child: const Text('Show List Alert!'),
            ),
          ],
        ),
      ),
    );
  }

  _showConfirmationAlert(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
              title: Text('Discard draft?'),
              content: Text('Action cannot be undone'),
              actions: [
                BasicDialogAction(
                  title: Text('Cancel'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                BasicDialogAction(
                  title: Text('Discard'),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ));
  }

  _showAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text('Current Location Not Available'),
        content:
            Text('Your current location can\'t be determined at this time'),
        actions: [
          BasicDialogAction(
            title: Text('Okay'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  _showListAlert(BuildContext context) {
    showPlatformDialog(
      context: context,
      builder: (_) => BasicDialogAlert(
        title: Text('Select account'),
        content: Expanded(
          flex: 3,
          child: Container(
            height: 200,
            child: ListView(
              children: [
                _buildListSampleItem('First one'),
                _buildListSampleItem('Second one'),
                _buildListSampleItem('Third one'),
                _buildListSampleItem('Forth'),
                Text('data'),
                Text('data'),
                Text('data'),
                Text('data'),
              ],
            ),
          ),
        ),
        actions: [
          BasicDialogAction(
            title: Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  Widget _buildListSampleItem(String title) {
    return Container(
      height: 30,
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          CircleAvatar(),
          SizedBox(
            width: 8,
          ),
          Text(
            title,
            style: TextStyle(fontSize: 12),
          )
        ],
      ),
    );
  }
}
