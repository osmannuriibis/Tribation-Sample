import 'package:flutter/material.dart';

class MyBaseListView<T> extends StatelessWidget {
  final List<T>? list;
  final bool isSeparator;
  final Widget Function(T model, int index) builder;
  final String emptyTitle;

  final bool shrinkWrap;

  final ScrollPhysics? physics;

  final Widget seperator;
  const MyBaseListView(
      {Key? key,
      required this.builder,
      required this.list,
      this.isSeparator = true,
      this.seperator = const Divider(),
      this.emptyTitle = "Veri Yok",
      this.shrinkWrap = true,
      this.physics = const NeverScrollableScrollPhysics()})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return list == null
        ? const CircularProgressIndicator()
        : list!.isEmpty
            ? (emptyTitle.isNotEmpty
                ? ListTile(
                    title: Text(emptyTitle),
                  )
                : const SizedBox.shrink())
            : isSeparator
                ? ListView.separated(
                    itemBuilder: itemBuilder,
                    itemCount: list!.length,
                    shrinkWrap: shrinkWrap,
                    physics: physics,
                    separatorBuilder: (_, __) => seperator,
                  )
                : ListView.builder(
                    itemBuilder: itemBuilder,
                    itemCount: list!.length,
                    shrinkWrap: shrinkWrap,
                    physics: physics,
                  );
  }

  Widget itemBuilder(BuildContext context, int index) {
    return builder(list![index], index);
  }
}
