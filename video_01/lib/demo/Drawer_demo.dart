import 'package:flutter/material.dart';

class DrawerDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(8.0),
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('moxiaoyan', style: TextStyle(fontWeight: FontWeight.bold)),
            accountEmail: Text('moxiaoyan@qq.com'),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage('https://resources.ninghao.org/images/wanghao.jpg'),
            ),
            decoration: BoxDecoration(
              color: Colors.yellow[400],
              image: DecorationImage(
                image: NetworkImage('https://resources.ninghao.org/images/childhood-in-a-picture.jpg'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(  // 遮罩层，颜色
                  Colors.yellow[400].withOpacity(0.6),  
                  BlendMode.hardLight,
                ),
              ),
            ),
          ),
          // DrawerHeader(
          //   child: Text('Header'.toUpperCase()),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[100],
          //   ),
          // ),
          ListTile(
            title: Text('Message', textAlign: TextAlign.right),
            // leading: Icon(Icons.message, color: Colors.black12, size:22.0), // 左边icon
            trailing: Icon(Icons.message, color: Colors.black12, size:22.0),  // 右边icon
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Favorite', textAlign: TextAlign.right),
            trailing: Icon(Icons.favorite, color: Colors.black12, size:22.0),
            onTap: () => Navigator.pop(context),
          ),
          ListTile(
            title: Text('Settings', textAlign: TextAlign.right),
            trailing: Icon(Icons.settings, color: Colors.black12, size:22.0),
            onTap: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}