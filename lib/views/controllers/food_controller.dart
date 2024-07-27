import 'package:chopnow_new_customer_app/views/models/food_model.dart';
import 'package:get/get.dart';

class FoodController extends GetxController {
  final FoodModel food;
  var count = 1.obs;
  var additiveCounts = <String, int>{}.obs;
  var isChecked = <String, bool>{}.obs;
  var selectedItems = <SelectedItem>[].obs; // List to store selected items

  FoodController(this.food);

  @override
  void onInit() {
    super.onInit();
    initializeAdditiveCounts();
  }

  void initializeAdditiveCounts() {
    for (var additive in food.additive) {
      for (var option in additive.options) {
        additiveCounts["${additive.title}-${option.name}"] = 1;
        isChecked["${additive.title}-${option.name}"] = false;
      }
    }
  }

  void increment() {
    count++;
    updateTotalPrice();
    updateSelectedItems(); // Update selected items list
  }

  void decrement() {
    if (count > 1) {
      count--;
      updateTotalPrice();
      updateSelectedItems(); // Update selected items list
    }
  }

  void incrementOption(String key) {
    additiveCounts[key] = (additiveCounts[key] ?? 1) + 1;
    updateTotalPrice();
    updateSelectedItems(); // Update selected items list
  }

  void decrementOption(String key) {
    if (additiveCounts[key]! > 1) {
      additiveCounts[key] = additiveCounts[key]! - 1;
      updateTotalPrice();
      updateSelectedItems(); // Update selected items list
    }
  }

  int getOptionCount(String key) {
    return additiveCounts[key] ?? 1;
  }

  void toggleCheckbox(String key, bool? value) {
  // Check if the key is part of the first additive group
  if (key.startsWith("${food.additive.first.title}-")) {
    // Uncheck all other checkboxes in the same group
    isChecked.updateAll((k, v) {
      if (k.startsWith("${food.additive.first.title}-")) {
        return k == key ? (value ?? false) : false;
      }
      return v;
    });
  } else {
    // For other groups, just update the checkbox state
    isChecked[key] = value ?? false;
  }

  // Update the additive counts and total price if the checkbox is unchecked
  if (!isChecked[key]!) {
    additiveCounts[key] = 1; // Reset the count if unchecked
  }

  updateTotalPrice();
  updateSelectedItems(); // Update the selected items list
}


  int getOptionTotalPrice(String key) {
    for (var additive in food.additive) {
      for (var option in additive.options) {
        if ("${additive.title}-${option.name}" == key) {
          return (additiveCounts[key] ?? 0) * option.price;
        }
      }
    }
    return 0;
  }

  int get totalPrice {
    var total = food.price * count.value;
    for (var key in additiveCounts.keys) {
      if (isChecked[key]!) {
        total += getOptionTotalPrice(key);
      }
    }
    return total;
  }

  void updateTotalPrice() {
    // Trigger a reactive update
    totalPrice;
  }

  void updateSelectedItems() {
    selectedItems.clear();
    for (var key in additiveCounts.keys) {
      if (isChecked[key]!) {
        for (var additive in food.additive) {
          for (var option in additive.options) {
            if ("${additive.title}-${option.name}" == key) {
              selectedItems.add(SelectedItem(
                foodTitle: food.title, // Include food title
                foodPrice: food.price * count.value, // Include total price
                foodCount: count.value,
                name: option.name,
                price: option.price,
                quantity: additiveCounts[key]!,
              ));
            }
          }
        }
      }
    }
  }

  bool isAnyOptionChecked() {
    return isChecked.values.any((value) => value);
  }
}

class SelectedItem {
  final String foodTitle; // New field
  final int foodPrice;
  final int foodCount;
  final String name;
  final int price;
  final int quantity;

  SelectedItem({
    required this.foodTitle, // New field
    required this.foodPrice, // New field
    required this.foodCount,
    required this.name,
    required this.price,
    required this.quantity,
  });

  // Method to convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'foodTitle': foodTitle,
      'foodPrice': foodPrice,
      'foodCount': foodCount,
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}














