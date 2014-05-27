
cdef extern from "test.h":
    cdef cppclass CallbackWrapper:
      CallbackWrapper()
      void stack(double)
      void set_callback(void (*f)(CallbackWrapper*, double))
      double get_b()
      void set_b(double)

class PyCallBack:
    pass
    
cdef void my_cython_callback(CallbackWrapper* ptr, double x):
    tt = PyTest(origin_in_c = True)
    tt.thisptr = ptr
    p = PyCallBack()
    p.f(tt, x)
    

cdef class PyTest:
    cdef CallbackWrapper *thisptr
    cdef bint origin_in_c
    def __cinit__(self, bint origin_in_c=False):
      self.origin_in_c = origin_in_c
      if not self.origin_in_c: self.thisptr = new CallbackWrapper()
    def __dealloc__(self):
      if not self.origin_in_c: del self.thisptr
    def get_b(self):
      cdef double val = self.thisptr.get_b()
      return val
    def set_b(self, double val):
      self.thisptr.set_b(val)
    def set_callback(self, f):
      PyCallBack.f = f
      self.thisptr.set_callback(&my_cython_callback)
    def stack(self,double val):
      self.thisptr.stack(val)