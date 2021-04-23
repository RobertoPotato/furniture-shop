import 'package:woody/models/review_model.dart';

const kLorem =
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.";

Review review1 = new Review("John Doe", 4.2, kLorem);
Review review2 = new Review("Jane Doe", 4.2, kLorem);
Review review3 = new Review("Mary Doe", 4.2, kLorem);
Review review4 = new Review("Mike Doe", 4.2, kLorem);
Review review5 = new Review("Anna Doe", 4.2, kLorem);
Review review6 = new Review("Jude Doe", 4.2, kLorem);
Review review7 = new Review("Ash Doe", 4.2, kLorem);

Review uReview1 = new Review("Cedar Furniture Shop", 5, kLorem);
Review uReview2 = new Review("HW-Designs", 4.7, kLorem);
Review uReview3 = new Review("Bamboo Shop", 5, kLorem);
Review uReview4 = new Review("Tajiri Artisans", 5, kLorem);
Review uReview5 = new Review("NRB Youth", 4.7, kLorem);
Review uReview6 = new Review("Dope Designs", 5, kLorem);

List<Review> uReviews = [
  uReview1,
  uReview2,
  uReview3,
  uReview4,
  uReview5,
  uReview6,
];

List<Review> reviews = [
  review1,
  review2,
  review3,
  review4,
  review5,
  review6,
  review7,
];
