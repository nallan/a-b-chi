A-B-Chi
=========
In the Morning!

A-B-Chi is a RubyGem aimed at making the process of sorting Chinese Traditional characters easy without having to change database collation settings (I personally couldnt work them out).

I have been wroking in Taiwan for the last year on a CRM-type database and have learned quite a bit about Chinese Traditional characters and their attributes. after pulling my hair out over collation I decided that the best thing to do would be to make my own solution and as I notice that a lot of other people have similar problems I wanted to make this publically available.


There are a few extra functions that I plan to implement in the future which include

  - Character to BoPoMoFo (pronunciation characters) and other various things - perhaps a ruby text function or two.
  - Handling of English and Chinese Simplified Characters.
  - Base everything around the utf-8 character codes rather than a list of characters.

Version
-

1.1.3

Further Info
-----------
- I have compiled an extensive database of each Chinese Traditional character and its attributes indluding each different pronunciation of it and will be implementing this in awesome ways in the future. This contains just shy of 16,000 entries.

- If you want to know about BoPoMoFo, I recommend reading the Wikipedia entry on it: http://en.wikipedia.org/wiki/Bopomofo

- You should also check out the Taiwan Government's official write-up on their standards which can be found here: http://www.cns11643.gov.tw/AIDB/encodings_en.do


Installation
--------------

```gem install a-b-chi```
or for bundler add the following to your Gemfile
```gem 'a-b-chi'```

The sourcecode can be found at https://github.com/nallan/a-b-chi

Usage
--------------

firstly require the file in your project
```require 'a-b-chi'```
next you must create a new instance of the ArrayChinese class and populate your array
```arr = ArrayChinese.new
arr.push "李依恬", "李雲帆", "珍項小珍", "瑞芳", "李宗翰"
```
finally run the sort method on this. both sort and sort! are supported
```arr.sort
arr.sort!```

License
-

MIT