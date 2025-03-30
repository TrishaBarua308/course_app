import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseDetailsPage extends StatelessWidget {
  final String courseName;
  final String pdf;
  final String youtubeLink;
  final String handNote;
  final String purpose;
  final String description;

  const CourseDetailsPage({
    Key? key,
    required this.courseName,
    required this.pdf,
    required this.youtubeLink,
    required this.handNote,
    required this.purpose,
    required this.description,
  }) : super(key: key);

  // URL লঞ্চ ফাংশন
  Future<void> _launchURL(String url) async {
    Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(courseName)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(courseName,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall), // Use headlineSmall here
            const SizedBox(height: 20),
            Text(description),
            const SizedBox(height: 10),
            if (pdf.isNotEmpty)
              TextButton(
                onPressed: () => _launchURL(pdf),
                child: const Text("View PDF"),
              ),
            if (youtubeLink.isNotEmpty)
              TextButton(
                onPressed: () => _launchURL(youtubeLink),
                child: const Text("Watch on YouTube"),
              ),
            if (handNote.isNotEmpty)
              TextButton(
                onPressed: () => _launchURL(handNote),
                child: const Text("Download Handnote"),
              ),
            if (purpose.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  purpose,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
