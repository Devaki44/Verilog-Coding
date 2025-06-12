module expression(
  input a,b,c,d,e,
  output y);
  
  wire w1,w2,w3;
  wire x1,x2,x3,x4;
  wire y1,y2;
  wire z1,z2,z3;
  
  not #4 n1(w1,a);
  not #4 n2(w2,b);
  not #4 n3(w3,c);
  
  and #3 a1(x1,w1,w2);
  and #3 a2(x2,a,b);
  and #3 a3(x3,c,w2);
  and #3 a4(x4,c,w3);
  and #3 a5(y1,x1,x2);
  and #3 a6(y2,x2,e);
  
  or #2 o1(z1,y1,y2);
  or #2 o2(z2,x3,x4);
  or #2 o3(z3,z1,z2);
  
  assign y=z3;
endmodule
  
  
  
  
  
