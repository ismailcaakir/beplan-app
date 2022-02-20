import 'package:flutter/material.dart';
import '../../components/widgets/no_entity_widget.dart';

class CategoryPageView extends StatelessWidget {
  const CategoryPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NoEntityWidget(
        text: "Didn't Create a Category",
        subtext: "Create a new category",
      ),
    );
  }
}
