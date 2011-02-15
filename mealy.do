-- Mealy.do
-- Test av Mealy, Lab3

restart -f -nowave
view signals wave
add wave clk x reset q qp u
force clk 0 0, 1 100 ns, 0 200 ns -repeat 200 ns

force reset 1
force x 00
run 425

force reset 0
run 225

force x 00
run 200

force x 00
run 200

force x 00
run 200

force x 11
run 200

force x 10
run 200

force x 01
run 200

force x 01
run 200

force x 01
run 200

force x 01
run 200

force x 00
run 400

force x 01
run 200

force x 01
run 200

force x 00
run 200

force x 11
run 200

force x 00
run 200

force x 11
run 200

force x 00
run 200

force x 11
run 200

force x 01
run 200

force x 00
run 1200

force x 00
run 200

force x 11 
run 200

force x 10
run 1200