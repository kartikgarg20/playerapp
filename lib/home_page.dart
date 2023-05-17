import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:player_app/controller/player_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final HomeController _homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(
          () => Padding(
            padding: const EdgeInsets.only(top: 30),
            child: ListView.builder(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              itemCount: _homeController.myList.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child: Container(
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 0, 0, 0), //New
                            blurRadius: 3.0,
                          )
                        ],
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(10)),
                    height: 50,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Text(
                            _homeController.myList[index],
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          Spacer(),
                          IconButton(
                              onPressed: () {
                                _homeController.myList.removeAt(index);
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.black,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        bottomNavigationBar: Obx(
          () => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                height: 150,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20, left: 20),
                          child: SizedBox(
                            height: 40,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: TextFormField(
                              controller: _homeController.nameController.value,
                              decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.cyan),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.white),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Add Player Name',
                                  hintStyle: TextStyle(
                                      color: Color.fromARGB(255, 94, 94, 94),
                                      fontSize: 16)),
                              obscureText: false,
                              style: TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontSize: 25),
                              cursorColor: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border:
                                  Border.all(color: Colors.white, width: 1)),
                          child: Center(
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.add),
                              iconSize: 20,
                              color: Colors.white,
                              onPressed: () {
                                if (_homeController
                                    .nameController.value.text.isNotEmpty) {
                                  _homeController.myList.add(_homeController
                                      .nameController.value.text);
                                  _homeController.nameController.value.clear();
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: InkWell(
                        onTap: () {
                          if (_homeController.myList.length < 2) {
                            alertMessage("Minimum 2 People needed");
                          } else {
                            alertMessage('Game is Started');
                          }
                        },
                        child: Container(
                          width: 100,
                          height: 40,
                          decoration: BoxDecoration(
                              color: Colors.orange,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Text(
                            "Let's Play",
                            style: TextStyle(color: Colors.white),
                          )),
                        ),
                      ),
                    )
                  ],
                )),
          ),
        ));
  }

  void alertMessage(msg) {
    Fluttertoast.showToast(
        backgroundColor: Colors.grey,
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        textColor: Color.fromARGB(255, 0, 0, 0),
        fontSize: 16.0);
  }
}
