import 'package:barcode_scan/platform_wrapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart';
import 'package:origin_china/pages/common_webview_page.dart';
import 'package:origin_china/pages/shake_page.dart';

class FindPage extends StatefulWidget {
  @override
  _FindPageState createState() => _FindPageState();
}

class _FindPageState extends State<FindPage> {
  List<Map<String, IconData>> blocks = [
    {
      '开源众包': Icons.pageview,
      '开源软件': Icons.speaker_notes_off,
      '码云推荐': Icons.screen_share,
      '代码片段': Icons.assignment,
    },
    {
      '扫一扫': Icons.camera_alt,
      '摇一摇': Icons.camera,
    },
    {
      '码云封面人物': Icons.person,
      '线下活动': Icons.android,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('发现'),
        centerTitle: true,
        backgroundColor: Color(AppColors.APP_GREEN_COLOR),
      ),
      body: ListView.builder(
          itemCount: blocks.length,
          itemBuilder: (context, blockndex) {
            Map<String, IconData> block = blocks[blockndex];
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(width: 1)),
              ),
              child: ListView.separated(
                  //滑动冲突
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: ListTile(
                        leading: Icon(block.values.elementAt(index)),
                        title: Text(block.keys.elementAt(index)),
                        trailing: Icon(Icons.keyboard_arrow_right),
                      ),
                      onTap: () {
                        _doItemClick(block.keys.elementAt(index));
                      },
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider();
                  },
                  itemCount: blocks[blockndex].length),
            );
          }),
    );
  }

  void _doItemClick(String title) {
    switch (title) {
      case '开源众包':
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommonWebViewPage(
                  title: title,
                  url: 'https://zb.oschina.net/',
                )));
        break;
      case '扫一扫':
        scan();
        break;
      case '摇一摇':
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context)=>ShakePage()));
        break;
    }
  }

  void scan() async {
    var result = await BarcodeScanner.scan();

    print(result.type); // The result type (barcode, cancelled, failed)
    print(result.rawContent); // The barcode content
    print(result.format); // The barcode format (as enum)
    print(result.formatNote); // If a unknown format was scanned this field contains a note
  }

}
