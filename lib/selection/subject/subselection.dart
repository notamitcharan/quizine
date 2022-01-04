import 'package:flutter/material.dart';
import 'package:quizine/selection/subject/submodel.dart';
import 'package:quizine/selection/week/weekselection.dart';

class SubSelect extends StatefulWidget {
  @override
  _SubSelectState createState() => _SubSelectState();
}

class _SubSelectState extends State<SubSelect> {
  List<SubjectModel> subjects = [
    SubjectModel("English I", false),
  ];

  List<SubjectModel> selectedSubjects = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Select a Subject"),
        centerTitle: true,
        backgroundColor: Colors.green[700],
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: subjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return SubjectItem(
                        subjects[index].name,
                        subjects[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedSubjects.length > 0
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
                                    builder: (context) => WeekSelect(),
                                  ));
                            }),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget SubjectItem(String name, bool isSelected, int index) {
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
          subjects[index].isSelected = !subjects[index].isSelected;
          if (subjects[index].isSelected == true) {
            selectedSubjects.add(SubjectModel(name, true));
          } else if (subjects[index].isSelected == false) {
            selectedSubjects
                .removeWhere((element) => element.name == subjects[index].name);
          }
        });
      },
    );
  }
}
