# If you need high precision: Sum of a Taylor series method.
# Adjust the terms parameter to suit. Theoretically the
# terms could be ∞. Practically, calculating an infinite
# series takes an awfully long time so limit to 500.

constant 𝑒 = [\+] flat 1, [\/] 1.FatRat..*;

.say for 𝑒[500].comb(80);

say '';

# Or, if you don't need high precision, it's a built-in.
say e;
