import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Contact Me',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          const Text(
            'Feel free to reach out!',
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () async {
              final Uri emailUri = Uri(scheme: 'mailto', path: 'your_email@example.com', queryParameters: {'subject': 'Hello!'});
              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              } else {
                throw 'Could not launch $emailUri';
              }
            },
            child: const Text('Send Email'),
          ),
        ],
      ),
    );
  }
}