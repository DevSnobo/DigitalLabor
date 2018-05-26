module top(top_p_in, top_n_in, top_o);
input 		top_p_in, top_n_in;
output		top_o;
simple S1 (.p_in(top_p_in), .n_in(top_n_in), .o(top_o));
endmodule
