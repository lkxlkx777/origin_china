import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:origin_china/contants/constans.dart';

// ignore: must_be_immutable
class CommonWebViewPage extends StatefulWidget {

  String title;
  String url;

  CommonWebViewPage({Key key, this.title, @required this.url})
      :assert(url != null),
        super(key: key);

  @override
  _CommonWebViewPageState createState() => _CommonWebViewPageState();
}

class _CommonWebViewPageState extends State<CommonWebViewPage> {

  FlutterWebviewPlugin webviewPlugin = FlutterWebviewPlugin();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    webviewPlugin.onStateChanged.listen((event) {
      if(event.type == WebViewState.finishLoad){
        if(mounted){
          setState(() {
            isLoading = false;
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> titleWidgets = [
      Text(widget.title)
    ];

    if(isLoading){
      titleWidgets.add(SizedBox(width: 10,));
      titleWidgets.add(CupertinoActivityIndicator());
    }

    return WebviewScaffold(
      appBar: AppBar(
        backgroundColor: Color(AppColors.APP_GREEN_COLOR),
        title: Row(
          children: titleWidgets,
        ),
      ),
      url: widget.url,
      withJavascript: true,
      withZoom: true,
      withLocalStorage: true,
    );
  }


}

