import 'package:flutter/material.dart';
import 'package:flutter_demo/widgets_study/SamplePage.dart';
import 'package:flutter_demo/widgets_study/single/Align.dart';
import 'package:flutter_demo/widgets_study/single/AspectRatio.dart';
import 'package:flutter_demo/widgets_study/single/Center.dart';
import 'package:flutter_demo/widgets_study/single/ConstrainedBox.dart';
import 'package:flutter_demo/widgets_study/single/Container.dart';
import 'package:flutter_demo/widgets_study/single/FittedBox.dart';
import 'package:flutter_demo/widgets_study/single/Padding.dart';

void main() => runApp(new MyApp());

List<String> studyLayouts = [
  "SamplePage",
];

List<String> singleLayoutWidgets = [
  "Container",
  "Padding",
  "Center",
  "Align",
  "FittedBox",
  "AspectRatio",
  "ConstrainedBox",
  "Baseline",
  "FractionallySizedBox",
  "IntrinsicHeight",
  "IntrinsicWidth",
  "LimitedBox",
  "Offstage",
  "OverflowBox",
  "SizedBox",
  "SizedOverflowBox",
  "Transform",
  "CustomSingleChildLayout",
];

List<String> multiLayoutWidgets = [
  "Row",
  "Column",
  "Stack",
  "IndexedStack",
  "Flow",
  "Table",
  "Wrap",
  "ListBody",
  "ListView",
  "CustomMultiChildLayout",
];

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Layout Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Flutter Demo Home Page'),
      routes: <String, WidgetBuilder>{
        '/SamplePage': (_) => new SamplePage(),
        '/Container': (_) => new LYContainer(),
        '/Padding': (_) => new LYPadding(),
        '/Center': (_) => new LYCenter(),
        '/Align': (_) => new LYAlign(),
        '/FittedBox': (_) => new LYFittedBox(),
        '/AspectRatio': (_) => new LYAspectRatio(),
        '/ConstrainedBox': (_) => new LYConstrainedBox(),

        '/Baseline': (_) => new LYPadding(),
        '/FractionallySizedBox': (_) => new LYPadding(),
        '/IntrinsicHeight': (_) => new LYPadding(),

        '/IntrinsicWidth': (_) => new LYPadding(),
        '/LimitedBox': (_) => new LYPadding(),
        '/Offstage': (_) => new LYPadding(),

        '/OverflowBox': (_) => new LYPadding(),
        '/SizedBox': (_) => new LYPadding(),
        '/SizedOverflowBox': (_) => new LYPadding(),

        '/Transform': (_) => new LYPadding(),
        '/CustomSingleChildLayout': (_) => new LYPadding(),

        '/Row': (_) => new LYPadding(),
        '/Column': (_) => new LYPadding(),
        '/Stack': (_) => new LYPadding(),
        '/IndexedStack': (_) => new LYPadding(),
        '/Flow': (_) => new LYPadding(),
        '/Table': (_) => new LYPadding(),
        '/Wrap': (_) => new LYPadding(),
        '/ListBody': (_) => new LYPadding(),
        '/ListView': (_) => new LYPadding(),
        '/CustomMultiChildLayout': (_) => new LYPadding(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

void _navigateToPage(BuildContext context, String page) {
  print("Page:$page");
  Navigator.of(context).pushNamed('/$page');
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    List<String> layoutWidgets = [];
    layoutWidgets.add("------------layout study-----------");
    layoutWidgets.addAll(studyLayouts);
    layoutWidgets.add("------------Single-child layout widgets-----------");
    layoutWidgets.addAll(singleLayoutWidgets);
    layoutWidgets.add("------------Multi-child layout widgets------------");
    layoutWidgets.addAll(multiLayoutWidgets);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new ListView.builder(
        itemBuilder: (BuildContext buildContext, int index) {
          return new ListTile(
            title: new LayoutListItem(
              index: index,
              title: layoutWidgets[index],
              onPress: () {
                String item = layoutWidgets[index];
                if (item.startsWith("--")) {
                  return;
                }

                _navigateToPage(context, layoutWidgets[index]);
              },
            ),
          );
        },
        itemCount: (studyLayouts.length + singleLayoutWidgets.length +
            multiLayoutWidgets.length + 2),
      ),
    );
  }
}

class LayoutListItem extends StatelessWidget {
  LayoutListItem({this.index, this.title, this.onPress});

  final int index;
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: onPress,
      child: new Center(
        child: new Text(
          "$title",
          style: new TextStyle(fontSize: 16.0, color: Colors.black),
        ),
      ),
    );
  }
}
