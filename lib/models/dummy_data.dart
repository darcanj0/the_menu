import 'package:flutter/material.dart';
import 'package:the_menu/models/meal.dart';
import 'package:the_menu/models/recipe.dart';

import 'category.dart';

const List<Category> categoriesMock = [
  Category(
      id: 'c1',
      title: 'Italian',
      color: Colors.purple,
      imagePath: 'assets/images/categories/italian.jpg'),
  Category(
      id: 'c2',
      title: "Snacks",
      color: Colors.red,
      imagePath: 'assets/images/categories/snacks.jpg'),
  Category(
      id: 'c3',
      title: 'Hamburgers',
      color: Colors.orange,
      imagePath: 'assets/images/categories/hamburger.jpg'),
  Category(
      id: 'c4',
      title: 'German',
      color: Color.fromARGB(255, 180, 47, 14),
      imagePath: 'assets/images/categories/german.jpg'),
  Category(
      id: 'c5',
      title: 'Fit',
      color: Colors.deepOrange,
      imagePath: 'assets/images/categories/fit.jpg'),
  Category(
      id: 'c6',
      title: 'Exotic',
      color: Colors.green,
      imagePath: 'assets/images/categories/exotic.jpg'),
  Category(
      id: 'c7',
      title: 'Breakfast',
      color: Colors.lightBlue,
      imagePath: 'assets/images/categories/breakfast.jpg'),
  Category(
      id: 'c8',
      title: 'Asian',
      color: Colors.lightGreen,
      imagePath: 'assets/images/categories/asian.jpg'),
  Category(
      id: 'c9',
      title: 'French',
      color: Colors.pink,
      imagePath: 'assets/images/categories/french.jpg'),
  Category(
      id: 'c10',
      title: 'Tropical',
      color: Colors.teal,
      imagePath: 'assets/images/categories/tropical.jpg'),
];

