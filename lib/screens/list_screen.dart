import 'package:chips_choice/chips_choice.dart';
import 'package:flutter/material.dart';
import 'package:training_task1/data/categories.dart';
import 'package:training_task1/widgets/vegetables_list.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() {
    return _ListScreenState();
  }
}

class _ListScreenState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 180,
        flexibleSpace: Align(
          alignment: Alignment.topRight,
          child: Container(
            height: 190,
            width: 190,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/Vegetables.png'),
                    fit: BoxFit.fitWidth)),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 246, 245, 245),
        title: const Padding(
          padding: EdgeInsets.only(top: 35),
          child: Text('Vegetables',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w700,
              )),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            child: TextField(
              style: const TextStyle(
                fontSize: 18,
              ),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color.fromARGB(255, 217, 208, 227),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:
                      BorderSide(color: Theme.of(context).colorScheme.primary),
                  borderRadius: BorderRadius.circular(50),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 2,
                ),
                prefixIcon: const Image(
                  image: AssetImage('assets/icons/search.png'),
                ),
                hintText: 'Search',
              ),
            ),
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 246, 245, 245),
      body: Column(
        children: [
          ChipsChoice.multiple(
            wrapped: true,
            value: selectedCategories,
            onChanged: (value) {
              setState(() {
                selectedCategories = value;
              });
            },
            choiceStyle: C2ChipStyle.filled(
              color: Colors.white,
              foregroundColor: const Color.fromARGB(255, 149, 134, 168),
              borderRadius: const BorderRadius.all(Radius.circular(25)),
              selectedStyle: const C2ChipStyle(
                backgroundColor: Color.fromARGB(255, 226, 203, 255),
                foregroundColor: Color.fromARGB(255, 108, 14, 228),
                borderRadius: BorderRadius.all(
                  Radius.circular(25),
                ),
              ),
            ),
            choiceCheckmark: true,
            choiceItems: C2Choice.listFrom(
                source: allCategories,
                value: (i, v) => v.id,
                label: (i, v) => v.name),
          ),
          const VegetablesList(),
        ],
      ),
    );
  }
}
