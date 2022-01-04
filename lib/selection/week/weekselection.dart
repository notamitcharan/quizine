import 'package:flutter/material.dart';
import 'package:quizine/home/home_page.dart';
import 'package:quizine/selection/week/weekmodel.dart';

class WeekSelect extends StatefulWidget {
  @override
  _WeekSelectState createState() => _WeekSelectState();
}

class _WeekSelectState extends State<WeekSelect> {
  List<WeekModel> weeks = [
    WeekModel("Week 1", false),
    WeekModel("Week 2", false),
    WeekModel("Week 3", false),
    WeekModel("Week 4", false),
    WeekModel("Week 5", false),
    WeekModel("Week 6", false),
    WeekModel("Week 7", false),
    WeekModel("Week 8", false),
    WeekModel("Week 9", false),
    WeekModel("Week 10", false),
    WeekModel("Week 11", false),
    WeekModel("Week 12", false),
  ];

  List<String> selectedweeks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Week"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: weeks.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return WeekItem(
                        weeks[index].name,
                        weeks[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedweeks.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.green[700],
                          child: Text(
                            "Done",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(selectedweeks),
                                ));
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget WeekItem(String name, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.green[700],
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        name,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.green[700],
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
      onTap: () {
        setState(() {
          weeks[index].isSelected = !weeks[index].isSelected;
          if (weeks[index].isSelected == true) {
            selectedweeks.add(name);
          } else if (weeks[index].isSelected == false) {
            selectedweeks
                .removeWhere((element) => element == weeks[index].name);
          }
        });
      },
    );
  }
}
