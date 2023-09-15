import 'package:au_migos/models/dog_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLike = false;
  List<DogModel> dogs = [];
  final pageController = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    dogs = DogModel.getImages;
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        // onTap: (value) => onPageChange(value.toDouble()),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.post_add),
            label: 'Postar',
          ),
        ],
      ),
      appBar: AppBar(
        centerTitle: false,
        title: const Text('AuMigos'),
      ),
      body: PageView(
        controller: pageController,
        children: [
          ListView.builder(
            itemCount: dogs.length,
            itemBuilder: (context, index) {
              DogModel dog = dogs[index];
              return getPostCard(dog);
            },
          ),
          const SizedBox(
            width: double.maxFinite,
            height: 100,
            child: Center(
              child: Text('Aqui ficara a camera'),
            ),
          ),
        ],
      ),
    );
  }

  _onPageChange(int page) {
    // pageController.jumpTo(page);
  }

  // void setCurrentPage(int page) => pageController.page = page;

  Widget getPostCard(DogModel dog) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: AssetImage(dog.images!.first),
                backgroundColor: Colors.transparent,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                dog.username!,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        getImage(dog),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: like,
                icon: Icon(
                  Icons.pets_outlined,
                  color: isLike ? Colors.red : Colors.black,
                  size: 40,
                ),
              ),
              const Icon(Icons.mode_comment, size: 40),
              const Icon(Icons.send, size: 40)
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                dog.name!,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                dog.description!,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget getImage(DogModel dog) {
    return SizedBox(
      width: double.maxFinite,
      child: Image.asset(dog.images!.first),
    );
  }

  void like() {
    setState(() {
      isLike = !isLike;
    });
  }
}
