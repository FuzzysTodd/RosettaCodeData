% set ml [multilist 0 2 3 4]
{{0 0 0 0} {0 0 0 0} {0 0 0 0}} {{0 0 0 0} {0 0 0 0} {0 0 0 0}}
% lset ml 1 2 3 11
{{0 0 0 0} {0 0 0 0} {0 0 0 0}} {{0 0 0 0} {0 0 0 0} {0 0 0 11}}
% lset ml 1 1 4 12
{{0 0 0 0} {0 0 0 0} {0 0 0 0}} {{0 0 0 0} {0 0 0 0 12} {0 0 0 11}}
% lindex $ml 1 2 3
11