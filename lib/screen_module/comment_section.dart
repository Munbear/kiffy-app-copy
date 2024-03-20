import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CommentSection extends ConsumerStatefulWidget {
  const CommentSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentSectionState();
}

class _CommentSectionState extends ConsumerState<CommentSection> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.7,
      width: double.infinity,
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 56,
            child: Slidable(
              key: ValueKey(0),
              child: ListTile(
                onTap: () {},
                leading: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.asset(
                    "assets/images/test_image.png",
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text("hello world"),
              ),
              endActionPane: ActionPane(
                motion: const ScrollMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFFFE4A49),
                    foregroundColor: Colors.white,
                    icon: Icons.delete,
                    label: 'Delete',
                  ),
                  SlidableAction(
                    onPressed: (context) {},
                    backgroundColor: Color(0xFF21B7CA),
                    foregroundColor: Colors.white,
                    icon: Icons.share,
                    label: 'Share',
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
