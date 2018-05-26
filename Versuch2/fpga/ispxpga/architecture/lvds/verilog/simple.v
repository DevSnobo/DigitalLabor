module simple(p_in, n_in, o);
input 		p_in, n_in;
output		o;
BLVDSIN I1 (.P_IN(p_in), .N_IN(n_in), .O(o));
endmodule
