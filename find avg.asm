.LC0:
  .string "The sum of 3 numbers is:"
.LC1:
  .string "The average of 3 numbers is:"
main:
  push rbp
  mov rbp, rsp
  sub rsp, 32
  lea rax, [rbp-12]
  mov rsi, rax
  mov edi, OFFSET FLAT:_ZSt3cin
  call std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
  mov rdx, rax
  lea rax, [rbp-16]
  mov rsi, rax
  mov rdi, rdx
  call std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
  mov rdx, rax
  lea rax, [rbp-20]
  mov rsi, rax
  mov rdi, rdx
  call std::basic_istream<char, std::char_traits<char> >::operator>>(int&)
  mov edx, DWORD PTR [rbp-12]
  mov eax, DWORD PTR [rbp-16]
  add edx, eax
  mov eax, DWORD PTR [rbp-20]
  add eax, edx
  mov DWORD PTR [rbp-4], eax
  mov esi, OFFSET FLAT:.LC0
  mov edi, OFFSET FLAT:_ZSt4cout
  call std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
  mov rdx, rax
  mov eax, DWORD PTR [rbp-4]
  mov esi, eax
  mov rdi, rdx
  call std::basic_ostream<char, std::char_traits<char> >::operator<<(int)
  mov esi, OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
  mov rdi, rax
  call std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))
  mov ecx, DWORD PTR [rbp-4]
  mov edx, 1431655766
  mov eax, ecx
  imul edx
  mov eax, ecx
  sar eax, 31
  sub edx, eax
  mov eax, edx
  cvtsi2ss xmm0, eax
  movss DWORD PTR [rbp-8], xmm0
  mov esi, OFFSET FLAT:.LC1
  mov edi, OFFSET FLAT:_ZSt4cout
  call std::basic_ostream<char, std::char_traits<char> >& std::operator<< <std::char_traits<char> >(std::basic_ostream<char, std::char_traits<char> >&, char const*)
  movss xmm0, DWORD PTR [rbp-8]
  mov rdi, rax
  call std::basic_ostream<char, std::char_traits<char> >::operator<<(float)
  mov esi, OFFSET FLAT:_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
  mov rdi, rax
  call std::basic_ostream<char, std::char_traits<char> >::operator<<(std::basic_ostream<char, std::char_traits<char> >& (*)(std::basic_ostream<char, std::char_traits<char> >&))
  mov eax, 0
  leave
  ret
__static_initialization_and_destruction_0(int, int):
  push rbp
  mov rbp, rsp
  sub rsp, 16
  mov DWORD PTR [rbp-4], edi
  mov DWORD PTR [rbp-8], esi
  cmp DWORD PTR [rbp-4], 1
  jne .L5
  cmp DWORD PTR [rbp-8], 65535
  jne .L5
  mov edi, OFFSET FLAT:_ZStL8__ioinit
  call std::ios_base::Init::Init() [complete object constructor]
  mov edx, OFFSET FLAT:__dso_handle
  mov esi, OFFSET FLAT:_ZStL8__ioinit
  mov edi, OFFSET FLAT:_ZNSt8ios_base4InitD1Ev
  call __cxa_atexit
.L5:
  nop
  leave
  ret
_GLOBAL__sub_I_main:
  push rbp
  mov rbp, rsp
  mov esi, 65535
  mov edi, 1
  call __static_initialization_and_destruction_0(int, int)
  pop rbp
  ret