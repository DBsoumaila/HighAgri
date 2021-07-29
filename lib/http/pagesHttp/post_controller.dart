import 'package:flutter/material.dart';
import 'package:ha2/http/pagesHttp/posts_view.dart';
import 'package:ha2/widget/navigation_drawer_widget.dart';

class PostController extends StatelessWidget {
  static final String title = 'High Agri';

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: title,
        theme: ThemeData(primarySwatch: Colors.green),
        home: PostPageControl(),
      );
}

class PostPageControl extends StatefulWidget {
  @override
  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPageControl> {
  @override
  Widget build(BuildContext context) => Scaffold(
        drawer: NavigationDrawerWidget(),

        // endDrawer: NavigationDrawerWidget(),
        appBar: AppBar(
          title: Text('http answers'),
          actions: [
            Image.asset('assets/images/logohagri.png'),
          ],
        ),
        body: Center(
          child: PostsPage(),
        ),
      );
}
