## Oyster Cards Makers Project

Tackling the Makers pair programming challenge - found here: https://github.com/makersacademy/course/tree/master/oystercard


## How to use

#### Topping up a card

Any instance of an oystercard can be topped up with a given monetary amount by calling the method `top_up` on the oystercard and passing an integer argument of the desired top-up amount.

E.g. `my_oystercard.top_up(10)` will top £10.

Cards have a maximum balance limit of £90. If a user tries to top up a card taking the balance beyond this, the top-up will be unsuccessful and they'll receive an error message.

E.g. `my_oystercard.top_up(150)` will give the error message `top-up unsuccessful, maximum balance of £90 exceeded`.

#### Deducting money from a card

Using the method `deduct` with an integer argument on an instance of Oystercard will reduce the balance on the card by the given amount.

E.g. `my_oystercard.deduct(15)` will take £15 off the card.

#### Touching in and out of journeys

Using the method `touch_in` on an instance of Oystercard will update the `in_journey?` method to return `true`.
Using the method `touch_out` on an instance of Oystercard will update the `in_journey?` method to return `false`.

#### Minimum amount for journeys

When the oystercard balance is less than 1 (EG when the oyster card is first created), calling the method `touch_in` on an instance of Oystercard will throw an error "Insufficient balance to touch in."
