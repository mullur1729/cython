class CallbackWrapper {
  void (*my_func_ptr)(CallbackWrapper*, double);
  double _b;
public:
  CallbackWrapper();
  void set_callback(void (*f)(CallbackWrapper*, double));
  void stack(double);
  double get_b(){ return _b; }
  void set_b(double val) { _b = val; }
};