// import 'package:chopnow_new_customer_app/views/models/food_model.dart';
// import 'package:get/get.dart';

// class FoodController extends GetxController {
//   final FoodModel food;
//   var count = 1.obs;
//   var additiveCounts = <String, int>{}.obs;
//   var isChecked = <String, bool>{}.obs;
//   var selectedItems = <SelectedItem>[].obs; // List to store selected items

//   FoodController(this.food);

//   @override
//   void onInit() {
//     super.onInit();
//     initializeAdditiveCounts();
//   }

//   void initializeAdditiveCounts() {
//     for (var additive in food.additive) {
//       for (var option in additive.options) {
//         additiveCounts["${additive.title}-${option.name}"] = 1;
//         isChecked["${additive.title}-${option.name}"] = false;
//       }
//     }
//   }

//   void increment() {
//     count++;
//     updateTotalPrice();
//     updateSelectedItems(); // Update selected items list
//   }

//   void decrement() {
//     if (count > 1) {
//       count--;
//       updateTotalPrice();
//       updateSelectedItems(); // Update selected items list
//     }
//   }

//   void incrementOption(String key) {
//     additiveCounts[key] = (additiveCounts[key] ?? 0) + 1;
//     updateTotalPrice();
//     updateSelectedItems(); // Update selected items list
//   }

//   void decrementOption(String key) {
//     if (additiveCounts[key]! > 1) {
//       additiveCounts[key] = additiveCounts[key]! - 1;
//       updateTotalPrice();
//       updateSelectedItems(); // Update selected items list
//     }
//   }

//   int getOptionCount(String key) {
//     return additiveCounts[key] ?? 0;
//   }

//   void toggleCheckbox(String key, bool? value) {
//     isChecked[key] = value ?? false;
//     if (!isChecked[key]!) {
//       additiveCounts[key] = 1; // Reset the count if unchecked
//     }
//     updateTotalPrice();
//     updateSelectedItems(); // Update selected items list
//   }

//   // void toggleCheckboxForIndex0(String key, bool? value) {
//   //   if (key.startsWith("${food.additive.first.title}-")) {
//   //     isChecked.updateAll((k, v) {
//   //       if (k.startsWith("${food.additive.first.title}-")) return false;
//   //       return v;
//   //     });
//   //   }
//   //   isChecked[key] = value ?? false;
//   //   if (!isChecked[key]!) {
//   //     additiveCounts[key] = 1; // Reset the count if unchecked
//   //   }
//   //   updateTotalPrice();
//   //   updateSelectedItems(); 
//   // }

//   int getOptionTotalPrice(String key) {
//     var optionPrice = food.additive
//         .expand((additive) => additive.options)
//         .firstWhere((option) => "${option.name}" == key.split("-").last)
//         .price;
//     return (additiveCounts[key] ?? 0) * optionPrice;
//   }
  

//   int get totalPrice {
//     var total = food.price * count.value;
//     for (var key in additiveCounts.keys) {
//       if (isChecked[key]!) {
//         total += getOptionTotalPrice(key);
//       }
//     }
//     // Add price of options in the first additive if they are checked
//     // var firstAdditiveOptions = food.additive.first.options;
//     // for (var option in firstAdditiveOptions) {
//     //   var key = "${food.additive.first.title}-${option.name}";
//     //   if (isChecked[key]!) {
//     //     total += option.price;
//     //   }
//     // }
//     return total;
//   }

//   void updateTotalPrice() {
//     // Trigger a reactive update
//     totalPrice;
//   }

//   void updateSelectedItems() {
//     selectedItems.clear();
//     for (var key in additiveCounts.keys) {
//       if (isChecked[key]!) {
//         var option = food.additive
//             .expand((additive) => additive.options)
//             .firstWhere((option) => "${option.name}" == key.split("-").last);
//         selectedItems.add(SelectedItem(
//           name: option.name,
//           price: option.price,
//           quantity: additiveCounts[key]!,
//           foodTitle: food.title, // Include food title
//           foodPrice: food.price * count.value, // Include total price
//           foodCount: count.value
//         ));
//       }
//     }
//   }
// }


