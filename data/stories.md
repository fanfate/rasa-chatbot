## story_happy
* greet
  - utter_greet
* mood_happy
  - utter_happy
* goodbye
  - utter_goodbye

## story_unhappy
* greet
  - utter_greet
* mood_unhappy
  - utter_unhappy
* goodbye
  - utter_goodbye

## search_restaurant
* greet
  - utter_greet
* restaurant_search{"location":"中国"}
  - utter_restaurant_search
* goodbye
  - utter_goodbye

## political_disscussion
* greet
  - utter_greet
* utter_political_disscussion{"location":"美国", "events": "傻逼"}
  - utter_political_disscussion
* affirm
  - utter_affirm
* goodbye
  - utter_goodbye