List<Meal> mockMeals = [
  Meal(
      id: 'm1',
      name: 'Spaghetti Carbonara',
      price: 12.99,
      imagePath: 'assets/images/meals/spaghetti_carbonara.jpg',
      description: 'Classic Italian pasta dish with bacon and eggs.',
      durationInMinutes: 30,
      categoriesIds: ['c1', 'c5'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description: 'Bring a large pot of salted water to a boil.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Cook spaghetti according to package instructions until al dente.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Meanwhile, heat olive oil in a large skillet over medium heat.',
        ),
        RecipeStep(
          number: 4,
          description: 'Add chopped bacon and cook until crispy.',
        ),
        RecipeStep(
          number: 5,
          description:
              'In a separate bowl, whisk together eggs, grated Parmesan cheese, and black pepper.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Drain cooked spaghetti and add it to the skillet with the bacon, tossing to coat.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Remove skillet from heat and quickly stir in the egg mixture, allowing the residual heat to cook the eggs and create a creamy sauce.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Serve immediately, garnished with additional Parmesan cheese and black pepper, if desired.',
        ),
      ])),
  Meal(
      id: 'm2',
      name: 'Hawaiian Pizza',
      price: 10.99,
      imagePath: 'assets/images/meals/hawaiian_pizza.jpg',
      description: 'Delicious pizza with ham and pineapple.',
      durationInMinutes: 25,
      categoriesIds: ['c1', 'c6'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Preheat the oven to the temperature specified on the pizza dough package.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Roll out the pizza dough on a lightly floured surface to your desired thickness.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Transfer the rolled-out dough to a baking sheet or pizza stone.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Spread pizza sauce evenly over the dough, leaving a small border around the edges.',
        ),
        RecipeStep(
          number: 5,
          description: 'Sprinkle shredded mozzarella cheese over the sauce.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Arrange slices of ham and pineapple chunks over the cheese.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Bake the pizza in the preheated oven for the time specified on the dough package or until the crust is golden brown and the cheese is bubbly.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Remove the pizza from the oven and let it cool for a few minutes before slicing and serving.',
        ),
      ])),
  Meal(
    id: 'm3',
    name: 'Chicken Caesar Salad',
    price: 9.99,
    imagePath: 'assets/images/meals/caesar_salad.jpg',
    description: 'Fresh salad with grilled chicken and Caesar dressing.',
    durationInMinutes: 15,
    categoriesIds: ['c5', 'c9'],
    isGlutenFree: true,
    isDairyFree: false,
    isVeggie: false,
    isVegan: false,
    servesHowManyPeople: 1,
    recipe: Recipe(steps: [
      RecipeStep(
        number: 1,
        description: 'Grill chicken until fully cooked.',
      ),
      RecipeStep(
        number: 2,
        description: 'Wash and chop lettuce into bite-sized pieces.',
      ),
      RecipeStep(
        number: 3,
        description: 'Prepare Caesar dressing or use store-bought.',
      ),
      RecipeStep(
        number: 4,
        description: 'Combine grilled chicken and lettuce in a bowl.',
      ),
      RecipeStep(
        number: 5,
        description: 'Drizzle Caesar dressing over the salad.',
      ),
      RecipeStep(
        number: 6,
        description: 'Toss salad gently until evenly coated with dressing.',
      ),
      RecipeStep(
        number: 7,
        description: 'Serve fresh and enjoy!',
      ),
    ]),
  ),
  Meal(
      id: 'm4',
      name: 'Margarita Pizza',
      price: 11.99,
      imagePath: 'assets/images/meals/margarita_pizza.jpg',
      description: 'Classic Italian pizza with tomato, mozzarella, and basil.',
      durationInMinutes: 20,
      categoriesIds: ['c1'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: true,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Preheat the oven to the recommended temperature for your pizza dough.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Roll out the pizza dough on a lightly floured surface into a round shape.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Transfer the rolled-out dough to a baking sheet or pizza stone.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Spread a thin layer of tomato sauce evenly over the dough, leaving a small border around the edges.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Place slices of fresh mozzarella cheese evenly on top of the sauce.',
        ),
        RecipeStep(
          number: 6,
          description: 'Arrange fresh basil leaves over the cheese.',
        ),
        RecipeStep(
          number: 7,
          description: 'Drizzle a little olive oil over the pizza.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Bake the pizza in the preheated oven for the recommended time or until the crust is golden brown and the cheese is melted and bubbly.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Remove the pizza from the oven and let it cool for a few minutes before slicing.',
        ),
        RecipeStep(
          number: 10,
          description: 'Serve hot and enjoy your delicious Margarita Pizza!',
        ),
      ])),
  Meal(
      id: 'm5',
      name: 'Vegetable Stir-Fry',
      price: 9.49,
      imagePath: 'assets/images/meals/vegetable_stir_fry.jpg',
      description: 'Healthy stir-fried vegetables with tofu and soy sauce.',
      durationInMinutes: 20,
      categoriesIds: ['c5', 'c8'],
      isGlutenFree: true,
      isDairyFree: true,
      isVeggie: true,
      isVegan: true,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Prepare the vegetables by washing and chopping them into bite-sized pieces.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Press tofu to remove excess moisture, then cut it into cubes.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Heat a large skillet or wok over medium-high heat and add a small amount of oil.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Add tofu cubes to the skillet and cook until golden brown on all sides. Remove from skillet and set aside.',
        ),
        RecipeStep(
          number: 5,
          description:
              'In the same skillet, add a bit more oil if needed, then add the chopped vegetables. Stir-fry until tender-crisp.',
        ),
        RecipeStep(
          number: 6,
          description: 'Return the tofu to the skillet with the vegetables.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Pour soy sauce over the tofu and vegetables, stirring to coat evenly. Cook for an additional minute.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Taste and adjust seasoning if necessary, then remove from heat.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Serve the vegetable stir-fry hot, optionally over rice or noodles, and enjoy!',
        ),
      ])),
  Meal(
      id: 'm6',
      name: 'Sushi Platter',
      price: 14.99,
      imagePath: 'assets/images/meals/sushi_platter.jpg',
      description: 'Assorted sushi rolls with wasabi and soy sauce.',
      durationInMinutes: 35,
      categoriesIds: ['c8', 'c5'],
      isGlutenFree: false,
      isDairyFree: true,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Prepare sushi rice according to package instructions and let it cool to room temperature.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Lay a sheet of nori (seaweed) on a bamboo sushi mat or a clean kitchen towel.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Spread a thin layer of sushi rice evenly over the nori, leaving a small border at the top.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Arrange your choice of sushi fillings (such as cucumber, avocado, crab, or smoked salmon) in a line along the bottom edge of the rice.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Roll the sushi tightly using the bamboo mat or towel, applying gentle pressure as you roll.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Once rolled, use a sharp knife to slice the sushi roll into bite-sized pieces.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Repeat the process with remaining nori, rice, and fillings until you have a variety of sushi rolls.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Arrange the sushi rolls on a platter, garnish with wasabi and pickled ginger, and serve with soy sauce for dipping.',
        ),
      ])),
  Meal(
      id: 'm7',
      name: 'Chicken Alfredo',
      price: 13.99,
      imagePath: 'assets/images/meals/chicken_alfredo.jpg',
      description: 'Creamy pasta with grilled chicken and Alfredo sauce.',
      durationInMinutes: 30,
      categoriesIds: ['c1'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Bring a large pot of salted water to a boil and cook the pasta according to package instructions until al dente.',
        ),
        RecipeStep(
          number: 2,
          description:
              'While the pasta is cooking, heat a grill pan or skillet over medium-high heat.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Season the chicken breasts with salt, pepper, and any desired herbs or spices.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Grill the chicken for about 6-8 minutes on each side or until cooked through. Set aside to rest.',
        ),
        RecipeStep(
          number: 5,
          description:
              'In a separate skillet, melt butter over medium heat. Add minced garlic and cook until fragrant, about 1 minute.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Pour in heavy cream and bring to a simmer. Allow the sauce to thicken slightly, about 5 minutes.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Stir in grated Parmesan cheese until melted and smooth. Season with salt and pepper to taste.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Slice grilled chicken into strips and add them to the Alfredo sauce, stirring to coat evenly.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Once the pasta is cooked, drain it and add it to the skillet with the chicken and sauce.',
        ),
        RecipeStep(
          number: 10,
          description:
              'Toss everything together until the pasta is coated in the creamy Alfredo sauce.',
        ),
        RecipeStep(
          number: 11,
          description:
              'Serve the Chicken Alfredo hot, garnished with chopped parsley and additional Parmesan cheese if desired.',
        ),
      ])),
  Meal(
      id: 'm8',
      name: 'Tropical Salad',
      price: 8.99,
      imagePath: 'assets/images/meals/tropical_salad.jpg',
      description: 'Fresh Greek salad with feta cheese and olives.',
      durationInMinutes: 15,
      categoriesIds: ['c10', 'c5'],
      isGlutenFree: true,
      isDairyFree: true,
      isVeggie: true,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Bring a large pot of salted water to a boil and cook the pasta according to package instructions until al dente.',
        ),
        RecipeStep(
          number: 2,
          description:
              'While the pasta is cooking, heat a grill pan or skillet over medium-high heat.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Season the chicken breasts with salt, pepper, and any desired herbs or spices.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Grill the chicken for about 6-8 minutes on each side or until cooked through. Set aside to rest.',
        ),
        RecipeStep(
          number: 5,
          description:
              'In a separate skillet, melt butter over medium heat. Add minced garlic and cook until fragrant, about 1 minute.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Pour in heavy cream and bring to a simmer. Allow the sauce to thicken slightly, about 5 minutes.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Stir in grated Parmesan cheese until melted and smooth. Season with salt and pepper to taste.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Slice grilled chicken into strips and add them to the Alfredo sauce, stirring to coat evenly.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Once the pasta is cooked, drain it and add it to the skillet with the chicken and sauce.',
        ),
        RecipeStep(
          number: 10,
          description:
              'Toss everything together until the pasta is coated in the creamy Alfredo sauce.',
        ),
        RecipeStep(
          number: 11,
          description:
              'Serve the Chicken Alfredo hot, garnished with chopped parsley and additional Parmesan cheese if desired.',
        ),
      ])),
  Meal(
      id: 'm9',
      name: 'Beef Tacos',
      price: 10.49,
      imagePath: 'assets/images/meals/beef_tacos.jpg',
      description: 'Tasty beef tacos with salsa and guacamole.',
      durationInMinutes: 20,
      categoriesIds: ['c10', 'c2'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Heat a skillet over medium-high heat and add a little oil.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Add ground beef to the skillet and cook, breaking it apart with a spatula, until browned and cooked through.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Drain excess fat from the skillet, then add taco seasoning and water according to package instructions.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Simmer the seasoned beef for a few minutes until the sauce thickens slightly.',
        ),
        RecipeStep(
          number: 5,
          description:
              'While the beef is cooking, prepare taco toppings such as shredded lettuce, diced tomatoes, grated cheese, salsa, guacamole, and sour cream.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Warm taco shells in the oven according to package instructions.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Once the beef is ready and the taco shells are warmed, assemble the tacos by spooning beef into each shell and adding desired toppings.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Serve the Beef Tacos hot, accompanied by extra salsa and guacamole on the side.',
        ),
      ])),
  Meal(
      id: 'm10',
      name: 'Vegetable Curry',
      price: 11.99,
      imagePath: 'assets/images/meals/vegetable_curry.jpg',
      description: 'Spicy vegetable curry with rice.',
      durationInMinutes: 25,
      categoriesIds: ['c5', 'c6', 'c8'],
      isGlutenFree: true,
      isDairyFree: true,
      isVeggie: true,
      isVegan: true,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description: 'Heat oil in a large skillet or pot over medium heat.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Add chopped onion, garlic, and ginger to the skillet. Cook until softened and fragrant, about 3-4 minutes.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Stir in curry powder, turmeric, cumin, and paprika. Cook for another minute to toast the spices.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Add chopped vegetables (such as bell peppers, carrots, potatoes, and cauliflower) to the skillet. Stir to coat with the spice mixture.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Pour in coconut milk and vegetable broth. Bring to a simmer and cook until the vegetables are tender, about 15-20 minutes.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Season with salt, pepper, and a squeeze of lime juice to taste.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Serve the Vegetable Curry hot, accompanied by steamed rice or naan bread.',
        ),
      ])),
  Meal(
      id: 'm11',
      name: 'German Cake',
      price: 7.99,
      imagePath: 'assets/images/meals/german_cake.jpg',
      description: 'Rich and moist chocolate cake with frosting.',
      durationInMinutes: 40,
      categoriesIds: ['c4'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 4,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Preheat the oven to the temperature specified in your cake recipe.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Grease and flour a cake pan or line it with parchment paper to prevent sticking.',
        ),
        RecipeStep(
          number: 3,
          description:
              'In a mixing bowl, cream together butter and sugar until light and fluffy.',
        ),
        RecipeStep(
          number: 4,
          description: 'Beat in eggs, one at a time, until well combined.',
        ),
        RecipeStep(
          number: 5,
          description: 'Mix in vanilla extract.',
        ),
        RecipeStep(
          number: 6,
          description:
              'In a separate bowl, sift together flour, cocoa powder, baking powder, and salt.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Gradually add the dry ingredients to the wet ingredients, mixing until just combined.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Pour the batter into the prepared cake pan and spread it out evenly.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Bake in the preheated oven for the time specified in your recipe, or until a toothpick inserted into the center comes out clean.',
        ),
        RecipeStep(
          number: 10,
          description:
              'Remove the cake from the oven and let it cool in the pan for a few minutes before transferring it to a wire rack to cool completely.',
        ),
        RecipeStep(
          number: 11,
          description:
              'Once the cake has cooled, frost it with your favorite frosting and decorate as desired.',
        ),
        RecipeStep(
          number: 12,
          description:
              'Slice and serve the German Cake, and enjoy the rich and moist chocolate goodness!',
        ),
      ])),
  Meal(
      id: 'm12',
      name: 'Caprese Salad',
      price: 9.49,
      imagePath: 'assets/images/meals/caprese_salad.jpg',
      description: 'Fresh Caprese salad with tomatoes, mozzarella, and basil.',
      durationInMinutes: 10,
      categoriesIds: ['c10'],
      isGlutenFree: true,
      isDairyFree: true,
      isVeggie: true,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Slice fresh tomatoes and fresh mozzarella cheese into rounds.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Arrange the tomato and mozzarella slices alternately on a serving platter, overlapping them slightly.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Tear fresh basil leaves and scatter them over the tomato and mozzarella slices.',
        ),
        RecipeStep(
          number: 4,
          description: 'Drizzle extra virgin olive oil over the salad.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Sprinkle with salt and freshly ground black pepper to taste.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Optionally, drizzle balsamic glaze over the salad for added flavor.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Serve the Caprese Salad immediately and enjoy the freshness!',
        ),
      ])),
  Meal(
      id: 'm13',
      name: 'Chicken Fajitas',
      price: 12.99,
      imagePath: 'assets/images/meals/chicken_fajitas.jpg',
      description: 'Sizzling chicken fajitas with bell peppers and onions.',
      durationInMinutes: 30,
      categoriesIds: ['c6', 'c2'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Slice chicken breasts into thin strips and place them in a bowl.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Season the chicken with fajita seasoning, salt, and pepper. Toss to coat evenly.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Heat a large skillet or grill pan over medium-high heat.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Add a little oil to the skillet and then add the seasoned chicken strips.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Cook the chicken for 5-6 minutes, stirring occasionally, until it is cooked through and slightly browned.',
        ),
        RecipeStep(
          number: 6,
          description: 'Remove the chicken from the skillet and set it aside.',
        ),
        RecipeStep(
          number: 7,
          description:
              'In the same skillet, add sliced bell peppers and onions.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Cook the vegetables for 4-5 minutes, stirring occasionally, until they are tender-crisp.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Return the cooked chicken to the skillet and toss everything together until heated through.',
        ),
        RecipeStep(
          number: 10,
          description:
              'Serve the Chicken Fajitas hot, accompanied by warm tortillas, salsa, guacamole, and sour cream.',
        ),
      ])),
  Meal(
      id: 'm14',
      name: 'Bratwurst with Sauerkraut',
      price: 9.99,
      imagePath: 'assets/images/meals/bratwurst.jpg',
      description: 'Traditional German sausage with sauerkraut and mustard.',
      durationInMinutes: 20,
      categoriesIds: ['c4'],
      isGlutenFree: false,
      isDairyFree: true,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description: 'Heat a skillet or grill pan over medium-high heat.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Add the bratwurst sausages to the skillet and cook for about 5-7 minutes per side, or until they are browned and cooked through.',
        ),
        RecipeStep(
          number: 3,
          description:
              'While the bratwurst is cooking, heat sauerkraut in a separate skillet or saucepan over medium heat until warmed through.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Once the bratwurst sausages are cooked, remove them from the skillet and let them rest for a few minutes.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Serve the bratwurst sausages hot, topped with warm sauerkraut and mustard on the side.',
        ),
      ])),
  Meal(
      id: 'm15',
      name: 'Wiener Schnitzel',
      price: 14.99,
      imagePath: 'assets/images/meals/wiener_schnitzel.jpg',
      description: 'Crispy breaded veal or pork cutlet, a classic German dish.',
      durationInMinutes: 30,
      categoriesIds: ['c4'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'Place the veal or pork cutlet between two sheets of plastic wrap or parchment paper.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Using a meat mallet or rolling pin, pound the cutlet until it is about 1/4 inch thick.',
        ),
        RecipeStep(
          number: 3,
          description: 'Season the cutlet with salt and pepper on both sides.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Set up a breading station with three shallow bowls: one with flour, one with beaten eggs, and one with breadcrumbs seasoned with salt and pepper.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Dredge the seasoned cutlet first in flour, shaking off any excess, then dip it into the beaten eggs, and finally coat it evenly with breadcrumbs.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Heat a large skillet over medium-high heat and add enough oil to cover the bottom of the skillet.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Once the oil is hot, carefully add the breaded cutlet to the skillet. Cook for 3-4 minutes on each side, or until golden brown and crispy.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Remove the Wiener Schnitzel from the skillet and drain it on a paper towel-lined plate.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Serve the Wiener Schnitzel hot, accompanied by lemon wedges and your choice of side dishes.',
        ),
      ])),
  Meal(
      id: 'm16',
      name: 'Pancakes with Maple Syrup',
      price: 7.99,
      imagePath: 'assets/images/meals/pancakes.jpg',
      description: 'Fluffy pancakes served with maple syrup and butter.',
      durationInMinutes: 15,
      categoriesIds: ['c7'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: true,
      isVegan: false,
      servesHowManyPeople: 2,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description:
              'In a large mixing bowl, whisk together flour, sugar, baking powder, and salt.',
        ),
        RecipeStep(
          number: 2,
          description:
              'In a separate bowl, whisk together milk, eggs, and melted butter until well combined.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Pour the wet ingredients into the dry ingredients and whisk until just combined. Do not overmix; lumps are okay.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Heat a non-stick skillet or griddle over medium heat. Lightly grease with butter or cooking spray.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Pour a ladleful of batter onto the skillet for each pancake. Cook until bubbles form on the surface and the edges look set, about 2-3 minutes.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Flip the pancakes and cook for another 1-2 minutes, until golden brown and cooked through.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Serve the pancakes hot, topped with maple syrup and a pat of butter if desired.',
        ),
      ])),
  Meal(
      id: 'm17',
      name: 'Omelette with Vegetables',
      price: 8.49,
      imagePath: 'assets/images/meals/omelette.jpg',
      description: 'Light and fluffy omelette with assorted vegetables.',
      durationInMinutes: 20,
      categoriesIds: ['c7'],
      isGlutenFree: true,
      isDairyFree: true,
      isVeggie: true,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description: 'Heat a non-stick skillet over medium heat.',
        ),
        RecipeStep(
          number: 2,
          description:
              'In a bowl, whisk together eggs, salt, and pepper until well combined.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Add a little oil or butter to the skillet and swirl to coat the bottom.',
        ),
        RecipeStep(
          number: 4,
          description:
              'Pour the beaten eggs into the skillet and let them cook undisturbed for a minute or two until the edges start to set.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Using a spatula, gently lift the edges of the omelette and tilt the skillet to let any uncooked egg run underneath.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Once the omelette is mostly set but still slightly runny on top, sprinkle your choice of assorted vegetables (such as diced bell peppers, onions, tomatoes, spinach, mushrooms, etc.) evenly over one half of the omelette.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Fold the other half of the omelette over the vegetables to enclose them.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Cook for another minute or until the omelette is cooked through and golden brown on the bottom.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Slide the omelette onto a plate and serve hot, optionally garnished with chopped herbs or grated cheese.',
        ),
      ])),
  Meal(
      id: 'm18',
      name: 'Classic Hamburger',
      price: 8.99,
      imagePath: 'assets/images/meals/hamburger.jpg',
      description: 'Juicy beef patty with lettuce, tomato, onion, and ketchup.',
      durationInMinutes: 15,
      categoriesIds: ['c3'],
      isGlutenFree: false,
      isDairyFree: false,
      isVeggie: false,
      isVegan: false,
      servesHowManyPeople: 1,
      recipe: Recipe(steps: [
        RecipeStep(
          number: 1,
          description: 'Preheat a grill or grill pan over medium-high heat.',
        ),
        RecipeStep(
          number: 2,
          description:
              'Form ground beef into a patty of desired thickness and size. Season both sides with salt and pepper.',
        ),
        RecipeStep(
          number: 3,
          description:
              'Grill the beef patty for about 3-4 minutes on each side, or until it reaches your preferred level of doneness.',
        ),
        RecipeStep(
          number: 4,
          description:
              'While the patty is cooking, lightly toast the hamburger bun on the grill.',
        ),
        RecipeStep(
          number: 5,
          description:
              'Once the patty is cooked to your liking, remove it from the grill and let it rest for a minute.',
        ),
        RecipeStep(
          number: 6,
          description:
              'Assemble the hamburger by placing the cooked patty on the bottom half of the toasted bun.',
        ),
        RecipeStep(
          number: 7,
          description:
              'Top the patty with lettuce, tomato slices, onion slices, and any other desired toppings.',
        ),
        RecipeStep(
          number: 8,
          description:
              'Spread ketchup and/or mustard on the inside of the top half of the bun.',
        ),
        RecipeStep(
          number: 9,
          description:
              'Place the top half of the bun on top of the toppings to complete the hamburger.',
        ),
        RecipeStep(
          number: 10,
          description:
              'Serve the Classic Hamburger hot, optionally accompanied by fries or a side salad.',
        ),
      ])),
];
