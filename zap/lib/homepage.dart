import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> leftItems = [
    {'title': 'Push-ups', 'isCompleted': false},
    {'title': 'Squats', 'isCompleted': false},
  ];

  List<Map<String, dynamic>> rightItems = [
    {'title': 'Deadlifts', 'isCompleted': false},
    {'title': 'Jumping', 'isCompleted': false},
  ];

  bool isLeftColumn = true;

  void addItem(String exerciseName) {
    if (exerciseName.isNotEmpty) {
      setState(() {
        Map<String, dynamic> newItem = {
          'title': exerciseName,
          'isCompleted': false,
        };

        if (isLeftColumn) {
          leftItems.add(newItem);
        } else {
          rightItems.add(newItem);
        }

        isLeftColumn = !isLeftColumn;
      });
    }
  }

  void toggleCompletion(int index, List<Map<String, dynamic>> items) {
    setState(() {
      items[index]['isCompleted'] = !items[index]['isCompleted'];
    });
  }

  void showAddExerciseDialog() {
    final TextEditingController controller = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Enter Exercise Name'),
          content: TextField(
            controller: controller,
            decoration: const InputDecoration(hintText: "Exercise name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                addItem(controller.text);
                Navigator.pop(context);
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  color: const Color(0xff0F2940),
                ),
              ],
            ),
            Column(
              children: [
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.person,
                            color: Colors.white,
                          )),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.more_vert,
                            color: Colors.white,
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 16.0, top: 40.0, bottom: 30.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      "Gym Task\nReminder",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 38,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: leftItems.map((item) {
                            int index = leftItems.indexOf(item);
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Transform(
                                  transform: Matrix4.identity()
                                    ..setEntry(3, 2, 0.001)
                                    ..rotateX(0.1)
                                    ..rotateY(0.05),
                                  child: Card(
                                    elevation: 8.0,
                                    shadowColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(16.0),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(16.0),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: 250,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    "https://images.pexels.com/photos/1954524/pexels-photo-1954524.jpeg?cs=srgb&dl=pexels-willpicturethis-1954524.jpg&fm=jpg"),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(16.0),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  item['title']!,
                                                  style: const TextStyle(
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                Checkbox(
                                                  value: item['isCompleted'],
                                                  onChanged: (bool? value) {
                                                    toggleCompletion(
                                                        index, leftItems);
                                                  },
                                                  activeColor: Colors.orange,
                                                  checkColor: Colors.green,
                                                  materialTapTargetSize:
                                                      MaterialTapTargetSize
                                                          .padded,
                                                  side: BorderSide(
                                                      width: 2,
                                                      color: Colors.orange),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 30.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        "Sort by",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 16),
                                      ),
                                      Text(
                                        "Difficulty",
                                        style: TextStyle(
                                            color: Colors.amber, fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  const Icon(
                                    Icons.arrow_downward_outlined,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: rightItems.map((item) {
                                int index = rightItems.indexOf(item);
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Transform(
                                      transform: Matrix4.identity()
                                        ..setEntry(3, 2, 0.001)
                                        ..rotateX(0.1)
                                        ..rotateY(0.05),
                                      child: Card(
                                        elevation: 8.0,
                                        shadowColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(16.0),
                                          child: Column(
                                            children: [
                                              Container(
                                                height: 250,
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        "https://images.unsplash.com/photo-1534438327276-14e5300c3a48?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8dGhlJTIwZ3ltfGVufDB8fDB8fHww"),
                                                    fit: BoxFit.cover,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          16.0),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      item['title']!,
                                                      style: const TextStyle(
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w500),
                                                    ),
                                                    Checkbox(
                                                      value:
                                                          item['isCompleted'],
                                                      onChanged: (bool? value) {
                                                        toggleCompletion(
                                                            index, rightItems);
                                                      },
                                                      activeColor:
                                                          Colors.orange,
                                                      checkColor: Colors.green,
                                                      materialTapTargetSize:
                                                          MaterialTapTargetSize
                                                              .padded,
                                                      side: BorderSide(
                                                          width: 2,
                                                          color: Colors.orange),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: showAddExerciseDialog,
        backgroundColor: Colors.amber,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
