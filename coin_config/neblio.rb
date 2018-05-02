
#!/usr/bin/ruby
module Neblio
  PERFORM_ERROR = 'Invalid crypto command.'
  BALANCE_REPLY_PRETEXT = 'Your current balance is:'
  CURRENCY_ICON = ' NEBL :neblio:'
  WEALTHY_UPPER_BOUND = 10000
  WEALTHY_UPPER_BOUND_POSTTEXT = ' Rolling in NEBL!'
  WEALTHY_UPPER_BOUND_EMOJI = ':neblio:'
  BALANCE_REPLY_POSTTEXT = ' '
  DEPOSIT_PRETEXT = 'Enter an integer for deposit ->'
  DEPOSIT_POSTTEXT = '<- this is your depositing address.'
  TIP_ERROR_TEXT = 'Please say -> tip @username amount'
  TIP_PRETEXT = 'Give a little to get a little, they say?'
  TIP_POSTTEXT1 = 'http://explorer.nebl.io/tx/'
  TIP_POSTTEXT2 = ' |View transaction on Neblio Block Explorer.'
  WITHDRAW_TEXT = 'Tired of being the charitable type!?'
  WITHDRAW_ICON = ':neblio:'
  NETWORKINFO_ICON = ':bar_chart:'
  TOO_POOR_TEXT = 'Insufficient funds, you must have at least 0.0001 NEBL left over after your tip. '
  PRICE_PRE = 'The current price of NEBL :neblio: is: '
  HELP = 'Commands are used by saying tipbot and one of the following: deposit, balance, tip, withdraw, leaderboard,  price, chart or about.'
  NO_PURPOSE_LOWER_BOUND_TEXT = 'You call that a tip?'
  NO_PURPOSE_LOWER_BOUND = 0.000001
  HI = 'Greetings'
  GREETING = ', I hope you are having a good day.'
  RANDOMIZED_EMOJI = ':neblio:'
  NETWORK = 'neblio'
  ABOUT = 'Compiled by @nebliodev, view source code on '
  ABOUT2 = 'https://github.com/NeblioTeam/nebl-tipbot'
  FEE = 'Attempt compensating for tx fee.'
  SYM = 'BTC :bitcoin:'
  BTC = 'Which is approximately equal to '
end
