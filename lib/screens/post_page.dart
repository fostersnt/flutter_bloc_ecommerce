// import 'package:ecommerce/data/bloc/posts/posts_bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class PostsPage extends StatelessWidget {
//   const PostsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final PostsBloc postsBloc = PostsBloc();
//     postsBloc.add(PostsInitialFetchEvent());
//     return Center(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: BlocBuilder<PostsBloc, PostsState>(
//           bloc: postsBloc,
//           builder: (context, state) {
//             if (state is PostsFetchingLoadState) {
//               print("HELLO 1");
//               return const CircularProgressIndicator(
//                 color: Colors.amber,
//               );
//             } else if (state is PostsFetchingSuccessfulState) {
//               final fetchedData = state;
//               print("HELLO 2");
//               return ListView.builder(
//                 itemCount: fetchedData.posts.length,
//                 itemBuilder: (context, index) {
//                   return ClipRRect(
//                     borderRadius: BorderRadius.circular(20),
//                     child: Container(
//                       margin: const EdgeInsets.symmetric(vertical: 10),
//                       padding: const EdgeInsets.all(10),
//                       color: Colors.grey.shade200,
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(fetchedData.posts[index].title.toString())
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               );
//             } else if (state.runtimeType == PostsFetchingErrorState) {
//               print("HELLO 3");
//               return const Text("Error");
//             } else {
//               print("HELLO 4");
//               return const Text("Unknown");
//             }
//           },
//           buildWhen: (previous, current) {
//             print(previous);
//             return true;
//           },
//         ),
//       ),
//     );
//   }
// }
