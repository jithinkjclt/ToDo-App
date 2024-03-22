import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataList extends StatefulWidget {
  const DataList({super.key});

  @override
  State<DataList> createState() => _DataListState();
}

class _DataListState extends State<DataList> {
  List<String> data = [];

  TextEditingController datactr = TextEditingController();
  TextEditingController editctr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return Builder(builder: (context) {
                      return AlertDialog(
                        content: Text("""1)Adding Tasks:
Easily add new tasks to your list. Keep track of everything you need to do by simply inputting the task details.

2)Deleting Tasks:
Remove tasks that are no longer relevant or completed. Maintain a clutter-free task list by deleting unnecessary items.

3)Editing Tasks:
Modify task details seamlessly by tapping on the respective task. Update descriptions, due dates, or any other relevant information with ease. """),
                        title: Text("Info"),
                      );
                    });
                  },
                );
              },
              child: Icon(
                Icons.info,
                color: Colors.white,
              )),
          SizedBox(
            width: 10,
          )
        ],
        leadingWidth: 100,
        leading: SizedBox(
          width: 100,
        ),
        title: Text(
          '      ToDo ',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Color(0xFF3718B7),
      body: Column(
        children: [
          Expanded(
              child: ListView.separated(
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          editctr.text = data[index];
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (context) {
                              return AlertDialog(
                                  title: const Text("Edit"),
                                  content: Container(
                                    height: 170,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          onChanged: (value) {},
                                          controller: editctr,
                                          onTap: () {},
                                          decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15))),
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                            data.removeAt(index);
                                            data.insert(index, editctr.text);

                                            setState(() {});
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                color: Color(0xFF3718B7),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: const Center(
                                              child: Text(
                                                "Submit",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ));
                            },
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 8.0, right: 8.0, top: 5),
                          child: Container(
                            width: 390,
                            height: 70,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(25))),
                            child: Center(
                              child: Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    data[index],
                                    style: const TextStyle(color: Colors.black),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {
                                      setState(() {
                                        data.removeAt(index); // Corrected line
                                      });
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ));
                  },
                  separatorBuilder: (context, index) {
                    return const SizedBox(
                      height: 10,
                    );
                  },
                  itemCount: data.length)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: datactr,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(25))),
                    suffixIcon: datactr.text.isNotEmpty
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                data.add(datactr.text);
                                datactr.clear();
                              });
                            },
                            icon: const Icon(
                              Icons.send,
                              color: Colors.white,
                            ))
                        : IconButton(
                            icon: const Icon(
                              Icons.mic,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ))),
          ),
        ],
      ),
    );
  }
}
