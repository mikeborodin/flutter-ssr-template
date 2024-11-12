import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CtaButton extends StatelessWidget {
  final String ctaText;
  final String link;

  const CtaButton({
    super.key,
    required this.ctaText,
    required this.link,
  });

  Future<void> _navigate(BuildContext context) async {
    if (link.startsWith('/')) {
      Navigator.of(context).pushNamed(link);
      return;
    }
    final url = Uri.tryParse(link);
    if (url == null) return;
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $link';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _navigate(context),
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
        child: Text(
          ctaText,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
