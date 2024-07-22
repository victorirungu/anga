import 'package:get/get.dart';

class ConcessionsController extends GetxController {

var selectedConcessionId = 1.obs;

 var categories = [
    {
      'id': '1',
      'name': 'All'
      
    },
     {
      'id': '2',
      'name': 'Cookies'
      
    },
     {
      'id': '3',
      'name': 'Snacks'
      
    },
     {
      'id': '4',
      'name': 'Popcorn',
      
    },
     {
      'id': '5',
      'name': 'Drinks', 
    },
    
  ].obs;




RxList concessions = [
    {
      'id': '1',
      'name': 'Salted Medium Popcorn',
      'price': '250',
      'image': 'images/popcorn.png',
      'category': 'Popcorn'
    },
    {
      'id': '2',
      'name': 'Caramel Medium Popcorn',
      'price': '350',
      'image': 'images/popcorn.png',
      'category': 'Popcorn'
    },
    {
      'id': '3',
      'name': 'Caramel Popcorn (Large)',
      'price': '450',
      'image': 'images/popcorn.png',
    },
    {
      'id': '4',
      'name': 'Large Popcorn (salted)',
      'price': '300',
      'image': 'images/popcorn.png',
      'category': 'Popcorn'
    },
    {
      'id': '5',
      'name': 'Soda 500ml',
      'price': '200',
      'image': 'images/coke.jpeg',
      'category': 'Drinks'
    },
    {
      'id': '6',
      'name': 'Dasani 500ml',
      'price': '170',
      'image': 'images/dasani.jpeg',
      'category': 'Drinks'
    },
    {
      'id': '7',
      'name': 'Butter Choc 120g',
      'price': '250',
      'image': 'images/cookie.jpeg',
      'category': 'Cookies'
    },
    {
      'id': '8',
      'name': 'Chocolate chip 200g',
      'price': '200',
      'image': 'images/cookie2.jpeg',
      'category': 'Cookies'
    },
    {
      'id': '9',
      'name': 'Urban bites 120grms',
      'price': '350',
      'image': 'images/urban.jpeg',
      'category': 'Snacks'
    },
    {
      'id': '10',
      'name': 'Hotdog',
      'price': '270',
      'image': 'images/hotdog.jpeg',
      'category': 'Snacks'
    },
  ].obs;

  RxList setConcessions = [].obs;


   @override
  void onInit() {
    super.onInit();
    updateCategory();
  }

  updateCategoryId(int id) {
    selectedConcessionId.value = id;
    updateCategory();
  }

void updateCategory() {
  // Find the name of the category that corresponds to the selectedConcessionId
  var selectedCategoryName = categories.firstWhere(
    (category) => category['id'] == selectedConcessionId.value.toString(),
    orElse: () => categories[0]  // Default to the first category if not found
  )['name'];

  // Filter the concessions to include only those in the selected category
  if (selectedCategoryName == 'All') {
    // If the selected category is 'All', include all concessions
    setConcessions.value = concessions;
  } else {
    // Otherwise, filter by the matching category name
    setConcessions.value = concessions.where(
      (concession) => concession['category'] == selectedCategoryName
    ).toList();
  }
}

}
