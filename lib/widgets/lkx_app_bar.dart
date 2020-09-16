import 'package:flutter/material.dart';
import 'package:origin_china/contants/constans.dart' show AppColors;

 class LkxAppBar extends StatefulWidget with PreferredSizeWidget {

  final String title;
  final PreferredSizeWidget bottom;

  LkxAppBar({
    Key key,
    @required this.title,
    this.bottom,
  }):assert(title!=null);

  @override
  _LkxAppBarState createState() => _LkxAppBarState(title);

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight + (bottom?.preferredSize?.height ?? 0.0));
}

class _LkxAppBarState extends State<LkxAppBar> {

  String title;

  _LkxAppBarState(this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title,style: TextStyle(color: Colors.black),),
      backgroundColor: Colors.white,
      leading: InkWell(
        onTap: (){
          Navigator.of(context).pop();
        },
        child: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      elevation: 0.0,

    );
  }
}
