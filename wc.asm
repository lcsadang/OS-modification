
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	57                   	push   %edi
   4:	56                   	push   %esi
  int fd, i;

  if(argc <= 1){
   5:	be 01 00 00 00       	mov    $0x1,%esi
  printf(1, "%d %d %d %s\n", l, w, c, name);
}

int
main(int argc, char *argv[])
{
   a:	53                   	push   %ebx
   b:	83 e4 f0             	and    $0xfffffff0,%esp
   e:	83 ec 10             	sub    $0x10,%esp
  11:	8b 45 0c             	mov    0xc(%ebp),%eax
  int fd, i;

  if(argc <= 1){
  14:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  18:	8d 58 04             	lea    0x4(%eax),%ebx
  1b:	7e 60                	jle    7d <main+0x7d>
  1d:	8d 76 00             	lea    0x0(%esi),%esi
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
  20:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  27:	00 
  28:	8b 03                	mov    (%ebx),%eax
  2a:	89 04 24             	mov    %eax,(%esp)
  2d:	e8 c0 03 00 00       	call   3f2 <open>
  32:	85 c0                	test   %eax,%eax
  34:	89 c7                	mov    %eax,%edi
  36:	78 26                	js     5e <main+0x5e>
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  38:	8b 13                	mov    (%ebx),%edx
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  3a:	83 c6 01             	add    $0x1,%esi
  3d:	83 c3 04             	add    $0x4,%ebx
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
      exit();
    }
    wc(fd, argv[i]);
  40:	89 04 24             	mov    %eax,(%esp)
  43:	89 54 24 04          	mov    %edx,0x4(%esp)
  47:	e8 54 00 00 00       	call   a0 <wc>
    close(fd);
  4c:	89 3c 24             	mov    %edi,(%esp)
  4f:	e8 86 03 00 00       	call   3da <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
  54:	3b 75 08             	cmp    0x8(%ebp),%esi
  57:	75 c7                	jne    20 <main+0x20>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
  59:	e8 54 03 00 00       	call   3b2 <exit>
    exit();
  }

  for(i = 1; i < argc; i++){
    if((fd = open(argv[i], 0)) < 0){
      printf(1, "wc: cannot open %s\n", argv[i]);
  5e:	8b 03                	mov    (%ebx),%eax
  60:	c7 44 24 04 b9 08 00 	movl   $0x8b9,0x4(%esp)
  67:	00 
  68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6f:	89 44 24 08          	mov    %eax,0x8(%esp)
  73:	e8 b8 04 00 00       	call   530 <printf>
      exit();
  78:	e8 35 03 00 00       	call   3b2 <exit>
main(int argc, char *argv[])
{
  int fd, i;

  if(argc <= 1){
    wc(0, "");
  7d:	c7 44 24 04 ab 08 00 	movl   $0x8ab,0x4(%esp)
  84:	00 
  85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8c:	e8 0f 00 00 00       	call   a0 <wc>
    exit();
  91:	e8 1c 03 00 00       	call   3b2 <exit>
  96:	66 90                	xchg   %ax,%ax
  98:	66 90                	xchg   %ax,%ax
  9a:	66 90                	xchg   %ax,%ax
  9c:	66 90                	xchg   %ax,%ax
  9e:	66 90                	xchg   %ax,%ax

000000a0 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
  a0:	55                   	push   %ebp
  a1:	89 e5                	mov    %esp,%ebp
  a3:	57                   	push   %edi
  a4:	56                   	push   %esi
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  a5:	31 f6                	xor    %esi,%esi

char buf[512];

void
wc(int fd, char *name)
{
  a7:	53                   	push   %ebx
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  a8:	31 db                	xor    %ebx,%ebx

char buf[512];

void
wc(int fd, char *name)
{
  aa:	83 ec 3c             	sub    $0x3c,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  ad:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  b4:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  bb:	90                   	nop
  bc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  ca:	00 
  cb:	c7 44 24 04 c0 0b 00 	movl   $0xbc0,0x4(%esp)
  d2:	00 
  d3:	89 04 24             	mov    %eax,(%esp)
  d6:	e8 ef 02 00 00       	call   3ca <read>
  db:	83 f8 00             	cmp    $0x0,%eax
  de:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  e1:	7e 54                	jle    137 <wc+0x97>
  e3:	31 ff                	xor    %edi,%edi
  e5:	eb 0b                	jmp    f2 <wc+0x52>
  e7:	90                   	nop
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
  e8:	31 f6                	xor    %esi,%esi
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  ea:	83 c7 01             	add    $0x1,%edi
  ed:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
  f0:	74 38                	je     12a <wc+0x8a>
      c++;
      if(buf[i] == '\n')
  f2:	0f be 87 c0 0b 00 00 	movsbl 0xbc0(%edi),%eax
        l++;
  f9:	31 c9                	xor    %ecx,%ecx
      if(strchr(" \r\t\n\v", buf[i]))
  fb:	c7 04 24 96 08 00 00 	movl   $0x896,(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 102:	3c 0a                	cmp    $0xa,%al
 104:	0f 94 c1             	sete   %cl
      if(strchr(" \r\t\n\v", buf[i]))
 107:	89 44 24 04          	mov    %eax,0x4(%esp)
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
      c++;
      if(buf[i] == '\n')
        l++;
 10b:	01 cb                	add    %ecx,%ebx
      if(strchr(" \r\t\n\v", buf[i]))
 10d:	e8 4e 01 00 00       	call   260 <strchr>
 112:	85 c0                	test   %eax,%eax
 114:	75 d2                	jne    e8 <wc+0x48>
        inword = 0;
      else if(!inword){
 116:	85 f6                	test   %esi,%esi
 118:	75 16                	jne    130 <wc+0x90>
        w++;
 11a:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 11e:	83 c7 01             	add    $0x1,%edi
 121:	3b 7d e4             	cmp    -0x1c(%ebp),%edi
        l++;
      if(strchr(" \r\t\n\v", buf[i]))
        inword = 0;
      else if(!inword){
        w++;
        inword = 1;
 124:	66 be 01 00          	mov    $0x1,%si
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
 128:	75 c8                	jne    f2 <wc+0x52>
 12a:	01 7d dc             	add    %edi,-0x24(%ebp)
 12d:	eb 91                	jmp    c0 <wc+0x20>
 12f:	90                   	nop
 130:	be 01 00 00 00       	mov    $0x1,%esi
 135:	eb b3                	jmp    ea <wc+0x4a>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
 137:	75 35                	jne    16e <wc+0xce>
    printf(1, "wc: read error\n");
    exit();
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	89 5c 24 08          	mov    %ebx,0x8(%esp)
 140:	c7 44 24 04 ac 08 00 	movl   $0x8ac,0x4(%esp)
 147:	00 
 148:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14f:	89 44 24 14          	mov    %eax,0x14(%esp)
 153:	8b 45 dc             	mov    -0x24(%ebp),%eax
 156:	89 44 24 10          	mov    %eax,0x10(%esp)
 15a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 15d:	89 44 24 0c          	mov    %eax,0xc(%esp)
 161:	e8 ca 03 00 00       	call   530 <printf>
}
 166:	83 c4 3c             	add    $0x3c,%esp
 169:	5b                   	pop    %ebx
 16a:	5e                   	pop    %esi
 16b:	5f                   	pop    %edi
 16c:	5d                   	pop    %ebp
 16d:	c3                   	ret    
        inword = 1;
      }
    }
  }
  if(n < 0){
    printf(1, "wc: read error\n");
 16e:	c7 44 24 04 9c 08 00 	movl   $0x89c,0x4(%esp)
 175:	00 
 176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17d:	e8 ae 03 00 00       	call   530 <printf>
    exit();
 182:	e8 2b 02 00 00       	call   3b2 <exit>
 187:	66 90                	xchg   %ax,%ax
 189:	66 90                	xchg   %ax,%ax
 18b:	66 90                	xchg   %ax,%ax
 18d:	66 90                	xchg   %ax,%ax
 18f:	90                   	nop

00000190 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 199:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
 19a:	89 c2                	mov    %eax,%edx
 19c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
 1a0:	83 c1 01             	add    $0x1,%ecx
 1a3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
 1a7:	83 c2 01             	add    $0x1,%edx
 1aa:	84 db                	test   %bl,%bl
 1ac:	88 5a ff             	mov    %bl,-0x1(%edx)
 1af:	75 ef                	jne    1a0 <strcpy+0x10>
    ;
  return os;
}
 1b1:	5b                   	pop    %ebx
 1b2:	5d                   	pop    %ebp
 1b3:	c3                   	ret    
 1b4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1ba:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000001c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c0:	55                   	push   %ebp
 1c1:	89 e5                	mov    %esp,%ebp
 1c3:	8b 55 08             	mov    0x8(%ebp),%edx
 1c6:	53                   	push   %ebx
 1c7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
 1ca:	0f b6 02             	movzbl (%edx),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	74 2d                	je     1fe <strcmp+0x3e>
 1d1:	0f b6 19             	movzbl (%ecx),%ebx
 1d4:	38 d8                	cmp    %bl,%al
 1d6:	74 0e                	je     1e6 <strcmp+0x26>
 1d8:	eb 2b                	jmp    205 <strcmp+0x45>
 1da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 1e0:	38 c8                	cmp    %cl,%al
 1e2:	75 15                	jne    1f9 <strcmp+0x39>
    p++, q++;
 1e4:	89 d9                	mov    %ebx,%ecx
 1e6:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e9:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
 1ec:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1ef:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
 1f3:	84 c0                	test   %al,%al
 1f5:	75 e9                	jne    1e0 <strcmp+0x20>
 1f7:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1f9:	29 c8                	sub    %ecx,%eax
}
 1fb:	5b                   	pop    %ebx
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    
 1fe:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 201:	31 c0                	xor    %eax,%eax
 203:	eb f4                	jmp    1f9 <strcmp+0x39>
 205:	0f b6 cb             	movzbl %bl,%ecx
 208:	eb ef                	jmp    1f9 <strcmp+0x39>
 20a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000210 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
 216:	80 39 00             	cmpb   $0x0,(%ecx)
 219:	74 12                	je     22d <strlen+0x1d>
 21b:	31 d2                	xor    %edx,%edx
 21d:	8d 76 00             	lea    0x0(%esi),%esi
 220:	83 c2 01             	add    $0x1,%edx
 223:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
 227:	89 d0                	mov    %edx,%eax
 229:	75 f5                	jne    220 <strlen+0x10>
    ;
  return n;
}
 22b:	5d                   	pop    %ebp
 22c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
 22d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
 22f:	5d                   	pop    %ebp
 230:	c3                   	ret    
 231:	eb 0d                	jmp    240 <memset>
 233:	90                   	nop
 234:	90                   	nop
 235:	90                   	nop
 236:	90                   	nop
 237:	90                   	nop
 238:	90                   	nop
 239:	90                   	nop
 23a:	90                   	nop
 23b:	90                   	nop
 23c:	90                   	nop
 23d:	90                   	nop
 23e:	90                   	nop
 23f:	90                   	nop

00000240 <memset>:

void*
memset(void *dst, int c, uint n)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
 243:	8b 55 08             	mov    0x8(%ebp),%edx
 246:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
 247:	8b 4d 10             	mov    0x10(%ebp),%ecx
 24a:	8b 45 0c             	mov    0xc(%ebp),%eax
 24d:	89 d7                	mov    %edx,%edi
 24f:	fc                   	cld    
 250:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
 252:	89 d0                	mov    %edx,%eax
 254:	5f                   	pop    %edi
 255:	5d                   	pop    %ebp
 256:	c3                   	ret    
 257:	89 f6                	mov    %esi,%esi
 259:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000260 <strchr>:

char*
strchr(const char *s, char c)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	53                   	push   %ebx
 267:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
 26a:	0f b6 18             	movzbl (%eax),%ebx
 26d:	84 db                	test   %bl,%bl
 26f:	74 1d                	je     28e <strchr+0x2e>
    if(*s == c)
 271:	38 d3                	cmp    %dl,%bl
 273:	89 d1                	mov    %edx,%ecx
 275:	75 0d                	jne    284 <strchr+0x24>
 277:	eb 17                	jmp    290 <strchr+0x30>
 279:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
 280:	38 ca                	cmp    %cl,%dl
 282:	74 0c                	je     290 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 284:	83 c0 01             	add    $0x1,%eax
 287:	0f b6 10             	movzbl (%eax),%edx
 28a:	84 d2                	test   %dl,%dl
 28c:	75 f2                	jne    280 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
 28e:	31 c0                	xor    %eax,%eax
}
 290:	5b                   	pop    %ebx
 291:	5d                   	pop    %ebp
 292:	c3                   	ret    
 293:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 299:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000002a0 <gets>:

char*
gets(char *buf, int max)
{
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	57                   	push   %edi
 2a4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
 2a7:	53                   	push   %ebx
 2a8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
 2ab:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ae:	eb 31                	jmp    2e1 <gets+0x41>
    cc = read(0, &c, 1);
 2b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2b7:	00 
 2b8:	89 7c 24 04          	mov    %edi,0x4(%esp)
 2bc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2c3:	e8 02 01 00 00       	call   3ca <read>
    if(cc < 1)
 2c8:	85 c0                	test   %eax,%eax
 2ca:	7e 1d                	jle    2e9 <gets+0x49>
      break;
    buf[i++] = c;
 2cc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d0:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2d2:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
 2d5:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
 2d7:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
 2db:	74 0c                	je     2e9 <gets+0x49>
 2dd:	3c 0a                	cmp    $0xa,%al
 2df:	74 08                	je     2e9 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e1:	8d 5e 01             	lea    0x1(%esi),%ebx
 2e4:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
 2e7:	7c c7                	jl     2b0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
 2f0:	83 c4 2c             	add    $0x2c,%esp
 2f3:	5b                   	pop    %ebx
 2f4:	5e                   	pop    %esi
 2f5:	5f                   	pop    %edi
 2f6:	5d                   	pop    %ebp
 2f7:	c3                   	ret    
 2f8:	90                   	nop
 2f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000300 <stat>:

int
stat(const char *n, struct stat *st)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	56                   	push   %esi
 304:	53                   	push   %ebx
 305:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 312:	00 
 313:	89 04 24             	mov    %eax,(%esp)
 316:	e8 d7 00 00 00       	call   3f2 <open>
  if(fd < 0)
 31b:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 31d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
 31f:	78 27                	js     348 <stat+0x48>
    return -1;
  r = fstat(fd, st);
 321:	8b 45 0c             	mov    0xc(%ebp),%eax
 324:	89 1c 24             	mov    %ebx,(%esp)
 327:	89 44 24 04          	mov    %eax,0x4(%esp)
 32b:	e8 da 00 00 00       	call   40a <fstat>
  close(fd);
 330:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
 333:	89 c6                	mov    %eax,%esi
  close(fd);
 335:	e8 a0 00 00 00       	call   3da <close>
  return r;
 33a:	89 f0                	mov    %esi,%eax
}
 33c:	83 c4 10             	add    $0x10,%esp
 33f:	5b                   	pop    %ebx
 340:	5e                   	pop    %esi
 341:	5d                   	pop    %ebp
 342:	c3                   	ret    
 343:	90                   	nop
 344:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
 348:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 34d:	eb ed                	jmp    33c <stat+0x3c>
 34f:	90                   	nop

00000350 <atoi>:
  return r;
}

int
atoi(const char *s)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	8b 4d 08             	mov    0x8(%ebp),%ecx
 356:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 357:	0f be 11             	movsbl (%ecx),%edx
 35a:	8d 42 d0             	lea    -0x30(%edx),%eax
 35d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
 35f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
 364:	77 17                	ja     37d <atoi+0x2d>
 366:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
 368:	83 c1 01             	add    $0x1,%ecx
 36b:	8d 04 80             	lea    (%eax,%eax,4),%eax
 36e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 372:	0f be 11             	movsbl (%ecx),%edx
 375:	8d 5a d0             	lea    -0x30(%edx),%ebx
 378:	80 fb 09             	cmp    $0x9,%bl
 37b:	76 eb                	jbe    368 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
 37d:	5b                   	pop    %ebx
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
 380:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 381:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
 383:	89 e5                	mov    %esp,%ebp
 385:	56                   	push   %esi
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	53                   	push   %ebx
 38a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 38d:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 390:	85 db                	test   %ebx,%ebx
 392:	7e 12                	jle    3a6 <memmove+0x26>
 394:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
 398:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
 39c:	88 0c 10             	mov    %cl,(%eax,%edx,1)
 39f:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a2:	39 da                	cmp    %ebx,%edx
 3a4:	75 f2                	jne    398 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
 3a6:	5b                   	pop    %ebx
 3a7:	5e                   	pop    %esi
 3a8:	5d                   	pop    %ebp
 3a9:	c3                   	ret    

000003aa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3aa:	b8 01 00 00 00       	mov    $0x1,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <exit>:
SYSCALL(exit)
 3b2:	b8 02 00 00 00       	mov    $0x2,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <wait>:
SYSCALL(wait)
 3ba:	b8 03 00 00 00       	mov    $0x3,%eax
 3bf:	cd 40                	int    $0x40
 3c1:	c3                   	ret    

000003c2 <pipe>:
SYSCALL(pipe)
 3c2:	b8 04 00 00 00       	mov    $0x4,%eax
 3c7:	cd 40                	int    $0x40
 3c9:	c3                   	ret    

000003ca <read>:
SYSCALL(read)
 3ca:	b8 05 00 00 00       	mov    $0x5,%eax
 3cf:	cd 40                	int    $0x40
 3d1:	c3                   	ret    

000003d2 <write>:
SYSCALL(write)
 3d2:	b8 10 00 00 00       	mov    $0x10,%eax
 3d7:	cd 40                	int    $0x40
 3d9:	c3                   	ret    

000003da <close>:
SYSCALL(close)
 3da:	b8 15 00 00 00       	mov    $0x15,%eax
 3df:	cd 40                	int    $0x40
 3e1:	c3                   	ret    

000003e2 <kill>:
SYSCALL(kill)
 3e2:	b8 06 00 00 00       	mov    $0x6,%eax
 3e7:	cd 40                	int    $0x40
 3e9:	c3                   	ret    

000003ea <exec>:
SYSCALL(exec)
 3ea:	b8 07 00 00 00       	mov    $0x7,%eax
 3ef:	cd 40                	int    $0x40
 3f1:	c3                   	ret    

000003f2 <open>:
SYSCALL(open)
 3f2:	b8 0f 00 00 00       	mov    $0xf,%eax
 3f7:	cd 40                	int    $0x40
 3f9:	c3                   	ret    

000003fa <mknod>:
SYSCALL(mknod)
 3fa:	b8 11 00 00 00       	mov    $0x11,%eax
 3ff:	cd 40                	int    $0x40
 401:	c3                   	ret    

00000402 <unlink>:
SYSCALL(unlink)
 402:	b8 12 00 00 00       	mov    $0x12,%eax
 407:	cd 40                	int    $0x40
 409:	c3                   	ret    

0000040a <fstat>:
SYSCALL(fstat)
 40a:	b8 08 00 00 00       	mov    $0x8,%eax
 40f:	cd 40                	int    $0x40
 411:	c3                   	ret    

00000412 <link>:
SYSCALL(link)
 412:	b8 13 00 00 00       	mov    $0x13,%eax
 417:	cd 40                	int    $0x40
 419:	c3                   	ret    

0000041a <mkdir>:
SYSCALL(mkdir)
 41a:	b8 14 00 00 00       	mov    $0x14,%eax
 41f:	cd 40                	int    $0x40
 421:	c3                   	ret    

00000422 <chdir>:
SYSCALL(chdir)
 422:	b8 09 00 00 00       	mov    $0x9,%eax
 427:	cd 40                	int    $0x40
 429:	c3                   	ret    

0000042a <dup>:
SYSCALL(dup)
 42a:	b8 0a 00 00 00       	mov    $0xa,%eax
 42f:	cd 40                	int    $0x40
 431:	c3                   	ret    

00000432 <getpid>:
SYSCALL(getpid)
 432:	b8 0b 00 00 00       	mov    $0xb,%eax
 437:	cd 40                	int    $0x40
 439:	c3                   	ret    

0000043a <sbrk>:
SYSCALL(sbrk)
 43a:	b8 0c 00 00 00       	mov    $0xc,%eax
 43f:	cd 40                	int    $0x40
 441:	c3                   	ret    

00000442 <sleep>:
SYSCALL(sleep)
 442:	b8 0d 00 00 00       	mov    $0xd,%eax
 447:	cd 40                	int    $0x40
 449:	c3                   	ret    

0000044a <uptime>:
SYSCALL(uptime)
 44a:	b8 0e 00 00 00       	mov    $0xe,%eax
 44f:	cd 40                	int    $0x40
 451:	c3                   	ret    

00000452 <helloworld>:
SYSCALL(helloworld)
 452:	b8 16 00 00 00       	mov    $0x16,%eax
 457:	cd 40                	int    $0x40
 459:	c3                   	ret    

0000045a <enablecount>:
SYSCALL(enablecount)
 45a:	b8 17 00 00 00       	mov    $0x17,%eax
 45f:	cd 40                	int    $0x40
 461:	c3                   	ret    

00000462 <disablecount>:
SYSCALL(disablecount)
 462:	b8 18 00 00 00       	mov    $0x18,%eax
 467:	cd 40                	int    $0x40
 469:	c3                   	ret    

0000046a <resetcount>:
SYSCALL(resetcount)
 46a:	b8 19 00 00 00       	mov    $0x19,%eax
 46f:	cd 40                	int    $0x40
 471:	c3                   	ret    

00000472 <ps>:
SYSCALL(ps)
 472:	b8 1a 00 00 00       	mov    $0x1a,%eax
 477:	cd 40                	int    $0x40
 479:	c3                   	ret    

0000047a <scarlet>:
SYSCALL(scarlet)
 47a:	b8 1b 00 00 00       	mov    $0x1b,%eax
 47f:	cd 40                	int    $0x40
 481:	c3                   	ret    
 482:	66 90                	xchg   %ax,%ax
 484:	66 90                	xchg   %ax,%ax
 486:	66 90                	xchg   %ax,%ax
 488:	66 90                	xchg   %ax,%ax
 48a:	66 90                	xchg   %ax,%ax
 48c:	66 90                	xchg   %ax,%ax
 48e:	66 90                	xchg   %ax,%ax

00000490 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
 490:	55                   	push   %ebp
 491:	89 e5                	mov    %esp,%ebp
 493:	57                   	push   %edi
 494:	56                   	push   %esi
 495:	89 c6                	mov    %eax,%esi
 497:	53                   	push   %ebx
 498:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 49b:	8b 5d 08             	mov    0x8(%ebp),%ebx
 49e:	85 db                	test   %ebx,%ebx
 4a0:	74 09                	je     4ab <printint+0x1b>
 4a2:	89 d0                	mov    %edx,%eax
 4a4:	c1 e8 1f             	shr    $0x1f,%eax
 4a7:	84 c0                	test   %al,%al
 4a9:	75 75                	jne    520 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4ab:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4ad:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
 4b4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
 4b7:	31 ff                	xor    %edi,%edi
 4b9:	89 ce                	mov    %ecx,%esi
 4bb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
 4be:	eb 02                	jmp    4c2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
 4c0:	89 cf                	mov    %ecx,%edi
 4c2:	31 d2                	xor    %edx,%edx
 4c4:	f7 f6                	div    %esi
 4c6:	8d 4f 01             	lea    0x1(%edi),%ecx
 4c9:	0f b6 92 d4 08 00 00 	movzbl 0x8d4(%edx),%edx
  }while((x /= base) != 0);
 4d0:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4d2:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
 4d5:	75 e9                	jne    4c0 <printint+0x30>
  if(neg)
 4d7:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
 4da:	89 c8                	mov    %ecx,%eax
 4dc:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
 4df:	85 d2                	test   %edx,%edx
 4e1:	74 08                	je     4eb <printint+0x5b>
    buf[i++] = '-';
 4e3:	8d 4f 02             	lea    0x2(%edi),%ecx
 4e6:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
 4eb:	8d 79 ff             	lea    -0x1(%ecx),%edi
 4ee:	66 90                	xchg   %ax,%ax
 4f0:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
 4f5:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 4f8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4ff:	00 
 500:	89 5c 24 04          	mov    %ebx,0x4(%esp)
 504:	89 34 24             	mov    %esi,(%esp)
 507:	88 45 d7             	mov    %al,-0x29(%ebp)
 50a:	e8 c3 fe ff ff       	call   3d2 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 50f:	83 ff ff             	cmp    $0xffffffff,%edi
 512:	75 dc                	jne    4f0 <printint+0x60>
    putc(fd, buf[i]);
}
 514:	83 c4 4c             	add    $0x4c,%esp
 517:	5b                   	pop    %ebx
 518:	5e                   	pop    %esi
 519:	5f                   	pop    %edi
 51a:	5d                   	pop    %ebp
 51b:	c3                   	ret    
 51c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
 520:	89 d0                	mov    %edx,%eax
 522:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
 524:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
 52b:	eb 87                	jmp    4b4 <printint+0x24>
 52d:	8d 76 00             	lea    0x0(%esi),%esi

