
#include "test.h"

  CallbackWrapper::CallbackWrapper() {
   this->my_func_ptr = 0;
   _b = 0.0;
  }
  
  void CallbackWrapper::stack(double val) {
    if (this->my_func_ptr != 0) {
      this->my_func_ptr(this, val);
    }
    else {
      _b += val;
    }
  }
  
  void CallbackWrapper::set_callback(void (*f)(CallbackWrapper*, double)){
     this->my_func_ptr = f;
  }