// class SelectedItem {
//   final String foodTitle;  // New field
//   final int foodPrice;
//   final int foodCount;
//   final String name;
//   final int price;
//   final int quantity;
//       // New field

//   SelectedItem({
//     required this.foodTitle,  // New field
//     required this.foodPrice, // New field
//     required this.foodCount,
//     required this.name,
//     required this.price,
//     required this.quantity,
    
//   });
// }


























// import 'package:get/get.dart';
// import 'package:chopnow_new_customer_app/views/models/food_model.dart';

// class FoodController extends GetxController {
//   final FoodModel food;

//   FoodController(this.food);

//   RxInt count = 1.obs;
//   RxInt totalPrice = 0.obs;
//   RxMap<String, bool> isChecked = <String, bool>{}.obs;
//   RxMap<String, int> additiveCounts = <String, int>{}.obs;
//   RxList<SelectedItem> selectedItems = <SelectedItem>[].obs;

//   @override
//   void onInit() {
//     super.onInit();
//     // Initialize isChecked and additiveCounts
//     food.additive.forEach((additive) {
//       additive.options.forEach((option) {
//         isChecked["${additive.title}-${option.name}"] = false;
//         additiveCounts["${additive.title}-${option.name}"] = 1;
//       });
//     });
//     updateTotalPrice();
//   }

//   void increment() {
//     count.value++;
//     updateTotalPrice();
//   }

//   void decrement() {
//     if (count.value > 1) {
//       count.value--;
//       updateTotalPrice();
//     }
//   }

//   void incrementOption(String key) {
//     additiveCounts[key] = additiveCounts[key]! + 1;
//     updateTotalPrice();
//   }

//   void decrementOption(String key) {
//     if (additiveCounts[key]! > 1) {
//       additiveCounts[key] = additiveCounts[key]! - 1;
//       updateTotalPrice();
//     }
//   }

//   void toggleCheckbox(String key, bool? value) {
//     isChecked[key] = value ?? false;
//     if (!isChecked[key]!) {
//       additiveCounts[key] = 1; // Reset the count if unchecked
//     }
//     updateTotalPrice();
//     updateSelectedItems(); // Update selected items list
//   }

//   void toggleCheckboxForIndex0(String key, bool? value) {
//     food.additive.first.options.forEach((option) {
//       var optionKey = "${food.additive.first.title}-${option.name}";
//       if (optionKey != key) {
//         isChecked[optionKey] = false;
//       }
//     });
//     isChecked[key] = value ?? false;
//     updateTotalPrice();
//     updateSelectedItems(); // Update selected items list
//   }

//   bool isFirstAdditiveSelected() {
//     var firstAdditive = food.additive.first;
//     for (var option in firstAdditive.options) {
//       var key = "${firstAdditive.title}-${option.name}";
//       if (isChecked[key] == true) {
//         return true;
//       }
//     }
//     return false;
//   }
//     int getOptionCount(String key) {
//     return additiveCounts[key] ?? 0;
//   }

//   void updateTotalPrice() {
//     int price = food.price * count.value;
//     food.additive.forEach((additive) {
//       additive.options.forEach((option) {
//         var key = "${additive.title}-${option.name}";
//         if (isChecked[key] == true) {
//           price += option.price * additiveCounts[key]!;
//         }
//       });
//     });
//     totalPrice.value = price;
//   }

//   void updateSelectedItems() {
//     selectedItems.clear();
//     food.additive.forEach((additive) {
//       additive.options.forEach((option) {
//         var key = "${additive.title}-${option.name}";
//         if (isChecked[key] == true) {
//           selectedItems.add(
//             SelectedItem(
//               foodTitle: option.name,
//               foodPrice: option.price,
//               foodCount: additiveCounts[key]!,
//             ),
//           );
//         }
//       });
//     });
//   }
// }


// class SelectedItem {
//   final String foodTitle;
//   final int foodPrice;
//   final int foodCount;

//   SelectedItem({
//     required this.foodTitle,
//     required this.foodPrice,
//     required this.foodCount,
//   });
// }
