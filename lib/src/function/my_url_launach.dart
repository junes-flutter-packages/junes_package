import 'dart:io';

import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncher {
  shareText(String text, {String? subject}) {
    Share.share(text, subject: subject);
  }

  Future inBrowser(Uri url) async {
    await _launchInBrowser(url);
  }

  futureInWebViewOrVC(Uri url) async {
    await _launchInWebViewOrVC(url);
  }

  Future inWebViewWithoutJavaScript(Uri url) async {
    await _launchInWebViewWithoutJavaScript(url);
  }

  Future inWebViewWithoutDomStorage(Uri url) async {
    await _launchInWebViewWithout(url);
  }

  Future universalLinkIos(Uri url) async {
    await _launchUniversalLinkIos(url);
  }

  Future phoneCall(String phoneNumber) async {
    await _makePhoneCall(phoneNumber);
  }

  Future sendSMS(String phoneNumber, String body) async {
    await _sendSMS(phoneNumber, body);
  }

  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithoutJavaScript(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableJavaScript: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchInWebViewWithout(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(enableDomStorage: false),
    )) {
      throw 'Could not launch $url';
    }
  }

  Future<void> _launchUniversalLinkIos(Uri url) async {
    final bool nativeAppLaunchSucceeded = await launchUrl(
      url,
      mode: LaunchMode.externalNonBrowserApplication,
    );
    if (!nativeAppLaunchSucceeded) {
      await launchUrl(
        url,
        mode: LaunchMode.inAppWebView,
      );
    }
  }

  Widget launchStatus(BuildContext context, AsyncSnapshot<void> snapshot) {
    if (snapshot.hasError) {
      return Text('Error: ${snapshot.error}');
    } else {
      return const Text('');
    }
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  _sendSMS(String phoneNumber, String body) async {
    String url = "";
    if (Platform.isAndroid) {
      //FOR Android
      url = 'sms:$phoneNumber?body=$body';
      await launch(url);
    } else if (Platform.isIOS) {
      //FOR IOS
      url = 'sms:$phoneNumber?body=$body';
    }
  }
}
