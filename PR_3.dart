import 'dart:io';

class Product {
  final int id;
  final String name;
  final int price;
  int qty = 1;
  Product(
      {required this.id,
      required this.name,
      required this.price,
      this.qty = 1});
  factory Product.factory({required Map data}) {
    return Product(id: data['id'], name: data['name'], price: data['price']);
  }
  static List<Map<String, dynamic>> allproduct = [
    {
      'id': 1,
      'name': "iphone 15pro",
      'price': 9999,
    },
    {
      'id': 2,
      'name': "Mango",
      'price': 9978,
    },
    {
      'id': 3,
      'name': "samsung Table A   ",
      'price': 25899,
    },
    {
      'id': 4,
      'name': "Assus laptop B  ",
      'price': 599,
    },
    {
      'id': 5,
      'name': "one+ 10s",
      'price': 9902,
    },
    {
      'id': 6,
      'name': "oppo v21S",
      'price': 5899,
    },
    {
      'id': 7,
      'name': "nokia 11 ",
      'price': 28899,
    },
    {
      'id': 8,
      'name': "MacBook pro 2",
      'price': 29998,
    },
    {
      'id': 9,
      'name': "candy",
      'price': 39998,
    },
    {
      'id': 10,
      'name': "Water  ",
      'price': 39921,
    },
  ];
}

class customer {
  final int id;
  final String name;
  final int contact;
  int bill = 0;
  double b = 0;
  List<Product> cart = [];
  customer({required this.id, required this.name, required this.contact}) {
    int choice;

    do {
      print("1 for add product.");

      print("2 for EXIT.");
      stdout.write("Enter your choice : ");
      choice = int.parse(stdin.readLineSync()!);

      switch (choice) {
        case 1:
          Product.allproduct.forEach((e) {
            print("${e['id']}\t${e['name']}\t${e['price']}");
          });
          stdout.write("Enter product number to add your cart : ");
          int n = int.parse(stdin.readLineSync()!);
          stdout.write("Enter quantity :");
          int q = int.parse(stdin.readLineSync()!);

          Product p = Product.factory(data: Product.allproduct[n - 1]);
          p.qty = q;
          cart.add(p);
          break;

        case 2:
          break;
        default:
          print("Enter valid Number!!");
          break;
      }
    } while (choice != 2);
    cart.forEach((e) {
      bill += (e.qty * e.price);
    });
    if (bill >= 500 && bill < 1500) {
      b = (bill * 10) / 100;
    } else if (bill >= 1500 && bill < 3500) {
      b = (bill * 20) / 100;
    } else if (bill >= 3500 && bill < 6500) {
      b = (bill * 25) / 100;
    } else {
      b = (bill * 30) / 100;
    }
    print("your bill is $b");
  }
}

void main() {
  stdout.write("Enter The Number of Customer : ");
  int num = int.parse(stdin.readLineSync()!);
  List<customer> cus = List.generate(num, (index) {
    stdout.write("Enter ID : ");
    int id = int.parse(stdin.readLineSync()!);
    stdout.write("Enter Name : ");
    String name = stdin.readLineSync()!;
    stdout.write("Enter Contact number : ");
    int contact = int.parse(stdin.readLineSync()!);

    return customer(id: id, name: name, contact: contact);
  });
  stdout.write("Enter search id number : ");
  int cid = int.parse(stdin.readLineSync()!);
  cus.forEach((e) {
    do {
      if (cid == e.id) {
        print("${e.id}\n${e.name}\n${e.b}");
      } else {
        print("INVALID NUMBER...");
      }
    } while (cid != e.id);
  });
}
