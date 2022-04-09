
_task3test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	83 ec 10             	sub    $0x10,%esp
  enablecount();
   a:	e8 4b 03 00 00       	call   35a <enablecount>
  int i = fork();
   f:	e8 96 02 00 00       	call   2aa <fork>
  14:	89 c3                	mov    %eax,%ebx
  int yehey;
  ps();
  16:	e8 57 03 00 00       	call   372 <ps>
  if (i < 0){
  1b:	85 db                	test   %ebx,%ebx
  1d:	78 2a                	js     49 <main+0x49>
	exit();
	}
  else if (i == 0){
  1f:	bb 04 00 00 00       	mov    $0x4,%ebx
  24:	75 2a                	jne    50 <main+0x50>
 	for (yehey = 0; yehey <= 3; yehey++){
		printf(2, "Hello world, I am child. \n");
  26:	c7 44 24 04 96 07 00 	movl   $0x796,0x4(%esp)
  2d:	00 
  2e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  35:	e8 f6 03 00 00       	call   430 <printf>
		ps();
  3a:	e8 33 03 00 00       	call   372 <ps>
  ps();
  if (i < 0){
	exit();
	}
  else if (i == 0){
 	for (yehey = 0; yehey <= 3; yehey++){
  3f:	83 eb 01             	sub    $0x1,%ebx
  42:	75 e2                	jne    26 <main+0x26>
	resetcount();
	ps();
	disablecount();
	ps();
	}
  ps();
  44:	e8 29 03 00 00       	call   372 <ps>
  exit();
  49:	e8 64 02 00 00       	call   2b2 <exit>
  4e:	66 90                	xchg   %ax,%ax
		ps();
	}
  }
  else {
	for (yehey = 0; yehey <= 3; yehey++){
		wait();
  50:	e8 65 02 00 00       	call   2ba <wait>
                printf(2,"Hello world, I am parent. \n");
  55:	c7 44 24 04 b1 07 00 	movl   $0x7b1,0x4(%esp)
  5c:	00 
  5d:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  64:	e8 c7 03 00 00       	call   430 <printf>
		ps();
  69:	e8 04 03 00 00       	call   372 <ps>
		printf(2, "Hello world, I am child. \n");
		ps();
	}
  }
  else {
	for (yehey = 0; yehey <= 3; yehey++){
  6e:	83 eb 01             	sub    $0x1,%ebx
  71:	75 dd                	jne    50 <main+0x50>
		wait();
                printf(2,"Hello world, I am parent. \n");
		ps();
        }
	resetcount();
  73:	e8 f2 02 00 00       	call   36a <resetcount>
	ps();
  78:	e8 f5 02 00 00       	call   372 <ps>
  7d:	8d 76 00             	lea    0x0(%esi),%esi
	disablecount();
  80:	e8 dd 02 00 00       	call   362 <disablecount>
	ps();
  85:	e8 e8 02 00 00       	call   372 <ps>
  8a:	eb b8                	jmp    44 <main+0x44>
  8c:	66 90                	xchg   %ax,%ax
  8e:	66 90                	xchg   %ax,%ax

00000090 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
  90:	55                   	push   %ebp
  91:	89 e5                	mov    %esp,%ebp
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  99:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
  9a:	89 c2                	mov    %eax,%edx
  9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  a0:	83 c1 01             	add    $0x1,%ecx
  a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
  a7:	83 c2 01             	add    $0x1,%edx
  aa:	84 db                	test   %bl,%bl
  ac:	88 5a ff             	mov    %bl,-0x1(%edx)
  af:	75 ef                	jne    a0 <strcpy+0x10>
    ;
  return os;
}
  b1:	5b                   	pop    %ebx
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    
  b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  c3:	8b 55 08             	mov    0x8(%ebp),%edx
  c6:	53                   	push   %ebx
  c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
  ca:	0f b6 02             	movzbl (%edx),%eax
  cd:	84 c0                	test   %al,%al
  cf:	74 2d                	je     fe <strcmp+0x3e>
  d1:	0f b6 19             	movzbl (%ecx),%ebx
  d4:	38 d8                	cmp    %bl,%al
  d6:	74 0e                	je     e6 <strcmp+0x26>
  d8:	eb 2b                	jmp    105 <strcmp+0x45>
  da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  e0:	38 c8                	cmp    %cl,%al
  e2:	75 15                	jne    f9 <strcmp+0x39>
    p++, q++;
  e4:	89 d9                	mov    %ebx,%ecx
  e6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
  ec:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ef:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
  f3:	84 c0                	test   %al,%al
  f5:	75 e9                	jne    e0 <strcmp+0x20>
  f7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f9:	29 c8                	sub    %ecx,%eax
}
  fb:	5b                   	pop    %ebx
  fc:	5d                   	pop    %ebp
  fd:	c3                   	ret    
  fe:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 101:	31 c0                	xor    %eax,%eax
 103:	eb f4                	jmp    f9 <strcmp+0x39>
 105:	0f b6 cb             	movzbl %bl,%ecx
 108:	eb ef                	jmp    f9 <strcmp+0x39>
 10a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000110 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 116:	80 39 00             	cmpb   $0x0,(%ecx)
 119:	74 12                	je     12d <strlen+0x1d>
 11b:	31 d2                	xor    %edx,%edx
 11d:	8d 76 00             	lea    0x0(%esi),%esi
 120:	83 c2 01             	add    $0x1,%edx
 123:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 127:	89 d0                	mov    %edx,%eax
 129:	75 f5                	jne    120 <strlen+0x10>
    ;
  return n;
}
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 12d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 12f:	5d                   	pop    %ebp
 130:	c3                   	ret    
 131:	eb 0d                	jmp    140 <memset>
 133:	90                   	nop
 134:	90                   	nop
 135:	90                   	nop
 136:	90                   	nop
 137:	90                   	nop
 138:	90                   	nop
 139:	90                   	nop
 13a:	90                   	nop
 13b:	90                   	nop
 13c:	90                   	nop
 13d:	90                   	nop
 13e:	90                   	nop
 13f:	90                   	nop

