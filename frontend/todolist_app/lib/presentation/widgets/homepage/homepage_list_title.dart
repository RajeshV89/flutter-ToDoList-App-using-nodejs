import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:todolist_app/data/model/todolist_model.dart';
import 'package:todolist_app/presentation/bloc/getToDoListBloc/get_to_do_list_bloc.dart';

class HomePageListTile extends StatelessWidget {
  final List<TodoListModel> toDoListData;
  const HomePageListTile({super.key, required this.toDoListData});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<GetToDoListBloc>().add(LoadToDoList());
      },
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ScrollablePositionedList.builder(
              itemCount: 30,
              scrollDirection: Axis.horizontal,
              initialScrollIndex: 9,
              itemBuilder: (BuildContext context, int index) {
                return SizedBox(
                  height: 50,
                  width: 50,
                  child: Text('$index'),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: toDoListData.length,
                itemBuilder: (context, index) => Dismissible(
                      key: Key('${toDoListData[index].sId}'),
                      direction: DismissDirection.endToStart,
                      background: Container(
                          color: Colors.red,
                          height: 50,
                          child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.delete, color: Colors.white),
                                SizedBox(
                                  width: 10,
                                )
                              ])),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.grey.shade200),
                          height: MediaQuery.sizeOf(context).aspectRatio * 200,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.amber.shade500),
                                    width: 5),
                                const SizedBox(width: 10),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('${toDoListData[index].taskName}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium),
                                    Text('${toDoListData[index].taskDetail}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall),
                                  ],
                                )),
                                Column(
                                  children: [
                                    Expanded(
                                      child: Row(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(Icons.edit)),
                                          Checkbox(
                                              value:
                                                  toDoListData[index].taskCheck,
                                              onChanged: (bool? newTaskCheck) {
                                                toDoListData[index].taskCheck =
                                                    newTaskCheck!;
                                              }),
                                        ],
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        if (toDoListData[index].priority ==
                                            true)
                                          Container(
                                            width: 60,
                                            decoration: const BoxDecoration(
                                                color: Color.fromARGB(
                                                    255, 244, 86, 86),
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                )),
                                            child: const Center(
                                                child: Text("Priority")),
                                          )
                                        else
                                          const SizedBox(
                                            height: 17,
                                          )
                                      ],
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      ),
                    )),
          ),
        ],
      ),
    );
  }
}
