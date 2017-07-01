echo '
Hello Grammar!
______________

Testing the "Hello" grammar.

This grammar is set up to fail on text
that is upper case, or is punctuation.

It will only recognise lower case letters.

Testing the phrase "hello Lucas!" which should fail on "L" and "!"

'
echo 'hello Lucas!' | java org.antlr.v4.gui.TestRig Hello r -tokens
