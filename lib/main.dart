import 'package:flutter/material.dart';
//email="test@gmail.com"
//password="123456"
void main() {
  runApp(const TaskApp());
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
                    width: 300,
                    child: MyTextFeild(
                      controller: emailController,
                      labelText: "Email",
                      hintText: "Enter your email",
                    ))),
            SizedBox(
              height: 20,
            ),
            Center(
                child: SizedBox(
                    width: 300,
                    child: MyTextFeild(
                      controller: passwordController,
                      labelText: "Password",
                      hintText: "Enter your password",
                    ))),
                    Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                      Text("didn't have an account?"),TextButton(onPressed: (){}, child: Text("Sign up"))
                    ],),
            Center(
                child: ElevatedButton(
                    onPressed: () {
                     if(emailController.text=="test@gmail.com"&&passwordController.text=="123456"){

                     }
                     else{
                      showDialog(context: context, builder: (ctx) => AlertDialog(
                      title: Text("Login Failed"),
                      content: Text("Data is invalid"),
                      actions: [IconButton(onPressed: (){
                        Navigator.pop(ctx);
                      }, icon: Icon(Icons.exit_to_app))],
                      ),);
                     }
                    }, child: const Text('Login')))
          ],
        ),
      ),
    );
  }
}

class MyTextFeild extends StatelessWidget {
  final String hintText;
  final String labelText;
  final TextEditingController? controller;
  const MyTextFeild({
    this.controller,
    required this.hintText,
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}

class TaskApp extends StatelessWidget {
  const TaskApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginScreen(),
    );
  }
}

class TextFeildTest extends StatefulWidget {
  TextFeildTest({Key? key}) : super(key: key);

  @override
  State<TextFeildTest> createState() => _TextFeildTestState();
}

class _TextFeildTestState extends State<TextFeildTest> {
  String? name;

  String? password;

  final nameController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text('TextFeild'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Your name is ${name ?? "Not Entered"}",
              style: TextStyle(fontSize: 24),
            ),
            Text(
              "Your password is ${password ?? "Not Entered"}",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(
              width: 300,
              child: TextField(
                onChanged: (value) {
                  if (value.contains('@') && value.contains('.com'))
                    setState(() {
                      name = value + " is valid";
                    });
                  else {
                    setState(() {
                      name = value + " is not valid";
                    });
                  }
                },
                controller: nameController,
                maxLength: 30,
                maxLines: 1,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                  hintText: 'Enter your name',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                  hintText: 'Enter your password',
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    name = nameController.text;
                    password = passwordController.text;
                  });
                },
                child: Text('Submit'))
          ],
        ),
      ),
    );
  }
}

class GridViewTest extends StatelessWidget {
  const GridViewTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate:
            // SliverGridDelegateWithFixedCrossAxisCount(
            //   crossAxisCount: 2,
            //   mainAxisSpacing: 10,
            //   crossAxisSpacing: 10,
            //   childAspectRatio: 1.0,)
            const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.primaries[index % Colors.primaries.length],
            child: Text(
              'Item $index',
              style: Theme.of(context).textTheme.headline5,
            ),
          );
        },
      ),
    );
  }
}

class TaskHomePage extends StatelessWidget {
  TaskHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.call),
        title: const Text("My Information"),
      ),
      body: Container(
        padding: EdgeInsets.zero,
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill,
                image: NetworkImage(
                    'https://i.pinimg.com/originals/af/8d/63/af8d63a477078732b79ff9d9fc60873f.jpg?fbclid=IwAR3l8O-VqOuRvLZ_IpgX0P1MzsxRJTfZyL0bIq4ysARicTFjCa8EHgSr2jk'))),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 100,
            ),
            ImageWidget3(80),
            const SizedBox(height: 300, child: const DataWidget())
          ],
        ),
      ),
    );
  }
}

class DataWidget extends StatelessWidget {
  const DataWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var list = [
      {
        'k': "Name",
        'v': "Moaaz",
      },
      {
        'k': "Age",
        'v': "22",
      },
      {
        'k': "Facultiy",
        'v': "Computer Science",
      },
      {
        'k': "Address",
        'v': "Giza",
      },
      {
        'k': "Name",
        'v': "Moaaz",
      },
    ];

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.blue, width: 3),
          borderRadius: const BorderRadius.only(
              topLeft: const Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Colors.white),
      child: ListView.separated(
        itemCount: list.length,
        itemBuilder: (context, index) =>
            DataRowWidget(feild: list[index]['k']!, value: list[index]['v']!),
        separatorBuilder: (context, index) => const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Divider(
              color: Colors.black,
              thickness: 1,
            )),
      ),
    );
  }
}

class DataRowWidget extends StatelessWidget {
  const DataRowWidget({
    Key? key,
    required this.feild,
    required this.value,
  }) : super(key: key);
  final String feild;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          feild,
          style: const TextStyle(
              color: Colors.red, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(' : '),
        Text(
          value,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w300),
        )
      ],
    );
  }
}

class ImageWidget extends StatelessWidget {
  final double size;
  ImageWidget(this.size);
  @override
  Widget build(BuildContext context) {
    return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(size)),
        child: Image(
          image: const AssetImage('assets/images/moaaz.jpg'),
          height: size * 2,
          width: size * 2,
        ));
  }
}

class ImageWidget2 extends StatelessWidget {
  final double size;
  ImageWidget2(this.size);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return CircleAvatar(
      radius: size,
      backgroundImage: const AssetImage("assets/images/moaaz.jpg"),
    );
  }
}

class ImageWidget3 extends StatelessWidget {
  final double size;
  ImageWidget3(this.size);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(size),
      child: Image(
          width: size * 2,
          height: size * 2,
          image: const AssetImage('assets/images/moaaz.jpg')),
    );
  }
}
