int btstack_enable(int choose);
typedef void (*handlecallback)(int opcode, int data);
int register_handle(handlecallback cb);
int start_scan(void);
int btstack_init(void);
int main(int argc, const char * argv[]);
