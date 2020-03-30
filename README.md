# FlutterApp

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Dev Doc

#### 1、初始化
在runApp中进行一下初始化操作：

```java
//非加密方式初始化
Bmob.init("https://api2.bmob.cn", "486892a74f6ce4c1dffc5ecf9a7700d7", "0ab358c02de6b3b72baa88ce3faa80a0");
//超级权限非加密方式初始化
Bmob.initMasterKey("https://api2.bmob.cn", "appId","apiKey","349e551c9cdd38360dc3487c31d71451");
//加密方式初始化
Bmob.initEncryption("https://api2.bmob.cn", "secretKey", "apiSafe");
//超级权限加密方式初始化
Bmob.initEncryptionMasterKey("https://api2.bmob.cn","secretKey","apiSafe","masterKey");
```
#### 2、导入源码

Dart要求，在使用具体功能代码的时候需要先导入对应代码的所在源文件。 例如，使用BmobUser前需要导入：

`import 'package:data_plugin/bmob/table/bmob_user.dart';`

#### 3、发布库

此SDK插件只用于Bmob数据服务相关的数据操作，与此服务无关的UI以及其他涉及平台功能的操作需要开发者自行编写。Dart允许开发者自己编写相关的UI库以及平台插件，并发布到Dart仓库供所有开发者使用，具体可以参考：

[参考](https://zhuanlan.zhihu.com/p/60136574)

[Serverless doc](http://doc.bmob.cn/data/flutter/index.html)