function [K_pu, K_pr] = getDiffiHellmanKey(q, a)
    K_pr = randi(q-1);
    K_pu = mod(vpi(a)^K_pr, q);