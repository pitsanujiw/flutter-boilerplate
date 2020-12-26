import 'package:url_launcher/url_launcher.dart';

Future<void> luncherURI(String urlString) async =>
    await canLaunch(urlString) ? await launch(urlString) : null;
