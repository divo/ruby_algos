"""Functions for calculating steps in exchanging currency.

Python numbers documentation: https://docs.python.org/3/library/stdtypes.html#numeric-types-int-float-complex

Overview of exchanging currency when travelling: https://www.compareremit.com/money-transfer-tips/guide-to-exchanging-currency-for-overseas-travel/
"""



"""

:param budget: float - amount of money you are planning to exchange.
:param exchange_rate: float - unit value of the foreign currency.
:return: float - exchanged value of the foreign currency you can receive.
"""
def exchange_money(budget, exchange_rate):
    return budget / exchange_rate

"""

:param budget: float - amount of money you own.
:param exchanging_value: float - amount of your money you want to exchange now.
:return: float - amount left of your starting currency after exchanging.
"""
def get_change(budget, exchanging_value):
    return budget - exchanging_value


"""

:param denomination: int - the value of a bill.
:param number_of_bills: int - total number of bills.
:return: int - calculated value of the bills.
"""
def get_value_of_bills(denomination, number_of_bills):
    return denomination * number_of_bills


"""

:param amount: float - the total starting value.
:param denomination: int - the value of a single bill.
:return: int - number of bills that can be obtained from the amount.
"""
def get_number_of_bills(amount, denomination):
    return amount // denomination


"""

:param amount: float - the total starting value.
:param denomination: int - the value of a single bill.
:return: float - the amount that is "leftover", given the current denomination.
"""
def get_leftover_of_bills(amount, denomination):
    return amount % denomination


"""

:param budget: float - the amount of your money you are planning to exchange.
:param exchange_rate: float - the unit value of the foreign currency.
:param spread: int - percentage that is taken as an exchange fee.
:param denomination: int - the value of a single bill.
:return: int - maximum value you can get.
"""
def exchangeable_value(budget, exchange_rate, spread, denomination):
    final_rate = exchange_rate + (exchange_rate * (spread / 100))
    gross = exchange_money(budget, final_rate)
    return get_number_of_bills(gross, denomination) * denomination

