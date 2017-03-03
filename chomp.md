# Chomp

We've been using the chomp() method to get rid of the last return character. Find another method among those provided by the String class that could be used for the same purpose (although it will require passing some arguments).

## ** chomp (separator=$/) → new_str 
Returns a new String with the given record separator removed from the end of str (if present). If $/ has not been changed from the default Ruby record separator, then chomp also removes carriage return characters (that is it will remove \n, \r, and \r\n). If $/ is an empty string, it will remove all trailing newlines from the string.

## ** chop → new_str 
Returns a new String with the last character removed. If the string ends with \r\n, both characters are removed. Applying chop to an empty string returns an empty string. String#chomp is often a safer alternative, as it leaves the string unchanged if it doesn’t end in a record separator.

## ** strip → new_str
Returns a copy of str with leading and trailing whitespace removed.
