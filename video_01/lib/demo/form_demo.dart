import 'package:flutter/material.dart';

class FormDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Theme(
        data: Theme.of(context).copyWith( // 全部部分
          primaryColor: Colors.black,
        ),
        // data: ThemeData( // 全部覆盖
        //   primaryColor: Colors.black,
        // ),
        // child: ThemeDemo(),
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RegisterForm(),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterForm extends StatefulWidget {
  @override
  _RegisterFormState createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final registerFormKey = GlobalKey<FormState>();
  String username, password;
  bool autovalidate = false;

  // 点击 `Register` 按钮
  void submitRegisterForm () {
    if (registerFormKey.currentState.validate()) {  // 验证通过
      registerFormKey.currentState.save();
      debugPrint('username $username');
      debugPrint('password $password');

      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text('Registering...'),
        )
      );
    } else {  // 验证没通过，再打开 自动验证
      setState(() {
        autovalidate = true;
      });
    }
  }

  // 验证规则
  String validateUsername(value) {
    if (value.isEmpty) {
      return 'Username is required.';
    }
    return null;
  }
  String validatePassword(value) {
    if (value.isEmpty) {
      return 'Password is required.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: registerFormKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Username',
            ),
            onSaved: (value) {
              username = value;
            },
            validator: validateUsername,  // 验证程序
            // autovalidate: true, // 自动验证
            autovalidate: autovalidate, // 自动验证
          ),
          TextFormField(
            obscureText: true,    // 隐蔽的
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            onSaved: (value) {
              password = value;
            },
            validator: validatePassword,  // 验证程序
            // autovalidate: true, // 自动验证
            autovalidate: autovalidate, // 自动验证
          ),
          SizedBox(height: 32.0),
          Container(
            width: double.infinity,
            child: RaisedButton(
              color: Theme.of(context).accentColor,
              child: Text('Register', style: TextStyle(color: Colors.white)),
              elevation: 0.0,
              onPressed: submitRegisterForm,
            ),
          ),
        ],
      ),
    );
  }
}

class TextFieldDemo extends StatefulWidget {
  @override
  _TextFieldDemoState createState() => _TextFieldDemoState();
}

class _TextFieldDemoState extends State<TextFieldDemo> {
  final textEditingController = TextEditingController();

  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // textEditingController.text = 'hi';  // 设置输入框默认值
    textEditingController.addListener(  // 监听value值的改变
      () {
        debugPrint('initState: ${textEditingController.text}');
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      onChanged: (value) {
        debugPrint('input: $value');
      },
      onSubmitted: (value) {  // 按 `Enter` 键触发
        debugPrint('submit: $value');
      },
      decoration: InputDecoration(
        icon: Icon(Icons.subject),
        labelText: 'Title',
        hintText: 'Enter the post title.',
        // border: InputBorder.none,   // 去掉底部边框
        border: OutlineInputBorder(),
        filled: true,   // 背景色
      ),
    );
  }
}

class ThemeDemo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).accentColor,
    );
  }
}