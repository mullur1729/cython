
import os
from wrapper import PyTest,PyCallBack

def f(self, t, x):
  val = t.get_b()
  val += 3.0*x
  t.set_b(val)

t = PyTest()
t.set_callback(f)
t.stack(15.0)

print t.get_b()