00000140 <memset>:

void*
memset(void *dst, int c, uint n)
{
 140:	55                   	push   %ebp
 141:	89 e5                	mov    %esp,%ebp
 143:	8b 55 08             	mov    0x8(%ebp),%edx
 146:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 147:	8b 4d 10             	mov    0x10(%ebp),%ecx
 14a:	8b 45 0c             	mov    0xc(%ebp),%eax
 14d:	89 d7                	mov    %edx,%edi
 14f:	fc                   	cld    
 150:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 152:	89 d0                	mov    %edx,%eax
 154:	5f                   	pop    %edi
 155:	5d                   	pop    %ebp
 156:	c3                   	ret    
 157:	89 f6                	mov    %esi,%esi
 159:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000160 <strchr>:

char*
strchr(const char *s, char c)
{
 160:	55                   	push   %ebp
 161:	89 e5                	mov    %esp,%ebp
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	53                   	push   %ebx
 167:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 16a:	0f b6 18             	movzbl (%eax),%ebx
 16d:	84 db                	test   %bl,%bl
 16f:	74 1d                	je     18e <strchr+0x2e>
    if(*s == c)
 171:	38 d3                	cmp    %dl,%bl
 173:	89 d1                	mov    %edx,%ecx
 175:	75 0d                	jne    184 <strchr+0x24>
 177:	eb 17                	jmp    190 <strchr+0x30>
 179:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 180:	38 ca                	cmp    %cl,%dl
 182:	74 0c                	je     190 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 c0 01             	add    $0x1,%eax
 187:	0f b6 10             	movzbl (%eax),%edx
 18a:	84 d2                	test   %dl,%dl
 18c:	75 f2                	jne    180 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 18e:	31 c0                	xor    %eax,%eax
}
 190:	5b                   	pop    %ebx
 191:	5d                   	pop    %ebp
 192:	c3                   	ret    
 193:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 199:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000001a0 <gets>:

char*
gets(char *buf, int max)
{
 1a0:	55                   	push   %ebp
 1a1:	89 e5                	mov    %esp,%ebp
 1a3:	57                   	push   %edi
 1a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 1a7:	53                   	push   %ebx
 1a8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 1ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ae:	eb 31                	jmp    1e1 <gets+0x41>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 1bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c3:	e8 02 01 00 00       	call   2ca <read>
    if(cc < 1)
 1c8:	85 c0                	test   %eax,%eax
 1ca:	7e 1d                	jle    1e9 <gets+0x49>
      break;
    buf[i++] = c;
 1cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1d2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 1d5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 1d7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 1db:	74 0c                	je     1e9 <gets+0x49>
 1dd:	3c 0a                	cmp    $0xa,%al
 1df:	74 08                	je     1e9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e1:	8d 5e 01             	lea    0x1(%esi),%ebx
 1e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 1e7:	7c c7                	jl     1b0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
 1ec:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 1f0:	83 c4 2c             	add    $0x2c,%esp
 1f3:	5b                   	pop    %ebx
 1f4:	5e                   	pop    %esi
 1f5:	5f                   	pop    %edi
 1f6:	5d                   	pop    %ebp
 1f7:	c3                   	ret    
 1f8:	90                   	nop
 1f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000200 <stat>:

int
stat(const char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	56                   	push   %esi
 204:	53                   	push   %ebx
 205:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 212:	00 
 213:	89 04 24             	mov    %eax,(%esp)
 216:	e8 d7 00 00 00       	call   2f2 <open>
  if(fd < 0)
 21b:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 21f:	78 27                	js     248 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 221:	8b 45 0c             	mov    0xc(%ebp),%eax
 224:	89 1c 24             	mov    %ebx,(%esp)
 227:	89 44 24 04          	mov    %eax,0x4(%esp)
 22b:	e8 da 00 00 00       	call   30a <fstat>
  close(fd);
 230:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 233:	89 c6                	mov    %eax,%esi
  close(fd);
 235:	e8 a0 00 00 00       	call   2da <close>
  return r;
 23a:	89 f0                	mov    %esi,%eax
}
 23c:	83 c4 10             	add    $0x10,%esp
 23f:	5b                   	pop    %ebx
 240:	5e                   	pop    %esi
 241:	5d                   	pop    %ebp
 242:	c3                   	ret    
 243:	90                   	nop
 244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 248:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 24d:	eb ed                	jmp    23c <stat+0x3c>
 24f:	90                   	nop

00000250 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 250:	55                   	push   %ebp
 251:	89 e5                	mov    %esp,%ebp
 253:	8b 4d 08             	mov    0x8(%ebp),%ecx
 256:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 257:	0f be 11             	movsbl (%ecx),%edx
 25a:	8d 42 d0             	lea    -0x30(%edx),%eax
 25d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 25f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 264:	77 17                	ja     27d <atoi+0x2d>
 266:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 268:	83 c1 01             	add    $0x1,%ecx
 26b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 26e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 272:	0f be 11             	movsbl (%ecx),%edx
 275:	8d 5a d0             	lea    -0x30(%edx),%ebx
 278:	80 fb 09             	cmp    $0x9,%bl
 27b:	76 eb                	jbe    268 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 27d:	5b                   	pop    %ebx
 27e:	5d                   	pop    %ebp
 27f:	c3                   	ret    

00000280 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 280:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 281:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
 283:	89 e5                	mov    %esp,%ebp
 285:	56                   	push   %esi
 286:	8b 45 08             	mov    0x8(%ebp),%eax
 289:	53                   	push   %ebx
 28a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 28d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 290:	85 db                	test   %ebx,%ebx
 292:	7e 12                	jle    2a6 <memmove+0x26>
 294:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 298:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 29c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 29f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a2:	39 da                	cmp    %ebx,%edx
 2a4:	75 f2                	jne    298 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 2a6:	5b                   	pop    %ebx
 2a7:	5e                   	pop    %esi
 2a8:	5d                   	pop    %ebp
 2a9:	c3                   	ret    

000002aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2aa:	b8 01 00 00 00       	mov    $0x1,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <exit>:
SYSCALL(exit)
 2b2:	b8 02 00 00 00       	mov    $0x2,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <wait>:
SYSCALL(wait)
 2ba:	b8 03 00 00 00       	mov    $0x3,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <pipe>:
SYSCALL(pipe)
 2c2:	b8 04 00 00 00       	mov    $0x4,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <read>:
SYSCALL(read)
 2ca:	b8 05 00 00 00       	mov    $0x5,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <write>:
SYSCALL(write)
 2d2:	b8 10 00 00 00       	mov    $0x10,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <close>:
SYSCALL(close)
 2da:	b8 15 00 00 00       	mov    $0x15,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <kill>:
SYSCALL(kill)
 2e2:	b8 06 00 00 00       	mov    $0x6,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <exec>:
SYSCALL(exec)
 2ea:	b8 07 00 00 00       	mov    $0x7,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <open>:
SYSCALL(open)
 2f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <mknod>:
SYSCALL(mknod)
 2fa:	b8 11 00 00 00       	mov    $0x11,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <unlink>:
SYSCALL(unlink)
 302:	b8 12 00 00 00       	mov    $0x12,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <fstat>:
SYSCALL(fstat)
 30a:	b8 08 00 00 00       	mov    $0x8,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <link>:
SYSCALL(link)
 312:	b8 13 00 00 00       	mov    $0x13,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <mkdir>:
SYSCALL(mkdir)
 31a:	b8 14 00 00 00       	mov    $0x14,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <chdir>:
SYSCALL(chdir)
 322:	b8 09 00 00 00       	mov    $0x9,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <dup>:
SYSCALL(dup)
 32a:	b8 0a 00 00 00       	mov    $0xa,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <getpid>:
SYSCALL(getpid)
 332:	b8 0b 00 00 00       	mov    $0xb,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sbrk>:
SYSCALL(sbrk)
 33a:	b8 0c 00 00 00       	mov    $0xc,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <sleep>:
SYSCALL(sleep)
 342:	b8 0d 00 00 00       	mov    $0xd,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <uptime>:
SYSCALL(uptime)
 34a:	b8 0e 00 00 00       	mov    $0xe,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <helloworld>:
SYSCALL(helloworld)
 352:	b8 16 00 00 00       	mov    $0x16,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <enablecount>:
SYSCALL(enablecount)
 35a:	b8 17 00 00 00       	mov    $0x17,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <disablecount>:
SYSCALL(disablecount)
 362:	b8 18 00 00 00       	mov    $0x18,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <resetcount>:
SYSCALL(resetcount)
 36a:	b8 19 00 00 00       	mov    $0x19,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <ps>:
SYSCALL(ps)
 372:	b8 1a 00 00 00       	mov    $0x1a,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <scarlet>:
SYSCALL(scarlet)
 37a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    
 382:	66 90                	xchg   %ax,%ax
 384:	66 90                	xchg   %ax,%ax
 386:	66 90                	xchg   %ax,%ax
 388:	66 90                	xchg   %ax,%ax
 38a:	66 90                	xchg   %ax,%ax
 38c:	66 90                	xchg   %ax,%ax
 38e:	66 90                	xchg   %ax,%ax

00000390 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	57                   	push   %edi
 394:	56                   	push   %esi
 395:	89 c6                	mov    %eax,%esi
 397:	53                   	push   %ebx
 398:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 39b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 39e:	85 db                	test   %ebx,%ebx
 3a0:	74 09                	je     3ab <printint+0x1b>
 3a2:	89 d0                	mov    %edx,%eax
 3a4:	c1 e8 1f             	shr    $0x1f,%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 75                	jne    420 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3ab:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3ad:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 3b4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 3b7:	31 ff                	xor    %edi,%edi
 3b9:	89 ce                	mov    %ecx,%esi
 3bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 3be:	eb 02                	jmp    3c2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 3c0:	89 cf                	mov    %ecx,%edi
 3c2:	31 d2                	xor    %edx,%edx
 3c4:	f7 f6                	div    %esi
 3c6:	8d 4f 01             	lea    0x1(%edi),%ecx
 3c9:	0f b6 92 d4 07 00 00 	movzbl 0x7d4(%edx),%edx
  }while((x /= base) != 0);
 3d0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3d2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 3d5:	75 e9                	jne    3c0 <printint+0x30>
  if(neg)
 3d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 3da:	89 c8                	mov    %ecx,%eax
 3dc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 3df:	85 d2                	test   %edx,%edx
 3e1:	74 08                	je     3eb <printint+0x5b>
    buf[i++] = '-';
 3e3:	8d 4f 02             	lea    0x2(%edi),%ecx
 3e6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 3eb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 3ee:	66 90                	xchg   %ax,%ax
 3f0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 3f5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 3f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3ff:	00 
 400:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 404:	89 34 24             	mov    %esi,(%esp)
 407:	88 45 d7             	mov    %al,-0x29(%ebp)
 40a:	e8 c3 fe ff ff       	call   2d2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 40f:	83 ff ff             	cmp    $0xffffffff,%edi
 412:	75 dc                	jne    3f0 <printint+0x60>
    putc(fd, buf[i]);
}
 414:	83 c4 4c             	add    $0x4c,%esp
 417:	5b                   	pop    %ebx
 418:	5e                   	pop    %esi
 419:	5f                   	pop    %edi
 41a:	5d                   	pop    %ebp
 41b:	c3                   	ret    
 41c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 420:	89 d0                	mov    %edx,%eax
 422:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 424:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 42b:	eb 87                	jmp    3b4 <printint+0x24>
 42d:	8d 76 00             	lea    0x0(%esi),%esi

