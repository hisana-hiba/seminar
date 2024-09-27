import 'package:flutter/material.dart';
import 'package:status_alert/status_alert.dart';
import 'package:untitled10/ASSIGNMENT%20TWO/Alert%20Dailog.dart';

void main() {
  runApp(MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Status Alert Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MessageSenderScreen(),
    );
  }
}

class MessageSenderScreen extends StatefulWidget {
  @override
  _MessageSenderScreenState createState() => _MessageSenderScreenState();
}

class _MessageSenderScreenState extends State<MessageSenderScreen> {
  final TextEditingController _controller = TextEditingController();

  void _sendMessage() {                 //methods checks if the textfield is not empty
    if (_controller.text.isNotEmpty) { //to confirm that the message was sent
      // Show status alert
      StatusAlert.show(
        //displaying a title and subtitle along with an icon
        context,
        title: 'Message Sent',
        subtitle: 'Your message: "${_controller.text}"',
        configuration: IconConfiguration(
          icon: Icons.check_circle,
          color: Colors.green,
        ),
      );

      // Clear the text field
      _controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Send Message'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Enter your message',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _sendMessage,
              child: Text('Send Message'),
            ),
          ],
        ),
      ),
    );
  }
}