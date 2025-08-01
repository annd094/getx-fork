import 'package:flutter/material.dart';
import 'package:get/get.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GetMaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       enableLog: true,
//       logWriterCallback: Logger.write,
//       // initialRoute: AppPages.INITIAL,
//       getPages: AppPages.routes,
//       locale: TranslationService.locale,
//       fallbackLocale: TranslationService.fallbackLocale,
//       translations: TranslationService(),
//     );
//   }
// }

/// Nav 2 snippet
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/first',
      getPages: [
        GetPage(
            participatesInRootNavigator: true,
            name: '/first',
            page: () => First()),
        GetPage(
          name: '/second',
          page: () => Second(),
        ),
        GetPage(
          name: '/third',
          page: () => Third(),
        ),
      ],
      debugShowCheckedModeBanner: false,
    );
  }
}

class First extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('page one'),
        leading: IconButton(
          icon: Icon(Icons.more),
          onPressed: () {
            // Get.changeTheme(
            //     context.isDarkMode ? ThemeData.light() : ThemeData.dark());

            Get.defaultDialog(
              title: "Hello",
              content: Text("This is a simple dialog box"),
              confirm: MaterialButton(
                child: Text("OK"),
                onPressed: Get.back,
              ),
            );
          },
        ),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: ElevatedButton(
            onPressed: () {
              Get.toNamed('/second?id=1');
            },
            child: Text('next screen'),
          ),
        ),
      ),
    );
  }
}

class Second extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          print('Back navigation blocked');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('page two ${Get.parameters["id"]}'),
        ),
        body: Center(
          child: Container(
            height: 300,
            width: 300,
            child: ElevatedButton(
              onPressed: () {
                Get.toNamed('/third');
              },
              child: Text('next screen'),
            ),
          ),
        ),
      ),
    );
  }
}

class Third extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text('page three'),
      ),
      body: Center(
        child: Container(
          height: 300,
          width: 300,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('go to first screen'),
          ),
        ),
      ),
    );
  }
}
