from cpython cimport array
from cpython cimport string
import array
import string
from libc.stdlib cimport malloc, free

from cpython.mem cimport PyMem_Malloc, PyMem_Realloc, PyMem_Free

cdef extern from "gap_init.h":
    cdef int start_scan()
    ctypedef handlecallback
    cdef int btstack_main(int choose)
    int btstack_init();
    cdef int main(int argc, const char *argv[])

def btif_btstack_enable(choose):
    return btstack_main(choose)

def btif_btstack_init():
    return btstack_init()

cdef class Variable:

    cdef unsigned int Length
    cdef char ** Array
   
    def __cinit__(self, var,size_t length):
        self.Length = length
        self.Array = <char **>PyMem_Malloc(length * sizeof(char*))
        #as in docs, a good practice
        if not self.Array:
            raise MemoryError()
        #self.var = var
        #for i in range(len(var)):
        #    self.Array[i] = <char *>string.PyBytes_AS_STRING(self.var[i])

    def __dealloc__(self):
        PyMem_Free(self.Array)

def btif_btstack_main(*list):
    pystr_list = ["one", "two", "three"]
    v1 = Variable(pystr_list, 3)
    r = main(0, v1.Array)
    
    #cdef char **string_buf = <char **>PyMem_Malloc(len(pystr_list) * sizeof(char*))
    #for i in range(len(pystr_list)):
    #    string_buf[i] = string.PyBytes_AsString(pystr_list[i])
    #r = main(0, string_buf)
    #PyMem_Free(string_buf)
    return r