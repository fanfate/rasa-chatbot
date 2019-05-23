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
## Generated Story 9208014355248800802
* greet
    - utter_greet
* restaurant_search{"location": "\u4e2d\u56fd"}
    - slot{"location": "\u4e2d\u56fd"}
    - utter_restaurant_search
* mood_uphappy{"mood": "\u5fc3\u60c5"}
    - slot{"mood": "\u5fc3\u60c5"}
    - utter_unhappy
* goodbye
    - utter_goodbye
* affirm{"location": "\u7f8e\u56fd", "bad_events": "\u51fa\u4e8b"}
    - slot{"bad_events": "\u51fa\u4e8b"}
    - slot{"location": "\u7f8e\u56fd"}
    - utter_political_disscussion
* restaurant_search{"location": "\u58a8\u897f\u54e5", "restaurant_type": "\u5feb\u9910\u5e97"}
    - slot{"location": "\u58a8\u897f\u54e5"}
    - slot{"restaurant_type": "\u5feb\u9910\u5e97"}
    - utter_restaurant_search
* goodbye
    - utter_goodbye
* political_disscussion{"location": "\u4e2d\u56fd", "good_events": "\u597d\u4e8b\u4e0d\u65ad"}
    - slot{"good_events": "\u597d\u4e8b\u4e0d\u65ad"}
    - slot{"location": "\u4e2d\u56fd"}
    - utter_political_disscussion
* affirm
    - utter_affirm
* goodbye
    - utter_goodbye
* stop
    - utter_greet
* goodbye
    - utter_goodbye

## Generated Story -4609025114059923832
* greet
    - utter_greet
* mood_happy
    - utter_happy
* thanks
    - utter_thanks
* goodbye
    - utter_goodbye

