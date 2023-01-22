import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'common_appbar.dart';

class CommonInAppWebView extends StatefulWidget {
  final String url;
  final String? title;
  const CommonInAppWebView({super.key, required this.url, this.title});

  @override
  State<CommonInAppWebView> createState() => _CommonInAppWebViewState();
}

class _CommonInAppWebViewState extends State<CommonInAppWebView> {
  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.title != null && widget.title!.isNotEmpty
          ? CommonAppBar(
              title: widget.title,
            )
          : null,
      body: SafeArea(
        child: Stack(
          children: [
            InAppWebView(
              initialUrlRequest: URLRequest(
                url: Uri.parse(
                  widget.url,
                ),
              ),
              gestureRecognizers: Set()
                ..add(Factory<VerticalDragGestureRecognizer>(
                    () => VerticalDragGestureRecognizer())),
              initialOptions: InAppWebViewGroupOptions(
                crossPlatform: InAppWebViewOptions(
                  mediaPlaybackRequiresUserGesture: false,
                  useOnDownloadStart: true,
                ),
              ),
              onProgressChanged: (controller, progress) {
                if (progress == 100) {
                  setState(() {
                    isLoading = false;
                  });
                }
              },
              androidOnPermissionRequest: (InAppWebViewController controller,
                  String origin, List<String> resources) async {
                return PermissionRequestResponse(
                    resources: resources,
                    action: PermissionRequestResponseAction.GRANT);
              },
            ),
            if (isLoading) const Center(child: CircularProgressIndicator())
          ],
        ),
      ),
    );
  }
}
