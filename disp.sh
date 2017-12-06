#!/bin/sh

a=$(lynx -base -source 'https://coinmarketcap.com/currencies/neblio/' | hxnormalize -x | \
    hxselect -c -s '\n' "body > div.container > div > div.col-lg-10 > div.row.bottom-margin-1x > div.col-xs-6.col-sm-8.col-md-4.text-left > span.text-gray.details-text-medium")
str=$(echo $a)
printf $str


