\A: The string starts.
[1-9]: The first character is '1', which matches this requirement (it's between '1' and '9').
\d*: The next characters are '0' and '0'. Both are digits (\d), and the * allows for zero or more digits. So, "00" matches this part.
\z: The string ends immediately after the last '0'.