00000530 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 534:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 536:	56                   	push   %esi
 537:	53                   	push   %ebx
 538:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 53b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 53e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
 541:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
 544:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
 547:	0f b6 13             	movzbl (%ebx),%edx
 54a:	83 c3 01             	add    $0x1,%ebx
 54d:	84 d2                	test   %dl,%dl
 54f:	75 39                	jne    58a <printf+0x5a>
 551:	e9 c2 00 00 00       	jmp    618 <printf+0xe8>
 556:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
 558:	83 fa 25             	cmp    $0x25,%edx
 55b:	0f 84 bf 00 00 00    	je     620 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 561:	8d 45 e2             	lea    -0x1e(%ebp),%eax
 564:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 56b:	00 
 56c:	89 44 24 04          	mov    %eax,0x4(%esp)
 570:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
 573:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 576:	e8 57 fe ff ff       	call   3d2 <write>
 57b:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 57e:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 582:	84 d2                	test   %dl,%dl
 584:	0f 84 8e 00 00 00    	je     618 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
 58a:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
 58c:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
 58f:	74 c7                	je     558 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
 591:	83 ff 25             	cmp    $0x25,%edi
 594:	75 e5                	jne    57b <printf+0x4b>
      if(c == 'd'){
 596:	83 fa 64             	cmp    $0x64,%edx
 599:	0f 84 31 01 00 00    	je     6d0 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 59f:	25 f7 00 00 00       	and    $0xf7,%eax
 5a4:	83 f8 70             	cmp    $0x70,%eax
 5a7:	0f 84 83 00 00 00    	je     630 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5ad:	83 fa 73             	cmp    $0x73,%edx
 5b0:	0f 84 a2 00 00 00    	je     658 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b6:	83 fa 63             	cmp    $0x63,%edx
 5b9:	0f 84 35 01 00 00    	je     6f4 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
 5bf:	83 fa 25             	cmp    $0x25,%edx
 5c2:	0f 84 e0 00 00 00    	je     6a8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5c8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
 5cb:	83 c3 01             	add    $0x1,%ebx
 5ce:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d5:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 5d6:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dc:	89 34 24             	mov    %esi,(%esp)
 5df:	89 55 d0             	mov    %edx,-0x30(%ebp)
 5e2:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
 5e6:	e8 e7 fd ff ff       	call   3d2 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 5eb:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 5ee:	8d 45 e7             	lea    -0x19(%ebp),%eax
 5f1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5f8:	00 
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
 600:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 603:	e8 ca fd ff ff       	call   3d2 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 608:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
 60c:	84 d2                	test   %dl,%dl
 60e:	0f 85 76 ff ff ff    	jne    58a <printf+0x5a>
 614:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 618:	83 c4 3c             	add    $0x3c,%esp
 61b:	5b                   	pop    %ebx
 61c:	5e                   	pop    %esi
 61d:	5f                   	pop    %edi
 61e:	5d                   	pop    %ebp
 61f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
 620:	bf 25 00 00 00       	mov    $0x25,%edi
 625:	e9 51 ff ff ff       	jmp    57b <printf+0x4b>
 62a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 630:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 633:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 638:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
 63a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 641:	8b 10                	mov    (%eax),%edx
 643:	89 f0                	mov    %esi,%eax
 645:	e8 46 fe ff ff       	call   490 <printint>
        ap++;
 64a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 64e:	e9 28 ff ff ff       	jmp    57b <printf+0x4b>
 653:	90                   	nop
 654:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
 658:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
 65b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
 65f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
 661:	b8 cd 08 00 00       	mov    $0x8cd,%eax
 666:	85 ff                	test   %edi,%edi
 668:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
 66b:	0f b6 07             	movzbl (%edi),%eax
 66e:	84 c0                	test   %al,%al
 670:	74 2a                	je     69c <printf+0x16c>
 672:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 678:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 67b:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
 67e:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 681:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 688:	00 
 689:	89 44 24 04          	mov    %eax,0x4(%esp)
 68d:	89 34 24             	mov    %esi,(%esp)
 690:	e8 3d fd ff ff       	call   3d2 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 695:	0f b6 07             	movzbl (%edi),%eax
 698:	84 c0                	test   %al,%al
 69a:	75 dc                	jne    678 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 69c:	31 ff                	xor    %edi,%edi
 69e:	e9 d8 fe ff ff       	jmp    57b <printf+0x4b>
 6a3:	90                   	nop
 6a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6a8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6ab:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6ad:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b4:	00 
 6b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b9:	89 34 24             	mov    %esi,(%esp)
 6bc:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
 6c0:	e8 0d fd ff ff       	call   3d2 <write>
 6c5:	e9 b1 fe ff ff       	jmp    57b <printf+0x4b>
 6ca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6d0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 6d3:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6d8:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
 6db:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 6e2:	8b 10                	mov    (%eax),%edx
 6e4:	89 f0                	mov    %esi,%eax
 6e6:	e8 a5 fd ff ff       	call   490 <printint>
        ap++;
 6eb:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 6ef:	e9 87 fe ff ff       	jmp    57b <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6f4:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
 6f7:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 6f9:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 6fb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 702:	00 
 703:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
 706:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
 709:	8d 45 e4             	lea    -0x1c(%ebp),%eax
 70c:	89 44 24 04          	mov    %eax,0x4(%esp)
 710:	e8 bd fc ff ff       	call   3d2 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
 715:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
 719:	e9 5d fe ff ff       	jmp    57b <printf+0x4b>
 71e:	66 90                	xchg   %ax,%ax

00000720 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 720:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 721:	a1 a0 0b 00 00       	mov    0xba0,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
 726:	89 e5                	mov    %esp,%ebp
 728:	57                   	push   %edi
 729:	56                   	push   %esi
 72a:	53                   	push   %ebx
 72b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
 730:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 733:	39 d0                	cmp    %edx,%eax
 735:	72 11                	jb     748 <free+0x28>
 737:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 738:	39 c8                	cmp    %ecx,%eax
 73a:	72 04                	jb     740 <free+0x20>
 73c:	39 ca                	cmp    %ecx,%edx
 73e:	72 10                	jb     750 <free+0x30>
 740:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 742:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 744:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 746:	73 f0                	jae    738 <free+0x18>
 748:	39 ca                	cmp    %ecx,%edx
 74a:	72 04                	jb     750 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 74c:	39 c8                	cmp    %ecx,%eax
 74e:	72 f0                	jb     740 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
 750:	8b 73 fc             	mov    -0x4(%ebx),%esi
 753:	8d 3c f2             	lea    (%edx,%esi,8),%edi
 756:	39 cf                	cmp    %ecx,%edi
 758:	74 1e                	je     778 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
 75a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
 75d:	8b 48 04             	mov    0x4(%eax),%ecx
 760:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 763:	39 f2                	cmp    %esi,%edx
 765:	74 28                	je     78f <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
 767:	89 10                	mov    %edx,(%eax)
  freep = p;
 769:	a3 a0 0b 00 00       	mov    %eax,0xba0
}
 76e:	5b                   	pop    %ebx
 76f:	5e                   	pop    %esi
 770:	5f                   	pop    %edi
 771:	5d                   	pop    %ebp
 772:	c3                   	ret    
 773:	90                   	nop
 774:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
 778:	03 71 04             	add    0x4(%ecx),%esi
 77b:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
 77e:	8b 08                	mov    (%eax),%ecx
 780:	8b 09                	mov    (%ecx),%ecx
 782:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
 785:	8b 48 04             	mov    0x4(%eax),%ecx
 788:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
 78b:	39 f2                	cmp    %esi,%edx
 78d:	75 d8                	jne    767 <free+0x47>
    p->s.size += bp->s.size;
 78f:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
 792:	a3 a0 0b 00 00       	mov    %eax,0xba0
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
 797:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79a:	8b 53 f8             	mov    -0x8(%ebx),%edx
 79d:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
 79f:	5b                   	pop    %ebx
 7a0:	5e                   	pop    %esi
 7a1:	5f                   	pop    %edi
 7a2:	5d                   	pop    %ebp
 7a3:	c3                   	ret    
 7a4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
 7aa:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000007b0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
 7b0:	55                   	push   %ebp
 7b1:	89 e5                	mov    %esp,%ebp
 7b3:	57                   	push   %edi
 7b4:	56                   	push   %esi
 7b5:	53                   	push   %ebx
 7b6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
 7bc:	8b 1d a0 0b 00 00    	mov    0xba0,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7c2:	8d 48 07             	lea    0x7(%eax),%ecx
 7c5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
 7c8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7ca:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
 7cd:	0f 84 9b 00 00 00    	je     86e <malloc+0xbe>
 7d3:	8b 13                	mov    (%ebx),%edx
 7d5:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 7d8:	39 fe                	cmp    %edi,%esi
 7da:	76 64                	jbe    840 <malloc+0x90>
 7dc:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 7e3:	bb 00 80 00 00       	mov    $0x8000,%ebx
 7e8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
 7eb:	eb 0e                	jmp    7fb <malloc+0x4b>
 7ed:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7f0:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
 7f2:	8b 78 04             	mov    0x4(%eax),%edi
 7f5:	39 fe                	cmp    %edi,%esi
 7f7:	76 4f                	jbe    848 <malloc+0x98>
 7f9:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
 7fb:	3b 15 a0 0b 00 00    	cmp    0xba0,%edx
 801:	75 ed                	jne    7f0 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
 803:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 806:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
 80c:	bf 00 10 00 00       	mov    $0x1000,%edi
 811:	0f 43 fe             	cmovae %esi,%edi
 814:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
 817:	89 04 24             	mov    %eax,(%esp)
 81a:	e8 1b fc ff ff       	call   43a <sbrk>
  if(p == (char*)-1)
 81f:	83 f8 ff             	cmp    $0xffffffff,%eax
 822:	74 18                	je     83c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
 824:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
 827:	83 c0 08             	add    $0x8,%eax
 82a:	89 04 24             	mov    %eax,(%esp)
 82d:	e8 ee fe ff ff       	call   720 <free>
  return freep;
 832:	8b 15 a0 0b 00 00    	mov    0xba0,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
 838:	85 d2                	test   %edx,%edx
 83a:	75 b4                	jne    7f0 <malloc+0x40>
        return 0;
 83c:	31 c0                	xor    %eax,%eax
 83e:	eb 20                	jmp    860 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
 840:	89 d0                	mov    %edx,%eax
 842:	89 da                	mov    %ebx,%edx
 844:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
 848:	39 fe                	cmp    %edi,%esi
 84a:	74 1c                	je     868 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
 84c:	29 f7                	sub    %esi,%edi
 84e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
 851:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
 854:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
 857:	89 15 a0 0b 00 00    	mov    %edx,0xba0
      return (void*)(p + 1);
 85d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
 860:	83 c4 1c             	add    $0x1c,%esp
 863:	5b                   	pop    %ebx
 864:	5e                   	pop    %esi
 865:	5f                   	pop    %edi
 866:	5d                   	pop    %ebp
 867:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
 868:	8b 08                	mov    (%eax),%ecx
 86a:	89 0a                	mov    %ecx,(%edx)
 86c:	eb e9                	jmp    857 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 86e:	c7 05 a0 0b 00 00 a4 	movl   $0xba4,0xba0
 875:	0b 00 00 
    base.s.size = 0;
 878:	ba a4 0b 00 00       	mov    $0xba4,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
 87d:	c7 05 a4 0b 00 00 a4 	movl   $0xba4,0xba4
 884:	0b 00 00 
    base.s.size = 0;
 887:	c7 05 a8 0b 00 00 00 	movl   $0x0,0xba8
 88e:	00 00 00 
 891:	e9 46 ff ff ff       	jmp    7dc <malloc+0x2c>
