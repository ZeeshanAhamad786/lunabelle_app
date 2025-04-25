import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'dart:io';

class WebsiteConvertApp extends StatefulWidget {
  const WebsiteConvertApp({super.key});

  @override
  State<WebsiteConvertApp> createState() => _WebsiteConvertAppState();
}

class _WebsiteConvertAppState extends State<WebsiteConvertApp> {
  late final WebViewController _controller;
  RxBool isLoading = true.obs;
  RxBool hasError = false.obs;
  RxBool isRefreshing = false.obs;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading.value = true;
            hasError.value = false;
          },
          onPageFinished: (String url) {
            isLoading.value = false;
            _controller.runJavaScript(
                "document.querySelector('meta[name=viewport]')?.setAttribute('content', 'width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no');"
            );
          },
          onHttpError: (HttpResponseError error) {
            hasError.value = true;
            isLoading.value = false;
          },
          onWebResourceError: (WebResourceError error) {
            hasError.value = true;
            isLoading.value = false;
          },
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.google.com/')) {
              return NavigationDecision.prevent;
            }
            isLoading.value = true;
            hasError.value = false;
            return NavigationDecision.navigate;
          },
        ),
      );

    _checkInternetAndLoadPage();
  }

  void _checkInternetAndLoadPage() async {
    isLoading.value = true;
    hasError.value = false;

    if (await _isConnected()) {
      _controller.loadRequest(Uri.parse('https://www.lunabelle.in/'));
    } else {
      isLoading.value = false;
      hasError.value = true;
    }
  }

  Future<bool> _isConnected() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  Future<void> _refreshPage() async {
    isRefreshing.value = true;
    hasError.value = false;

    if (await _isConnected()) {
      await _controller.reload();
    } else {
      hasError.value = true;
    }

    isRefreshing.value = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (await _controller.canGoBack()) {
          _controller.goBack();
          return false;
        }
        return true;
      },
      child: Obx(() => Scaffold(
        appBar: AppBar(title: Text("Lunabella",style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold),),centerTitle: true,),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _refreshPage,
            child: Stack(
              children: [
                if (!hasError.value)
                  WebViewWidget(controller: _controller),
                if (hasError.value)
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.wifi_off, size: 100, color: Colors.red),
                        const SizedBox(height: 16),
                        const Text(
                          'No internet connection',
                          style: TextStyle(fontSize: 18),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: _checkInternetAndLoadPage,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  ),
                if (isLoading.value && !hasError.value)
                  const Center(child: CircularProgressIndicator()),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
