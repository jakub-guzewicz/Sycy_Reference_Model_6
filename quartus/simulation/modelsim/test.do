restart -nowave -force
add wave -radix binary /hulkFinder/clk
add wave -radix binary /hulkFinder/ena
add wave -radix binary /hulkFinder/rst
add wave -radix binary /hulkFinder/mode
add wave -radix ascii /hulkFinder/cipher
add wave -radix ascii /hulkFinder/key
add wave -radix ascii /hulkFinder/decrypted
add wave -radix ascii /hulkFinder/cipherKey
force clk 1 0, 0 {50 ps} -r 100
force ena 1 0
force rst 1 0
force rst 0 1
force mode 0 0
force cipher 'hfbf56a32c6400513 1
force key 'h48756c6b206973207468652062657374 1
run 3400
noforce key
force mode 1 3400
run 3600