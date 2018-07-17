#!/bin/sh

a=$(lynx -base -source 'https://coinmarketcap.com/currencies/neblio/' | hxnormalize -x | \
    hxselect -c -s '\n' "body > div.container.main-section > div > div.col-lg-10 > div.details-panel.flex-container.bottom-margin-2x > div.details-panel-item--header.flex-container > div.details-panel-item--price.bottom-margin-1x > span.text-gray > span")
str=$(echo $a)
printf $str


