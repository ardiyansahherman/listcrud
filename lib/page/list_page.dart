import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  TextEditingController bukuController = TextEditingController();
  TextEditingController penulisController = TextEditingController();

  TextEditingController bukuEditController = TextEditingController();
  TextEditingController penulisEditController = TextEditingController();

  List<Map<String, dynamic>> myData = [];

  void _showDialogEdit(int index, Map<String, dynamic> data) {
    bukuEditController.text = data["buku"];
    penulisEditController.text = data["penulis"];
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Edit Data",
              style: TextStyle(
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            content: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: bukuEditController,
                  decoration: const InputDecoration(
                    labelText: "Buku : ",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: penulisEditController,
                  decoration: const InputDecoration(
                    labelText: "Penulis : ",
                    labelStyle: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink,
                  ),
                  onPressed: () {
                    // String name = nameEditController.text;
                    // String skill = skillEditController.text;

                    String buku = bukuEditController.text;
                    String penulis = penulisEditController.text;

                    myData[index]["buku"] = buku;
                    myData[index]["penulis"] = penulis;
                    bukuEditController.text = "";
                    penulisEditController.text = "";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: const Text("Edit")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Cancel"))
            ],
          );
        });
  }

  void _showDialogAdd() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              "Tambah Data",
              style: TextStyle(
                color: Colors.pink,
              ),
              textAlign: TextAlign.center,
            ),
            content: ListView(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: bukuController,
                  decoration: const InputDecoration(
                    labelText: "Buku : ",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                TextFormField(
                  style: const TextStyle(color: Colors.black),
                  controller: penulisController,
                  decoration: const InputDecoration(
                    labelText: "Penulis : ",
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                )
              ],
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    String buku = bukuController.text;
                    String penulis = penulisController.text;

                    myData.add({"buku": buku, "penulis": penulis});
                    bukuController.text = "";
                    penulisController.text = "";
                    setState(() {});
                    Navigator.of(context).pop();
                  },
                  child: const Text("Tambah")),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Batal"))
            ],
          );
        });
  }

  void _removeData(int index) {
    setState(() {
      myData.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: const Text(
          "List Crud",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: myData.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 130,
                      margin: const EdgeInsets.only(top: 10),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.grey.shade500,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Nama Buku : ${myData[index]["buku"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "Nama Penulis : ${myData[index]["penulis"]}",
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  _removeData(index);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.delete,
                                      color: Colors.pink,
                                    ),
                                    Text(
                                      "Hapus",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 20),
                              TextButton(
                                onPressed: () {
                                  _showDialogEdit(index, myData[index]);
                                },
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.mode_edit,
                                      color: Colors.pink,
                                    ),
                                    Text(
                                      "Edit",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        onPressed: () => _showDialogAdd(),
        child: const Icon(Icons.add),
      ),
    );
  }
}