00000430 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 434:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 436:	56                   	push   %esi
 437:	53                   	push   %ebx
 438:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 43b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 43e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 441:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 444:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 447:	0f b6 13             	movzbl (%ebx),%edx
 44a:	83 c3 01             	add    $0x1,%ebx
 44d:	84 d2                	test   %dl,%dl
 44f:	75 39                	jne    48a <printf+0x5a>
 451:	e9 c2 00 00 00       	jmp    518 <printf+0xe8>
 456:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 458:	83 fa 25             	cmp    $0x25,%edx
 45b:	0f 84 bf 00 00 00    	je     520 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 461:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 464:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 46b:	00 
 46c:	89 44 24 04          	mov    %eax,0x4(%esp)
 470:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 473:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 476:	e8 57 fe ff ff       	call   2d2 <write>
 47b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 47e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 482:	84 d2                	test   %dl,%dl
 484:	0f 84 8e 00 00 00    	je     518 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 48a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 48c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 48f:	74 c7                	je     458 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 491:	83 ff 25             	cmp    $0x25,%edi
 494:	75 e5                	jne    47b <printf+0x4b>
      if(c == 'd'){
 496:	83 fa 64             	cmp    $0x64,%edx
 499:	0f 84 31 01 00 00    	je     5d0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 49f:	25 f7 00 00 00       	and    $0xf7,%eax
 4a4:	83 f8 70             	cmp    $0x70,%eax
 4a7:	0f 84 83 00 00 00    	je     530 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4ad:	83 fa 73             	cmp    $0x73,%edx
 4b0:	0f 84 a2 00 00 00    	je     558 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 4b6:	83 fa 63             	cmp    $0x63,%edx
 4b9:	0f 84 35 01 00 00    	je     5f4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 4bf:	83 fa 25             	cmp    $0x25,%edx
 4c2:	0f 84 e0 00 00 00    	je     5a8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4c8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 4cb:	83 c3 01             	add    $0x1,%ebx
 4ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4d5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 4d6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4dc:	89 34 24             	mov    %esi,(%esp)
 4df:	89 55 d0             	mov    %edx,-0x30(%ebp)
 4e2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 4e6:	e8 e7 fd ff ff       	call   2d2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 4eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 4f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f8:	00 
 4f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fd:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 500:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 503:	e8 ca fd ff ff       	call   2d2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 508:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 50c:	84 d2                	test   %dl,%dl
 50e:	0f 85 76 ff ff ff    	jne    48a <printf+0x5a>
 514:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 518:	83 c4 3c             	add    $0x3c,%esp
 51b:	5b                   	pop    %ebx
 51c:	5e                   	pop    %esi
 51d:	5f                   	pop    %edi
 51e:	5d                   	pop    %ebp
 51f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 520:	bf 25 00 00 00       	mov    $0x25,%edi
 525:	e9 51 ff ff ff       	jmp    47b <printf+0x4b>
 52a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 530:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 533:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 538:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 53a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 541:	8b 10                	mov    (%eax),%edx
 543:	89 f0                	mov    %esi,%eax
 545:	e8 46 fe ff ff       	call   390 <printint>
        ap++;
 54a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 54e:	e9 28 ff ff ff       	jmp    47b <printf+0x4b>
 553:	90                   	nop
 554:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 558:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 55b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 55f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 561:	b8 cd 07 00 00       	mov    $0x7cd,%eax
 566:	85 ff                	test   %edi,%edi
 568:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 56b:	0f b6 07             	movzbl (%edi),%eax
 56e:	84 c0                	test   %al,%al
 570:	74 2a                	je     59c <printf+0x16c>
 572:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 578:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 57b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 57e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 581:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 588:	00 
 589:	89 44 24 04          	mov    %eax,0x4(%esp)
 58d:	89 34 24             	mov    %esi,(%esp)
 590:	e8 3d fd ff ff       	call   2d2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 595:	0f b6 07             	movzbl (%edi),%eax
 598:	84 c0                	test   %al,%al
 59a:	75 dc                	jne    578 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 59c:	31 ff                	xor    %edi,%edi
 59e:	e9 d8 fe ff ff       	jmp    47b <printf+0x4b>
 5a3:	90                   	nop
 5a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5a8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5ab:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b4:	00 
 5b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b9:	89 34 24             	mov    %esi,(%esp)
 5bc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 5c0:	e8 0d fd ff ff       	call   2d2 <write>
 5c5:	e9 b1 fe ff ff       	jmp    47b <printf+0x4b>
 5ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 5d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 5db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 5e2:	8b 10                	mov    (%eax),%edx
 5e4:	89 f0                	mov    %esi,%eax
 5e6:	e8 a5 fd ff ff       	call   390 <printint>
        ap++;
 5eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 5ef:	e9 87 fe ff ff       	jmp    47b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5f7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 5f9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5fb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 602:	00 
 603:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 606:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 609:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 60c:	89 44 24 04          	mov    %eax,0x4(%esp)
 610:	e8 bd fc ff ff       	call   2d2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 615:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 619:	e9 5d fe ff ff       	jmp    47b <printf+0x4b>
 61e:	66 90                	xchg   %ax,%ax

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 621:	a1 4c 0a 00 00       	mov    0xa4c,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 626:	89 e5                	mov    %esp,%ebp
 628:	57                   	push   %edi
 629:	56                   	push   %esi
 62a:	53                   	push   %ebx
 62b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 62e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 630:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	39 d0                	cmp    %edx,%eax
 635:	72 11                	jb     648 <free+0x28>
 637:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 638:	39 c8                	cmp    %ecx,%eax
 63a:	72 04                	jb     640 <free+0x20>
 63c:	39 ca                	cmp    %ecx,%edx
 63e:	72 10                	jb     650 <free+0x30>
 640:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 642:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 644:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 646:	73 f0                	jae    638 <free+0x18>
 648:	39 ca                	cmp    %ecx,%edx
 64a:	72 04                	jb     650 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64c:	39 c8                	cmp    %ecx,%eax
 64e:	72 f0                	jb     640 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 650:	8b 73 fc             	mov    -0x4(%ebx),%esi
 653:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 656:	39 cf                	cmp    %ecx,%edi
 658:	74 1e                	je     678 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 65a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 65d:	8b 48 04             	mov    0x4(%eax),%ecx
 660:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 663:	39 f2                	cmp    %esi,%edx
 665:	74 28                	je     68f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 667:	89 10                	mov    %edx,(%eax)
  freep = p;
 669:	a3 4c 0a 00 00       	mov    %eax,0xa4c
}
 66e:	5b                   	pop    %ebx
 66f:	5e                   	pop    %esi
 670:	5f                   	pop    %edi
 671:	5d                   	pop    %ebp
 672:	c3                   	ret    
 673:	90                   	nop
 674:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 678:	03 71 04             	add    0x4(%ecx),%esi
 67b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 67e:	8b 08                	mov    (%eax),%ecx
 680:	8b 09                	mov    (%ecx),%ecx
 682:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 685:	8b 48 04             	mov    0x4(%eax),%ecx
 688:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 68b:	39 f2                	cmp    %esi,%edx
 68d:	75 d8                	jne    667 <free+0x47>
    p->s.size += bp->s.size;
 68f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 692:	a3 4c 0a 00 00       	mov    %eax,0xa4c
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 697:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 69a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 69d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 69f:	5b                   	pop    %ebx
 6a0:	5e                   	pop    %esi
 6a1:	5f                   	pop    %edi
 6a2:	5d                   	pop    %ebp
 6a3:	c3                   	ret    
 6a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 6aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000006b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 6b0:	55                   	push   %ebp
 6b1:	89 e5                	mov    %esp,%ebp
 6b3:	57                   	push   %edi
 6b4:	56                   	push   %esi
 6b5:	53                   	push   %ebx
 6b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 6bc:	8b 1d 4c 0a 00 00    	mov    0xa4c,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6c2:	8d 48 07             	lea    0x7(%eax),%ecx
 6c5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 6c8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6ca:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 6cd:	0f 84 9b 00 00 00    	je     76e <malloc+0xbe>
 6d3:	8b 13                	mov    (%ebx),%edx
 6d5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 6d8:	39 fe                	cmp    %edi,%esi
 6da:	76 64                	jbe    740 <malloc+0x90>
 6dc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 6e3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 6e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 6eb:	eb 0e                	jmp    6fb <malloc+0x4b>
 6ed:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 6f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 6f2:	8b 78 04             	mov    0x4(%eax),%edi
 6f5:	39 fe                	cmp    %edi,%esi
 6f7:	76 4f                	jbe    748 <malloc+0x98>
 6f9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 6fb:	3b 15 4c 0a 00 00    	cmp    0xa4c,%edx
 701:	75 ed                	jne    6f0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 703:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 706:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 70c:	bf 00 10 00 00       	mov    $0x1000,%edi
 711:	0f 43 fe             	cmovae %esi,%edi
 714:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 717:	89 04 24             	mov    %eax,(%esp)
 71a:	e8 1b fc ff ff       	call   33a <sbrk>
  if(p == (char*)-1)
 71f:	83 f8 ff             	cmp    $0xffffffff,%eax
 722:	74 18                	je     73c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 724:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 727:	83 c0 08             	add    $0x8,%eax
 72a:	89 04 24             	mov    %eax,(%esp)
 72d:	e8 ee fe ff ff       	call   620 <free>
  return freep;
 732:	8b 15 4c 0a 00 00    	mov    0xa4c,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 738:	85 d2                	test   %edx,%edx
 73a:	75 b4                	jne    6f0 <malloc+0x40>
        return 0;
 73c:	31 c0                	xor    %eax,%eax
 73e:	eb 20                	jmp    760 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 740:	89 d0                	mov    %edx,%eax
 742:	89 da                	mov    %ebx,%edx
 744:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 748:	39 fe                	cmp    %edi,%esi
 74a:	74 1c                	je     768 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 74c:	29 f7                	sub    %esi,%edi
 74e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 751:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 754:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 757:	89 15 4c 0a 00 00    	mov    %edx,0xa4c
      return (void*)(p + 1);
 75d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 760:	83 c4 1c             	add    $0x1c,%esp
 763:	5b                   	pop    %ebx
 764:	5e                   	pop    %esi
 765:	5f                   	pop    %edi
 766:	5d                   	pop    %ebp
 767:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 768:	8b 08                	mov    (%eax),%ecx
 76a:	89 0a                	mov    %ecx,(%edx)
 76c:	eb e9                	jmp    757 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 76e:	c7 05 4c 0a 00 00 50 	movl   $0xa50,0xa4c
 775:	0a 00 00 
    base.s.size = 0;
 778:	ba 50 0a 00 00       	mov    $0xa50,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 77d:	c7 05 50 0a 00 00 50 	movl   $0xa50,0xa50
 784:	0a 00 00 
    base.s.size = 0;
 787:	c7 05 54 0a 00 00 00 	movl   $0x0,0xa54
 78e:	00 00 00 
 791:	e9 46 ff ff ff       	jmp    6dc <malloc+0x2c>
