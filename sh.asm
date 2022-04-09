
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	56                   	push   %esi
       4:	53                   	push   %ebx
       5:	83 e4 f0             	and    $0xfffffff0,%esp
       8:	83 ec 30             	sub    $0x30,%esp
  static char buf[100];
  int fd, i, counter = 0, s;
  char savedstring[20] = "";
       b:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
      12:	00 
      13:	c7 44 24 20 00 00 00 	movl   $0x0,0x20(%esp)
      1a:	00 
      1b:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
      22:	00 
      23:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
      2a:	00 
      2b:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
      32:	00 

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      33:	eb 0c                	jmp    41 <main+0x41>
      35:	8d 76 00             	lea    0x0(%esi),%esi
    if(fd >= 3){
      38:	83 f8 02             	cmp    $0x2,%eax
      3b:	0f 8f 65 02 00 00    	jg     2a6 <main+0x2a6>
  static char buf[100];
  int fd, i, counter = 0, s;
  char savedstring[20] = "";

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      41:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
      48:	00 
      49:	c7 04 24 69 15 00 00 	movl   $0x1569,(%esp)
      50:	e8 cd 0f 00 00       	call   1022 <open>
      55:	85 c0                	test   %eax,%eax
      57:	79 df                	jns    38 <main+0x38>
                s = s + 1;
        }
        if(s >= (strlen(buf) - 1)){
                continue;
        }
        counter = 0;
      59:	31 db                	xor    %ebx,%ebx
      5b:	eb 2e                	jmp    8b <main+0x8b>
      5d:	8d 76 00             	lea    0x0(%esi),%esi
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(buf[0] == 's' && buf[1] == 'a' && buf[2] == 'v' && buf[3] == 'e' && buf[4] == 'm' && buf[5] == 's' && buf[6] == 'g'){
      60:	3c 73                	cmp    $0x73,%al
      62:	0f 84 a0 00 00 00    	je     108 <main+0x108>
                savedstring[i] = buf[i + s];
                i = i + 1;
        }
        continue;
        }
    if(buf[0] == 'd' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 'p' && buf[4] == 'l' && buf[5] == 'a' && buf[6] == 'y' && buf[7] == 'm' && buf[8] == 's' && buf[9] == 'g'){
      68:	3c 64                	cmp    $0x64,%al
      6a:	75 0d                	jne    79 <main+0x79>
      6c:	80 3d 81 1b 00 00 69 	cmpb   $0x69,0x1b81
      73:	0f 84 6f 01 00 00    	je     1e8 <main+0x1e8>
	}
	counter = counter + 1;
	printf(1, ">>> %s <%d>\n", savedstring, counter);
	continue;
	}
    if(fork1() == 0)
      79:	e8 12 03 00 00       	call   390 <fork1>
      7e:	85 c0                	test   %eax,%eax
      80:	0f 84 2f 02 00 00    	je     2b5 <main+0x2b5>
      runcmd(parsecmd(buf));
    wait();
      86:	e8 5f 0f 00 00       	call   fea <wait>
      break;
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
      8b:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
      92:	00 
      93:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
      9a:	e8 61 02 00 00       	call   300 <getcmd>
      9f:	85 c0                	test   %eax,%eax
      a1:	0f 88 fa 01 00 00    	js     2a1 <main+0x2a1>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a7:	0f b6 05 80 1b 00 00 	movzbl 0x1b80,%eax
      ae:	3c 63                	cmp    $0x63,%al
      b0:	75 ae                	jne    60 <main+0x60>
      b2:	80 3d 81 1b 00 00 64 	cmpb   $0x64,0x1b81
      b9:	75 be                	jne    79 <main+0x79>
      bb:	80 3d 82 1b 00 00 20 	cmpb   $0x20,0x1b82
      c2:	75 b5                	jne    79 <main+0x79>
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      c4:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
      cb:	e8 70 0d 00 00       	call   e40 <strlen>
      if(chdir(buf+3) < 0)
      d0:	c7 04 24 83 1b 00 00 	movl   $0x1b83,(%esp)

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      // Chdir must be called by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      d7:	c6 80 7f 1b 00 00 00 	movb   $0x0,0x1b7f(%eax)
      if(chdir(buf+3) < 0)
      de:	e8 6f 0f 00 00       	call   1052 <chdir>
      e3:	85 c0                	test   %eax,%eax
      e5:	79 a4                	jns    8b <main+0x8b>
        printf(2, "cannot cd %s\n", buf+3);
      e7:	c7 44 24 08 83 1b 00 	movl   $0x1b83,0x8(%esp)
      ee:	00 
      ef:	c7 44 24 04 71 15 00 	movl   $0x1571,0x4(%esp)
      f6:	00 
      f7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
      fe:	e8 5d 10 00 00       	call   1160 <printf>
     103:	eb 86                	jmp    8b <main+0x8b>
     105:	8d 76 00             	lea    0x0(%esi),%esi
      continue;
    }
    if(buf[0] == 's' && buf[1] == 'a' && buf[2] == 'v' && buf[3] == 'e' && buf[4] == 'm' && buf[5] == 's' && buf[6] == 'g'){
     108:	80 3d 81 1b 00 00 61 	cmpb   $0x61,0x1b81
     10f:	0f 85 64 ff ff ff    	jne    79 <main+0x79>
     115:	80 3d 82 1b 00 00 76 	cmpb   $0x76,0x1b82
     11c:	0f 85 57 ff ff ff    	jne    79 <main+0x79>
     122:	80 3d 83 1b 00 00 65 	cmpb   $0x65,0x1b83
     129:	0f 85 4a ff ff ff    	jne    79 <main+0x79>
     12f:	80 3d 84 1b 00 00 6d 	cmpb   $0x6d,0x1b84
     136:	0f 85 3d ff ff ff    	jne    79 <main+0x79>
     13c:	80 3d 85 1b 00 00 73 	cmpb   $0x73,0x1b85
     143:	0f 85 30 ff ff ff    	jne    79 <main+0x79>
     149:	80 3d 86 1b 00 00 67 	cmpb   $0x67,0x1b86
     150:	0f 85 23 ff ff ff    	jne    79 <main+0x79>
      buf[strlen(buf)-1] = 0;  // chop \n
     156:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
     15d:	e8 de 0c 00 00       	call   e40 <strlen>
        if(strlen(buf) <= 8 || buf[7] != ' '){
     162:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(buf[0] == 's' && buf[1] == 'a' && buf[2] == 'v' && buf[3] == 'e' && buf[4] == 'm' && buf[5] == 's' && buf[6] == 'g'){
      buf[strlen(buf)-1] = 0;  // chop \n
     169:	c6 80 7f 1b 00 00 00 	movb   $0x0,0x1b7f(%eax)
        if(strlen(buf) <= 8 || buf[7] != ' '){
     170:	e8 cb 0c 00 00       	call   e40 <strlen>
     175:	83 f8 08             	cmp    $0x8,%eax
     178:	0f 86 0d ff ff ff    	jbe    8b <main+0x8b>
     17e:	80 3d 87 1b 00 00 20 	cmpb   $0x20,0x1b87
     185:	be 08 00 00 00       	mov    $0x8,%esi
     18a:	0f 85 fb fe ff ff    	jne    8b <main+0x8b>
     190:	eb 03                	jmp    195 <main+0x195>
                continue;
        }
        i = 0;
        s = 8;
        while(buf[i + s] == ' '){
                s = s + 1;
     192:	83 c6 01             	add    $0x1,%esi
        if(strlen(buf) <= 8 || buf[7] != ' '){
                continue;
        }
        i = 0;
        s = 8;
        while(buf[i + s] == ' '){
     195:	80 be 80 1b 00 00 20 	cmpb   $0x20,0x1b80(%esi)
     19c:	74 f4                	je     192 <main+0x192>
                s = s + 1;
        }
        if(s >= (strlen(buf) - 1)){
     19e:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
     1a5:	e8 96 0c 00 00       	call   e40 <strlen>
     1aa:	83 e8 01             	sub    $0x1,%eax
     1ad:	39 c6                	cmp    %eax,%esi
     1af:	0f 83 d6 fe ff ff    	jae    8b <main+0x8b>
     1b5:	31 db                	xor    %ebx,%ebx
                continue;
        }
        counter = 0;
        while((i < (strlen(buf)-1)) && i < 20){
     1b7:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
     1be:	e8 7d 0c 00 00       	call   e40 <strlen>
     1c3:	83 e8 01             	sub    $0x1,%eax
     1c6:	39 c3                	cmp    %eax,%ebx
     1c8:	0f 83 8b fe ff ff    	jae    59 <main+0x59>
     1ce:	83 fb 14             	cmp    $0x14,%ebx
     1d1:	0f 84 1a 01 00 00    	je     2f1 <main+0x2f1>
                savedstring[i] = buf[i + s];
     1d7:	0f b6 84 1e 80 1b 00 	movzbl 0x1b80(%esi,%ebx,1),%eax
     1de:	00 
                i = i + 1;
     1df:	83 c3 01             	add    $0x1,%ebx
        if(s >= (strlen(buf) - 1)){
                continue;
        }
        counter = 0;
        while((i < (strlen(buf)-1)) && i < 20){
                savedstring[i] = buf[i + s];
     1e2:	88 44 1c 1b          	mov    %al,0x1b(%esp,%ebx,1)
     1e6:	eb cf                	jmp    1b7 <main+0x1b7>
                i = i + 1;
        }
        continue;
        }
    if(buf[0] == 'd' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 'p' && buf[4] == 'l' && buf[5] == 'a' && buf[6] == 'y' && buf[7] == 'm' && buf[8] == 's' && buf[9] == 'g'){
     1e8:	80 3d 82 1b 00 00 73 	cmpb   $0x73,0x1b82
     1ef:	0f 85 84 fe ff ff    	jne    79 <main+0x79>
     1f5:	80 3d 83 1b 00 00 70 	cmpb   $0x70,0x1b83
     1fc:	0f 85 77 fe ff ff    	jne    79 <main+0x79>
     202:	80 3d 84 1b 00 00 6c 	cmpb   $0x6c,0x1b84
     209:	0f 85 6a fe ff ff    	jne    79 <main+0x79>
     20f:	80 3d 85 1b 00 00 61 	cmpb   $0x61,0x1b85
     216:	0f 85 5d fe ff ff    	jne    79 <main+0x79>
     21c:	80 3d 86 1b 00 00 79 	cmpb   $0x79,0x1b86
     223:	0f 85 50 fe ff ff    	jne    79 <main+0x79>
     229:	80 3d 87 1b 00 00 6d 	cmpb   $0x6d,0x1b87
     230:	0f 85 43 fe ff ff    	jne    79 <main+0x79>
     236:	80 3d 88 1b 00 00 73 	cmpb   $0x73,0x1b88
     23d:	0f 85 36 fe ff ff    	jne    79 <main+0x79>
     243:	80 3d 89 1b 00 00 67 	cmpb   $0x67,0x1b89
     24a:	0f 85 29 fe ff ff    	jne    79 <main+0x79>
      buf[strlen(buf)-1] = 0;  // chop \n{
     250:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
     257:	e8 e4 0b 00 00       	call   e40 <strlen>
        if(strlen(buf) > 10){
     25c:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
                i = i + 1;
        }
        continue;
        }
    if(buf[0] == 'd' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 'p' && buf[4] == 'l' && buf[5] == 'a' && buf[6] == 'y' && buf[7] == 'm' && buf[8] == 's' && buf[9] == 'g'){
      buf[strlen(buf)-1] = 0;  // chop \n{
     263:	c6 80 7f 1b 00 00 00 	movb   $0x0,0x1b7f(%eax)
        if(strlen(buf) > 10){
     26a:	e8 d1 0b 00 00       	call   e40 <strlen>
     26f:	83 f8 0a             	cmp    $0xa,%eax
     272:	0f 87 13 fe ff ff    	ja     8b <main+0x8b>
                continue;
	}
        if(strlen(savedstring) < 1){
     278:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     27c:	89 04 24             	mov    %eax,(%esp)
     27f:	e8 bc 0b 00 00       	call   e40 <strlen>
     284:	85 c0                	test   %eax,%eax
     286:	75 41                	jne    2c9 <main+0x2c9>
		printf(1, ">>> Nothing to display\n");
     288:	c7 44 24 04 7f 15 00 	movl   $0x157f,0x4(%esp)
     28f:	00 
     290:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     297:	e8 c4 0e 00 00       	call   1160 <printf>
		continue;
     29c:	e9 ea fd ff ff       	jmp    8b <main+0x8b>
	}
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
     2a1:	e8 3c 0d 00 00       	call   fe2 <exit>
  char savedstring[20] = "";

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
     2a6:	89 04 24             	mov    %eax,(%esp)
     2a9:	e8 5c 0d 00 00       	call   100a <close>
     2ae:	66 90                	xchg   %ax,%ax
      break;
     2b0:	e9 a4 fd ff ff       	jmp    59 <main+0x59>
	counter = counter + 1;
	printf(1, ">>> %s <%d>\n", savedstring, counter);
	continue;
	}
    if(fork1() == 0)
      runcmd(parsecmd(buf));
     2b5:	c7 04 24 80 1b 00 00 	movl   $0x1b80,(%esp)
     2bc:	e8 7f 0a 00 00       	call   d40 <parsecmd>
     2c1:	89 04 24             	mov    %eax,(%esp)
     2c4:	e8 e7 00 00 00       	call   3b0 <runcmd>
	}
        if(strlen(savedstring) < 1){
		printf(1, ">>> Nothing to display\n");
		continue;
	}
	counter = counter + 1;
     2c9:	83 c3 01             	add    $0x1,%ebx
	printf(1, ">>> %s <%d>\n", savedstring, counter);
     2cc:	8d 44 24 1c          	lea    0x1c(%esp),%eax
     2d0:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     2d4:	89 44 24 08          	mov    %eax,0x8(%esp)
     2d8:	c7 44 24 04 97 15 00 	movl   $0x1597,0x4(%esp)
     2df:	00 
     2e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2e7:	e8 74 0e 00 00       	call   1160 <printf>
	continue;
     2ec:	e9 9a fd ff ff       	jmp    8b <main+0x8b>
                s = s + 1;
        }
        if(s >= (strlen(buf) - 1)){
                continue;
        }
        counter = 0;
     2f1:	30 db                	xor    %bl,%bl
     2f3:	e9 93 fd ff ff       	jmp    8b <main+0x8b>
     2f8:	66 90                	xchg   %ax,%ax
     2fa:	66 90                	xchg   %ax,%ax
     2fc:	66 90                	xchg   %ax,%ax
     2fe:	66 90                	xchg   %ax,%ax

00000300 <getcmd>:
  exit();
}

int
getcmd(char *buf, int nbuf)
{
     300:	55                   	push   %ebp
     301:	89 e5                	mov    %esp,%ebp
     303:	56                   	push   %esi
     304:	53                   	push   %ebx
     305:	83 ec 10             	sub    $0x10,%esp
     308:	8b 5d 08             	mov    0x8(%ebp),%ebx
     30b:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     30e:	c7 44 24 04 c8 14 00 	movl   $0x14c8,0x4(%esp)
     315:	00 
     316:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     31d:	e8 3e 0e 00 00       	call   1160 <printf>
  memset(buf, 0, nbuf);
     322:	89 74 24 08          	mov    %esi,0x8(%esp)
     326:	89 1c 24             	mov    %ebx,(%esp)
     329:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     330:	00 
     331:	e8 3a 0b 00 00       	call   e70 <memset>
  gets(buf, nbuf);
     336:	89 74 24 04          	mov    %esi,0x4(%esp)
     33a:	89 1c 24             	mov    %ebx,(%esp)
     33d:	e8 8e 0b 00 00       	call   ed0 <gets>
  if(buf[0] == 0) // EOF
     342:	31 c0                	xor    %eax,%eax
     344:	80 3b 00             	cmpb   $0x0,(%ebx)
     347:	0f 94 c0             	sete   %al
    return -1;
  return 0;
}
     34a:	83 c4 10             	add    $0x10,%esp
     34d:	5b                   	pop    %ebx
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
     34e:	f7 d8                	neg    %eax
    return -1;
  return 0;
}
     350:	5e                   	pop    %esi
     351:	5d                   	pop    %ebp
     352:	c3                   	ret    
     353:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     359:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000360 <panic>:
  exit();
}

void
panic(char *s)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	83 ec 18             	sub    $0x18,%esp
  printf(2, "%s\n", s);
     366:	8b 45 08             	mov    0x8(%ebp),%eax
     369:	c7 44 24 04 65 15 00 	movl   $0x1565,0x4(%esp)
     370:	00 
     371:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     378:	89 44 24 08          	mov    %eax,0x8(%esp)
     37c:	e8 df 0d 00 00       	call   1160 <printf>
  exit();
     381:	e8 5c 0c 00 00       	call   fe2 <exit>
     386:	8d 76 00             	lea    0x0(%esi),%esi
     389:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000390 <fork1>:
}

int
fork1(void)
{
     390:	55                   	push   %ebp
     391:	89 e5                	mov    %esp,%ebp
     393:	83 ec 18             	sub    $0x18,%esp
  int pid;

  pid = fork();
     396:	e8 3f 0c 00 00       	call   fda <fork>
  if(pid == -1)
     39b:	83 f8 ff             	cmp    $0xffffffff,%eax
     39e:	74 02                	je     3a2 <fork1+0x12>
    panic("fork");
  return pid;
}
     3a0:	c9                   	leave  
     3a1:	c3                   	ret    
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
     3a2:	c7 04 24 cb 14 00 00 	movl   $0x14cb,(%esp)
     3a9:	e8 b2 ff ff ff       	call   360 <panic>
     3ae:	66 90                	xchg   %ax,%ax

000003b0 <runcmd>:
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
     3b0:	55                   	push   %ebp
     3b1:	89 e5                	mov    %esp,%ebp
     3b3:	53                   	push   %ebx
     3b4:	83 ec 24             	sub    $0x24,%esp
     3b7:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     3ba:	85 db                	test   %ebx,%ebx
     3bc:	74 5f                	je     41d <runcmd+0x6d>
    exit();

  switch(cmd->type){
     3be:	83 3b 05             	cmpl   $0x5,(%ebx)
     3c1:	0f 87 e7 00 00 00    	ja     4ae <runcmd+0xfe>
     3c7:	8b 03                	mov    (%ebx),%eax
     3c9:	ff 24 85 a4 15 00 00 	jmp    *0x15a4(,%eax,4)
    runcmd(lcmd->right);
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
     3d0:	8d 45 f0             	lea    -0x10(%ebp),%eax
     3d3:	89 04 24             	mov    %eax,(%esp)
     3d6:	e8 17 0c 00 00       	call   ff2 <pipe>
     3db:	85 c0                	test   %eax,%eax
     3dd:	0f 88 d7 00 00 00    	js     4ba <runcmd+0x10a>
      panic("pipe");
    if(fork1() == 0){
     3e3:	e8 a8 ff ff ff       	call   390 <fork1>
     3e8:	85 c0                	test   %eax,%eax
     3ea:	0f 84 2e 01 00 00    	je     51e <runcmd+0x16e>
      dup(p[1]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
     3f0:	e8 9b ff ff ff       	call   390 <fork1>
     3f5:	85 c0                	test   %eax,%eax
     3f7:	0f 84 e9 00 00 00    	je     4e6 <runcmd+0x136>
      dup(p[0]);
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->right);
    }
    close(p[0]);
     3fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     400:	89 04 24             	mov    %eax,(%esp)
     403:	e8 02 0c 00 00       	call   100a <close>
    close(p[1]);
     408:	8b 45 f4             	mov    -0xc(%ebp),%eax
     40b:	89 04 24             	mov    %eax,(%esp)
     40e:	e8 f7 0b 00 00       	call   100a <close>
    wait();
     413:	e8 d2 0b 00 00       	call   fea <wait>
    wait();
     418:	e8 cd 0b 00 00       	call   fea <wait>
     41d:	8d 76 00             	lea    0x0(%esi),%esi
  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
      exit();
     420:	e8 bd 0b 00 00       	call   fe2 <exit>
    wait();
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
     425:	e8 66 ff ff ff       	call   390 <fork1>
     42a:	85 c0                	test   %eax,%eax
     42c:	75 ef                	jne    41d <runcmd+0x6d>
     42e:	66 90                	xchg   %ax,%ax
     430:	eb 71                	jmp    4a3 <runcmd+0xf3>
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
     432:	8b 43 04             	mov    0x4(%ebx),%eax
     435:	85 c0                	test   %eax,%eax
     437:	74 e4                	je     41d <runcmd+0x6d>
      exit();
    exec(ecmd->argv[0], ecmd->argv);
     439:	8d 53 04             	lea    0x4(%ebx),%edx
     43c:	89 54 24 04          	mov    %edx,0x4(%esp)
     440:	89 04 24             	mov    %eax,(%esp)
     443:	e8 d2 0b 00 00       	call   101a <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     448:	8b 43 04             	mov    0x4(%ebx),%eax
     44b:	c7 44 24 04 d7 14 00 	movl   $0x14d7,0x4(%esp)
     452:	00 
     453:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     45a:	89 44 24 08          	mov    %eax,0x8(%esp)
     45e:	e8 fd 0c 00 00       	call   1160 <printf>
    break;
     463:	eb b8                	jmp    41d <runcmd+0x6d>
    runcmd(rcmd->cmd);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    if(fork1() == 0)
     465:	e8 26 ff ff ff       	call   390 <fork1>
     46a:	85 c0                	test   %eax,%eax
     46c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     470:	74 31                	je     4a3 <runcmd+0xf3>
      runcmd(lcmd->left);
    wait();
     472:	e8 73 0b 00 00       	call   fea <wait>
    runcmd(lcmd->right);
     477:	8b 43 08             	mov    0x8(%ebx),%eax
     47a:	89 04 24             	mov    %eax,(%esp)
     47d:	e8 2e ff ff ff       	call   3b0 <runcmd>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
     482:	8b 43 14             	mov    0x14(%ebx),%eax
     485:	89 04 24             	mov    %eax,(%esp)
     488:	e8 7d 0b 00 00       	call   100a <close>
    if(open(rcmd->file, rcmd->mode) < 0){
     48d:	8b 43 10             	mov    0x10(%ebx),%eax
     490:	89 44 24 04          	mov    %eax,0x4(%esp)
     494:	8b 43 08             	mov    0x8(%ebx),%eax
     497:	89 04 24             	mov    %eax,(%esp)
     49a:	e8 83 0b 00 00       	call   1022 <open>
     49f:	85 c0                	test   %eax,%eax
     4a1:	78 23                	js     4c6 <runcmd+0x116>
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    if(fork1() == 0)
      runcmd(bcmd->cmd);
     4a3:	8b 43 04             	mov    0x4(%ebx),%eax
     4a6:	89 04 24             	mov    %eax,(%esp)
     4a9:	e8 02 ff ff ff       	call   3b0 <runcmd>
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");
     4ae:	c7 04 24 d0 14 00 00 	movl   $0x14d0,(%esp)
     4b5:	e8 a6 fe ff ff       	call   360 <panic>
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
     4ba:	c7 04 24 f7 14 00 00 	movl   $0x14f7,(%esp)
     4c1:	e8 9a fe ff ff       	call   360 <panic>

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    close(rcmd->fd);
    if(open(rcmd->file, rcmd->mode) < 0){
      printf(2, "open %s failed\n", rcmd->file);
     4c6:	8b 43 08             	mov    0x8(%ebx),%eax
     4c9:	c7 44 24 04 e7 14 00 	movl   $0x14e7,0x4(%esp)
     4d0:	00 
     4d1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     4d8:	89 44 24 08          	mov    %eax,0x8(%esp)
     4dc:	e8 7f 0c 00 00       	call   1160 <printf>
     4e1:	e9 37 ff ff ff       	jmp    41d <runcmd+0x6d>
      close(p[0]);
      close(p[1]);
      runcmd(pcmd->left);
    }
    if(fork1() == 0){
      close(0);
     4e6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     4ed:	e8 18 0b 00 00       	call   100a <close>
      dup(p[0]);
     4f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4f5:	89 04 24             	mov    %eax,(%esp)
     4f8:	e8 5d 0b 00 00       	call   105a <dup>
      close(p[0]);
     4fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
     500:	89 04 24             	mov    %eax,(%esp)
     503:	e8 02 0b 00 00       	call   100a <close>
      close(p[1]);
     508:	8b 45 f4             	mov    -0xc(%ebp),%eax
     50b:	89 04 24             	mov    %eax,(%esp)
     50e:	e8 f7 0a 00 00       	call   100a <close>
      runcmd(pcmd->right);
     513:	8b 43 08             	mov    0x8(%ebx),%eax
     516:	89 04 24             	mov    %eax,(%esp)
     519:	e8 92 fe ff ff       	call   3b0 <runcmd>
  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    if(pipe(p) < 0)
      panic("pipe");
    if(fork1() == 0){
      close(1);
     51e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     525:	e8 e0 0a 00 00       	call   100a <close>
      dup(p[1]);
     52a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     52d:	89 04 24             	mov    %eax,(%esp)
     530:	e8 25 0b 00 00       	call   105a <dup>
      close(p[0]);
     535:	8b 45 f0             	mov    -0x10(%ebp),%eax
     538:	89 04 24             	mov    %eax,(%esp)
     53b:	e8 ca 0a 00 00       	call   100a <close>
      close(p[1]);
     540:	8b 45 f4             	mov    -0xc(%ebp),%eax
     543:	89 04 24             	mov    %eax,(%esp)
     546:	e8 bf 0a 00 00       	call   100a <close>
      runcmd(pcmd->left);
     54b:	8b 43 04             	mov    0x4(%ebx),%eax
     54e:	89 04 24             	mov    %eax,(%esp)
     551:	e8 5a fe ff ff       	call   3b0 <runcmd>
     556:	8d 76 00             	lea    0x0(%esi),%esi
     559:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000560 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     560:	55                   	push   %ebp
     561:	89 e5                	mov    %esp,%ebp
     563:	53                   	push   %ebx
     564:	83 ec 14             	sub    $0x14,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     567:	c7 04 24 54 00 00 00 	movl   $0x54,(%esp)
     56e:	e8 6d 0e 00 00       	call   13e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     573:	c7 44 24 08 54 00 00 	movl   $0x54,0x8(%esp)
     57a:	00 
     57b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     582:	00 
struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     583:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     585:	89 04 24             	mov    %eax,(%esp)
     588:	e8 e3 08 00 00       	call   e70 <memset>
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}
     58d:	89 d8                	mov    %ebx,%eax
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
     58f:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     595:	83 c4 14             	add    $0x14,%esp
     598:	5b                   	pop    %ebx
     599:	5d                   	pop    %ebp
     59a:	c3                   	ret    
     59b:	90                   	nop
     59c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000005a0 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     5a0:	55                   	push   %ebp
     5a1:	89 e5                	mov    %esp,%ebp
     5a3:	53                   	push   %ebx
     5a4:	83 ec 14             	sub    $0x14,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5a7:	c7 04 24 18 00 00 00 	movl   $0x18,(%esp)
     5ae:	e8 2d 0e 00 00       	call   13e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     5b3:	c7 44 24 08 18 00 00 	movl   $0x18,0x8(%esp)
     5ba:	00 
     5bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     5c2:	00 
     5c3:	89 04 24             	mov    %eax,(%esp)
struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     5c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     5c8:	e8 a3 08 00 00       	call   e70 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     5cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
     5d0:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     5d6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     5d9:	8b 45 0c             	mov    0xc(%ebp),%eax
     5dc:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     5df:	8b 45 10             	mov    0x10(%ebp),%eax
     5e2:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     5e5:	8b 45 14             	mov    0x14(%ebp),%eax
     5e8:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     5eb:	8b 45 18             	mov    0x18(%ebp),%eax
     5ee:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     5f1:	83 c4 14             	add    $0x14,%esp
     5f4:	89 d8                	mov    %ebx,%eax
     5f6:	5b                   	pop    %ebx
     5f7:	5d                   	pop    %ebp
     5f8:	c3                   	ret    
     5f9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000600 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	53                   	push   %ebx
     604:	83 ec 14             	sub    $0x14,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     607:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     60e:	e8 cd 0d 00 00       	call   13e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     613:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     61a:	00 
     61b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     622:	00 
     623:	89 04 24             	mov    %eax,(%esp)
struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     626:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     628:	e8 43 08 00 00       	call   e70 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     62d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
     630:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     636:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     639:	8b 45 0c             	mov    0xc(%ebp),%eax
     63c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     63f:	83 c4 14             	add    $0x14,%esp
     642:	89 d8                	mov    %ebx,%eax
     644:	5b                   	pop    %ebx
     645:	5d                   	pop    %ebp
     646:	c3                   	ret    
     647:	89 f6                	mov    %esi,%esi
     649:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000650 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     650:	55                   	push   %ebp
     651:	89 e5                	mov    %esp,%ebp
     653:	53                   	push   %ebx
     654:	83 ec 14             	sub    $0x14,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     657:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
     65e:	e8 7d 0d 00 00       	call   13e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     663:	c7 44 24 08 0c 00 00 	movl   $0xc,0x8(%esp)
     66a:	00 
     66b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     672:	00 
     673:	89 04 24             	mov    %eax,(%esp)
struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     676:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     678:	e8 f3 07 00 00       	call   e70 <memset>
  cmd->type = LIST;
  cmd->left = left;
     67d:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
     680:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     686:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     689:	8b 45 0c             	mov    0xc(%ebp),%eax
     68c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     68f:	83 c4 14             	add    $0x14,%esp
     692:	89 d8                	mov    %ebx,%eax
     694:	5b                   	pop    %ebx
     695:	5d                   	pop    %ebp
     696:	c3                   	ret    
     697:	89 f6                	mov    %esi,%esi
     699:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

000006a0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     6a0:	55                   	push   %ebp
     6a1:	89 e5                	mov    %esp,%ebp
     6a3:	53                   	push   %ebx
     6a4:	83 ec 14             	sub    $0x14,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6a7:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     6ae:	e8 2d 0d 00 00       	call   13e0 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6b3:	c7 44 24 08 08 00 00 	movl   $0x8,0x8(%esp)
     6ba:	00 
     6bb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     6c2:	00 
     6c3:	89 04 24             	mov    %eax,(%esp)
struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     6c6:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     6c8:	e8 a3 07 00 00       	call   e70 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     6cd:	8b 45 08             	mov    0x8(%ebp),%eax
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
     6d0:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     6d6:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     6d9:	83 c4 14             	add    $0x14,%esp
     6dc:	89 d8                	mov    %ebx,%eax
     6de:	5b                   	pop    %ebx
     6df:	5d                   	pop    %ebp
     6e0:	c3                   	ret    
     6e1:	eb 0d                	jmp    6f0 <gettoken>
     6e3:	90                   	nop
     6e4:	90                   	nop
     6e5:	90                   	nop
     6e6:	90                   	nop
     6e7:	90                   	nop
     6e8:	90                   	nop
     6e9:	90                   	nop
     6ea:	90                   	nop
     6eb:	90                   	nop
     6ec:	90                   	nop
     6ed:	90                   	nop
     6ee:	90                   	nop
     6ef:	90                   	nop

000006f0 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     6f0:	55                   	push   %ebp
     6f1:	89 e5                	mov    %esp,%ebp
     6f3:	57                   	push   %edi
     6f4:	56                   	push   %esi
     6f5:	53                   	push   %ebx
     6f6:	83 ec 1c             	sub    $0x1c,%esp
  char *s;
  int ret;

  s = *ps;
     6f9:	8b 45 08             	mov    0x8(%ebp),%eax
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     6fc:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     6ff:	8b 75 10             	mov    0x10(%ebp),%esi
  char *s;
  int ret;

  s = *ps;
     702:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     704:	39 df                	cmp    %ebx,%edi
     706:	72 0f                	jb     717 <gettoken+0x27>
     708:	eb 24                	jmp    72e <gettoken+0x3e>
     70a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     710:	83 c7 01             	add    $0x1,%edi
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     713:	39 df                	cmp    %ebx,%edi
     715:	74 17                	je     72e <gettoken+0x3e>
     717:	0f be 07             	movsbl (%edi),%eax
     71a:	c7 04 24 78 1b 00 00 	movl   $0x1b78,(%esp)
     721:	89 44 24 04          	mov    %eax,0x4(%esp)
     725:	e8 66 07 00 00       	call   e90 <strchr>
     72a:	85 c0                	test   %eax,%eax
     72c:	75 e2                	jne    710 <gettoken+0x20>
    s++;
  if(q)
     72e:	85 f6                	test   %esi,%esi
     730:	74 02                	je     734 <gettoken+0x44>
    *q = s;
     732:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     734:	0f b6 0f             	movzbl (%edi),%ecx
     737:	0f be f1             	movsbl %cl,%esi
  switch(*s){
     73a:	80 f9 29             	cmp    $0x29,%cl
  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
     73d:	89 f0                	mov    %esi,%eax
  switch(*s){
     73f:	7f 4f                	jg     790 <gettoken+0xa0>
     741:	80 f9 28             	cmp    $0x28,%cl
     744:	7d 55                	jge    79b <gettoken+0xab>
     746:	84 c9                	test   %cl,%cl
     748:	0f 85 ca 00 00 00    	jne    818 <gettoken+0x128>
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     74e:	8b 45 14             	mov    0x14(%ebp),%eax
     751:	85 c0                	test   %eax,%eax
     753:	74 05                	je     75a <gettoken+0x6a>
    *eq = s;
     755:	8b 45 14             	mov    0x14(%ebp),%eax
     758:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     75a:	39 df                	cmp    %ebx,%edi
     75c:	72 09                	jb     767 <gettoken+0x77>
     75e:	eb 1e                	jmp    77e <gettoken+0x8e>
    s++;
     760:	83 c7 01             	add    $0x1,%edi
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
     763:	39 df                	cmp    %ebx,%edi
     765:	74 17                	je     77e <gettoken+0x8e>
     767:	0f be 07             	movsbl (%edi),%eax
     76a:	c7 04 24 78 1b 00 00 	movl   $0x1b78,(%esp)
     771:	89 44 24 04          	mov    %eax,0x4(%esp)
     775:	e8 16 07 00 00       	call   e90 <strchr>
     77a:	85 c0                	test   %eax,%eax
     77c:	75 e2                	jne    760 <gettoken+0x70>
    s++;
  *ps = s;
     77e:	8b 45 08             	mov    0x8(%ebp),%eax
     781:	89 38                	mov    %edi,(%eax)
  return ret;
}
     783:	83 c4 1c             	add    $0x1c,%esp
     786:	89 f0                	mov    %esi,%eax
     788:	5b                   	pop    %ebx
     789:	5e                   	pop    %esi
     78a:	5f                   	pop    %edi
     78b:	5d                   	pop    %ebp
     78c:	c3                   	ret    
     78d:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     790:	80 f9 3e             	cmp    $0x3e,%cl
     793:	75 0b                	jne    7a0 <gettoken+0xb0>
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
     795:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     799:	74 6d                	je     808 <gettoken+0x118>
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
     79b:	83 c7 01             	add    $0x1,%edi
     79e:	eb ae                	jmp    74e <gettoken+0x5e>
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     7a0:	7f 56                	jg     7f8 <gettoken+0x108>
     7a2:	83 e9 3b             	sub    $0x3b,%ecx
     7a5:	80 f9 01             	cmp    $0x1,%cl
     7a8:	76 f1                	jbe    79b <gettoken+0xab>
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7aa:	39 fb                	cmp    %edi,%ebx
     7ac:	77 2b                	ja     7d9 <gettoken+0xe9>
     7ae:	66 90                	xchg   %ax,%ax
     7b0:	eb 3b                	jmp    7ed <gettoken+0xfd>
     7b2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     7b8:	0f be 07             	movsbl (%edi),%eax
     7bb:	c7 04 24 70 1b 00 00 	movl   $0x1b70,(%esp)
     7c2:	89 44 24 04          	mov    %eax,0x4(%esp)
     7c6:	e8 c5 06 00 00       	call   e90 <strchr>
     7cb:	85 c0                	test   %eax,%eax
     7cd:	75 1e                	jne    7ed <gettoken+0xfd>
      s++;
     7cf:	83 c7 01             	add    $0x1,%edi
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     7d2:	39 df                	cmp    %ebx,%edi
     7d4:	74 17                	je     7ed <gettoken+0xfd>
     7d6:	0f be 07             	movsbl (%edi),%eax
     7d9:	89 44 24 04          	mov    %eax,0x4(%esp)
     7dd:	c7 04 24 78 1b 00 00 	movl   $0x1b78,(%esp)
     7e4:	e8 a7 06 00 00       	call   e90 <strchr>
     7e9:	85 c0                	test   %eax,%eax
     7eb:	74 cb                	je     7b8 <gettoken+0xc8>
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
     7ed:	be 61 00 00 00       	mov    $0x61,%esi
     7f2:	e9 57 ff ff ff       	jmp    74e <gettoken+0x5e>
     7f7:	90                   	nop
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     7f8:	80 f9 7c             	cmp    $0x7c,%cl
     7fb:	74 9e                	je     79b <gettoken+0xab>
     7fd:	8d 76 00             	lea    0x0(%esi),%esi
     800:	eb a8                	jmp    7aa <gettoken+0xba>
     802:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
     808:	83 c7 02             	add    $0x2,%edi
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
     80b:	be 2b 00 00 00       	mov    $0x2b,%esi
     810:	e9 39 ff ff ff       	jmp    74e <gettoken+0x5e>
     815:	8d 76 00             	lea    0x0(%esi),%esi
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
     818:	80 f9 26             	cmp    $0x26,%cl
     81b:	75 8d                	jne    7aa <gettoken+0xba>
     81d:	e9 79 ff ff ff       	jmp    79b <gettoken+0xab>
     822:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     829:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000830 <peek>:
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
     830:	55                   	push   %ebp
     831:	89 e5                	mov    %esp,%ebp
     833:	57                   	push   %edi
     834:	56                   	push   %esi
     835:	53                   	push   %ebx
     836:	83 ec 1c             	sub    $0x1c,%esp
     839:	8b 7d 08             	mov    0x8(%ebp),%edi
     83c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     83f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     841:	39 f3                	cmp    %esi,%ebx
     843:	72 0a                	jb     84f <peek+0x1f>
     845:	eb 1f                	jmp    866 <peek+0x36>
     847:	90                   	nop
    s++;
     848:	83 c3 01             	add    $0x1,%ebx
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
     84b:	39 f3                	cmp    %esi,%ebx
     84d:	74 17                	je     866 <peek+0x36>
     84f:	0f be 03             	movsbl (%ebx),%eax
     852:	c7 04 24 78 1b 00 00 	movl   $0x1b78,(%esp)
     859:	89 44 24 04          	mov    %eax,0x4(%esp)
     85d:	e8 2e 06 00 00       	call   e90 <strchr>
     862:	85 c0                	test   %eax,%eax
     864:	75 e2                	jne    848 <peek+0x18>
    s++;
  *ps = s;
     866:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     868:	0f be 13             	movsbl (%ebx),%edx
     86b:	31 c0                	xor    %eax,%eax
     86d:	84 d2                	test   %dl,%dl
     86f:	74 17                	je     888 <peek+0x58>
     871:	8b 45 10             	mov    0x10(%ebp),%eax
     874:	89 54 24 04          	mov    %edx,0x4(%esp)
     878:	89 04 24             	mov    %eax,(%esp)
     87b:	e8 10 06 00 00       	call   e90 <strchr>
     880:	85 c0                	test   %eax,%eax
     882:	0f 95 c0             	setne  %al
     885:	0f b6 c0             	movzbl %al,%eax
}
     888:	83 c4 1c             	add    $0x1c,%esp
     88b:	5b                   	pop    %ebx
     88c:	5e                   	pop    %esi
     88d:	5f                   	pop    %edi
     88e:	5d                   	pop    %ebp
     88f:	c3                   	ret    

00000890 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     890:	55                   	push   %ebp
     891:	89 e5                	mov    %esp,%ebp
     893:	57                   	push   %edi
     894:	56                   	push   %esi
     895:	53                   	push   %ebx
     896:	83 ec 3c             	sub    $0x3c,%esp
     899:	8b 75 0c             	mov    0xc(%ebp),%esi
     89c:	8b 5d 10             	mov    0x10(%ebp),%ebx
     89f:	90                   	nop
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     8a0:	c7 44 24 08 19 15 00 	movl   $0x1519,0x8(%esp)
     8a7:	00 
     8a8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     8ac:	89 34 24             	mov    %esi,(%esp)
     8af:	e8 7c ff ff ff       	call   830 <peek>
     8b4:	85 c0                	test   %eax,%eax
     8b6:	0f 84 9c 00 00 00    	je     958 <parseredirs+0xc8>
    tok = gettoken(ps, es, 0, 0);
     8bc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     8c3:	00 
     8c4:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     8cb:	00 
     8cc:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     8d0:	89 34 24             	mov    %esi,(%esp)
     8d3:	e8 18 fe ff ff       	call   6f0 <gettoken>
    if(gettoken(ps, es, &q, &eq) != 'a')
     8d8:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     8dc:	89 34 24             	mov    %esi,(%esp)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
     8df:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     8e1:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8e4:	89 44 24 0c          	mov    %eax,0xc(%esp)
     8e8:	8d 45 e0             	lea    -0x20(%ebp),%eax
     8eb:	89 44 24 08          	mov    %eax,0x8(%esp)
     8ef:	e8 fc fd ff ff       	call   6f0 <gettoken>
     8f4:	83 f8 61             	cmp    $0x61,%eax
     8f7:	75 6a                	jne    963 <parseredirs+0xd3>
      panic("missing file for redirection");
    switch(tok){
     8f9:	83 ff 3c             	cmp    $0x3c,%edi
     8fc:	74 42                	je     940 <parseredirs+0xb0>
     8fe:	83 ff 3e             	cmp    $0x3e,%edi
     901:	74 05                	je     908 <parseredirs+0x78>
     903:	83 ff 2b             	cmp    $0x2b,%edi
     906:	75 98                	jne    8a0 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     908:	c7 44 24 10 01 00 00 	movl   $0x1,0x10(%esp)
     90f:	00 
     910:	c7 44 24 0c 01 02 00 	movl   $0x201,0xc(%esp)
     917:	00 
     918:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     91b:	89 44 24 08          	mov    %eax,0x8(%esp)
     91f:	8b 45 e0             	mov    -0x20(%ebp),%eax
     922:	89 44 24 04          	mov    %eax,0x4(%esp)
     926:	8b 45 08             	mov    0x8(%ebp),%eax
     929:	89 04 24             	mov    %eax,(%esp)
     92c:	e8 6f fc ff ff       	call   5a0 <redircmd>
     931:	89 45 08             	mov    %eax,0x8(%ebp)
      break;
     934:	e9 67 ff ff ff       	jmp    8a0 <parseredirs+0x10>
     939:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     940:	c7 44 24 10 00 00 00 	movl   $0x0,0x10(%esp)
     947:	00 
     948:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     94f:	00 
     950:	eb c6                	jmp    918 <parseredirs+0x88>
     952:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}
     958:	8b 45 08             	mov    0x8(%ebp),%eax
     95b:	83 c4 3c             	add    $0x3c,%esp
     95e:	5b                   	pop    %ebx
     95f:	5e                   	pop    %esi
     960:	5f                   	pop    %edi
     961:	5d                   	pop    %ebp
     962:	c3                   	ret    
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
     963:	c7 04 24 fc 14 00 00 	movl   $0x14fc,(%esp)
     96a:	e8 f1 f9 ff ff       	call   360 <panic>
     96f:	90                   	nop

00000970 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     970:	55                   	push   %ebp
     971:	89 e5                	mov    %esp,%ebp
     973:	57                   	push   %edi
     974:	56                   	push   %esi
     975:	53                   	push   %ebx
     976:	83 ec 3c             	sub    $0x3c,%esp
     979:	8b 75 08             	mov    0x8(%ebp),%esi
     97c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     97f:	c7 44 24 08 1c 15 00 	movl   $0x151c,0x8(%esp)
     986:	00 
     987:	89 34 24             	mov    %esi,(%esp)
     98a:	89 7c 24 04          	mov    %edi,0x4(%esp)
     98e:	e8 9d fe ff ff       	call   830 <peek>
     993:	85 c0                	test   %eax,%eax
     995:	0f 85 a5 00 00 00    	jne    a40 <parseexec+0xd0>
    return parseblock(ps, es);

  ret = execcmd();
     99b:	e8 c0 fb ff ff       	call   560 <execcmd>
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     9a0:	89 7c 24 08          	mov    %edi,0x8(%esp)
     9a4:	89 74 24 04          	mov    %esi,0x4(%esp)
     9a8:	89 04 24             	mov    %eax,(%esp)
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
     9ab:	89 c3                	mov    %eax,%ebx
     9ad:	89 45 cc             	mov    %eax,-0x34(%ebp)
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     9b0:	e8 db fe ff ff       	call   890 <parseredirs>
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
     9b5:	c7 45 d4 00 00 00 00 	movl   $0x0,-0x2c(%ebp)
  ret = parseredirs(ret, ps, es);
     9bc:	89 45 d0             	mov    %eax,-0x30(%ebp)
  while(!peek(ps, es, "|)&;")){
     9bf:	eb 1d                	jmp    9de <parseexec+0x6e>
     9c1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     9c8:	8b 45 d0             	mov    -0x30(%ebp),%eax
     9cb:	89 7c 24 08          	mov    %edi,0x8(%esp)
     9cf:	89 74 24 04          	mov    %esi,0x4(%esp)
     9d3:	89 04 24             	mov    %eax,(%esp)
     9d6:	e8 b5 fe ff ff       	call   890 <parseredirs>
     9db:	89 45 d0             	mov    %eax,-0x30(%ebp)
  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
     9de:	c7 44 24 08 33 15 00 	movl   $0x1533,0x8(%esp)
     9e5:	00 
     9e6:	89 7c 24 04          	mov    %edi,0x4(%esp)
     9ea:	89 34 24             	mov    %esi,(%esp)
     9ed:	e8 3e fe ff ff       	call   830 <peek>
     9f2:	85 c0                	test   %eax,%eax
     9f4:	75 62                	jne    a58 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     9f6:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     9f9:	89 44 24 0c          	mov    %eax,0xc(%esp)
     9fd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     a00:	89 44 24 08          	mov    %eax,0x8(%esp)
     a04:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a08:	89 34 24             	mov    %esi,(%esp)
     a0b:	e8 e0 fc ff ff       	call   6f0 <gettoken>
     a10:	85 c0                	test   %eax,%eax
     a12:	74 44                	je     a58 <parseexec+0xe8>
      break;
    if(tok != 'a')
     a14:	83 f8 61             	cmp    $0x61,%eax
     a17:	75 61                	jne    a7a <parseexec+0x10a>
      panic("syntax");
    cmd->argv[argc] = q;
     a19:	8b 45 e0             	mov    -0x20(%ebp),%eax
     a1c:	83 c3 04             	add    $0x4,%ebx
    cmd->eargv[argc] = eq;
    argc++;
     a1f:	83 45 d4 01          	addl   $0x1,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
     a23:	89 03                	mov    %eax,(%ebx)
    cmd->eargv[argc] = eq;
     a25:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a28:	89 43 28             	mov    %eax,0x28(%ebx)
    argc++;
    if(argc >= MAXARGS)
     a2b:	83 7d d4 0a          	cmpl   $0xa,-0x2c(%ebp)
     a2f:	75 97                	jne    9c8 <parseexec+0x58>
      panic("too many args");
     a31:	c7 04 24 25 15 00 00 	movl   $0x1525,(%esp)
     a38:	e8 23 f9 ff ff       	call   360 <panic>
     a3d:	8d 76 00             	lea    0x0(%esi),%esi
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);
     a40:	89 7c 24 04          	mov    %edi,0x4(%esp)
     a44:	89 34 24             	mov    %esi,(%esp)
     a47:	e8 84 01 00 00       	call   bd0 <parseblock>
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     a4c:	83 c4 3c             	add    $0x3c,%esp
     a4f:	5b                   	pop    %ebx
     a50:	5e                   	pop    %esi
     a51:	5f                   	pop    %edi
     a52:	5d                   	pop    %ebp
     a53:	c3                   	ret    
     a54:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     a58:	8b 45 cc             	mov    -0x34(%ebp),%eax
     a5b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     a5e:	8d 04 90             	lea    (%eax,%edx,4),%eax
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
     a61:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
  cmd->eargv[argc] = 0;
     a68:	c7 40 2c 00 00 00 00 	movl   $0x0,0x2c(%eax)
  return ret;
     a6f:	8b 45 d0             	mov    -0x30(%ebp),%eax
}
     a72:	83 c4 3c             	add    $0x3c,%esp
     a75:	5b                   	pop    %ebx
     a76:	5e                   	pop    %esi
     a77:	5f                   	pop    %edi
     a78:	5d                   	pop    %ebp
     a79:	c3                   	ret    
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
     a7a:	c7 04 24 1e 15 00 00 	movl   $0x151e,(%esp)
     a81:	e8 da f8 ff ff       	call   360 <panic>
     a86:	8d 76 00             	lea    0x0(%esi),%esi
     a89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000a90 <parsepipe>:
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
     a90:	55                   	push   %ebp
     a91:	89 e5                	mov    %esp,%ebp
     a93:	57                   	push   %edi
     a94:	56                   	push   %esi
     a95:	53                   	push   %ebx
     a96:	83 ec 1c             	sub    $0x1c,%esp
     a99:	8b 5d 08             	mov    0x8(%ebp),%ebx
     a9c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     a9f:	89 1c 24             	mov    %ebx,(%esp)
     aa2:	89 74 24 04          	mov    %esi,0x4(%esp)
     aa6:	e8 c5 fe ff ff       	call   970 <parseexec>
  if(peek(ps, es, "|")){
     aab:	c7 44 24 08 38 15 00 	movl   $0x1538,0x8(%esp)
     ab2:	00 
     ab3:	89 74 24 04          	mov    %esi,0x4(%esp)
     ab7:	89 1c 24             	mov    %ebx,(%esp)
struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
     aba:	89 c7                	mov    %eax,%edi
  if(peek(ps, es, "|")){
     abc:	e8 6f fd ff ff       	call   830 <peek>
     ac1:	85 c0                	test   %eax,%eax
     ac3:	75 0b                	jne    ad0 <parsepipe+0x40>
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}
     ac5:	83 c4 1c             	add    $0x1c,%esp
     ac8:	89 f8                	mov    %edi,%eax
     aca:	5b                   	pop    %ebx
     acb:	5e                   	pop    %esi
     acc:	5f                   	pop    %edi
     acd:	5d                   	pop    %ebp
     ace:	c3                   	ret    
     acf:	90                   	nop
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
     ad0:	89 74 24 04          	mov    %esi,0x4(%esp)
     ad4:	89 1c 24             	mov    %ebx,(%esp)
     ad7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     ade:	00 
     adf:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     ae6:	00 
     ae7:	e8 04 fc ff ff       	call   6f0 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     aec:	89 74 24 04          	mov    %esi,0x4(%esp)
     af0:	89 1c 24             	mov    %ebx,(%esp)
     af3:	e8 98 ff ff ff       	call   a90 <parsepipe>
     af8:	89 7d 08             	mov    %edi,0x8(%ebp)
     afb:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     afe:	83 c4 1c             	add    $0x1c,%esp
     b01:	5b                   	pop    %ebx
     b02:	5e                   	pop    %esi
     b03:	5f                   	pop    %edi
     b04:	5d                   	pop    %ebp
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
     b05:	e9 f6 fa ff ff       	jmp    600 <pipecmd>
     b0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000b10 <parseline>:
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
     b10:	55                   	push   %ebp
     b11:	89 e5                	mov    %esp,%ebp
     b13:	57                   	push   %edi
     b14:	56                   	push   %esi
     b15:	53                   	push   %ebx
     b16:	83 ec 1c             	sub    $0x1c,%esp
     b19:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b1c:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
     b1f:	89 1c 24             	mov    %ebx,(%esp)
     b22:	89 74 24 04          	mov    %esi,0x4(%esp)
     b26:	e8 65 ff ff ff       	call   a90 <parsepipe>
     b2b:	89 c7                	mov    %eax,%edi
  while(peek(ps, es, "&")){
     b2d:	eb 27                	jmp    b56 <parseline+0x46>
     b2f:	90                   	nop
    gettoken(ps, es, 0, 0);
     b30:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b37:	00 
     b38:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     b3f:	00 
     b40:	89 74 24 04          	mov    %esi,0x4(%esp)
     b44:	89 1c 24             	mov    %ebx,(%esp)
     b47:	e8 a4 fb ff ff       	call   6f0 <gettoken>
    cmd = backcmd(cmd);
     b4c:	89 3c 24             	mov    %edi,(%esp)
     b4f:	e8 4c fb ff ff       	call   6a0 <backcmd>
     b54:	89 c7                	mov    %eax,%edi
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
     b56:	c7 44 24 08 3a 15 00 	movl   $0x153a,0x8(%esp)
     b5d:	00 
     b5e:	89 74 24 04          	mov    %esi,0x4(%esp)
     b62:	89 1c 24             	mov    %ebx,(%esp)
     b65:	e8 c6 fc ff ff       	call   830 <peek>
     b6a:	85 c0                	test   %eax,%eax
     b6c:	75 c2                	jne    b30 <parseline+0x20>
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
     b6e:	c7 44 24 08 36 15 00 	movl   $0x1536,0x8(%esp)
     b75:	00 
     b76:	89 74 24 04          	mov    %esi,0x4(%esp)
     b7a:	89 1c 24             	mov    %ebx,(%esp)
     b7d:	e8 ae fc ff ff       	call   830 <peek>
     b82:	85 c0                	test   %eax,%eax
     b84:	75 0a                	jne    b90 <parseline+0x80>
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}
     b86:	83 c4 1c             	add    $0x1c,%esp
     b89:	89 f8                	mov    %edi,%eax
     b8b:	5b                   	pop    %ebx
     b8c:	5e                   	pop    %esi
     b8d:	5f                   	pop    %edi
     b8e:	5d                   	pop    %ebp
     b8f:	c3                   	ret    
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
     b90:	89 74 24 04          	mov    %esi,0x4(%esp)
     b94:	89 1c 24             	mov    %ebx,(%esp)
     b97:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b9e:	00 
     b9f:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     ba6:	00 
     ba7:	e8 44 fb ff ff       	call   6f0 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     bac:	89 74 24 04          	mov    %esi,0x4(%esp)
     bb0:	89 1c 24             	mov    %ebx,(%esp)
     bb3:	e8 58 ff ff ff       	call   b10 <parseline>
     bb8:	89 7d 08             	mov    %edi,0x8(%ebp)
     bbb:	89 45 0c             	mov    %eax,0xc(%ebp)
  }
  return cmd;
}
     bbe:	83 c4 1c             	add    $0x1c,%esp
     bc1:	5b                   	pop    %ebx
     bc2:	5e                   	pop    %esi
     bc3:	5f                   	pop    %edi
     bc4:	5d                   	pop    %ebp
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
     bc5:	e9 86 fa ff ff       	jmp    650 <listcmd>
     bca:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000bd0 <parseblock>:
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
     bd0:	55                   	push   %ebp
     bd1:	89 e5                	mov    %esp,%ebp
     bd3:	57                   	push   %edi
     bd4:	56                   	push   %esi
     bd5:	53                   	push   %ebx
     bd6:	83 ec 1c             	sub    $0x1c,%esp
     bd9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     bdc:	8b 75 0c             	mov    0xc(%ebp),%esi
  struct cmd *cmd;

  if(!peek(ps, es, "("))
     bdf:	c7 44 24 08 1c 15 00 	movl   $0x151c,0x8(%esp)
     be6:	00 
     be7:	89 1c 24             	mov    %ebx,(%esp)
     bea:	89 74 24 04          	mov    %esi,0x4(%esp)
     bee:	e8 3d fc ff ff       	call   830 <peek>
     bf3:	85 c0                	test   %eax,%eax
     bf5:	74 76                	je     c6d <parseblock+0x9d>
    panic("parseblock");
  gettoken(ps, es, 0, 0);
     bf7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     bfe:	00 
     bff:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     c06:	00 
     c07:	89 74 24 04          	mov    %esi,0x4(%esp)
     c0b:	89 1c 24             	mov    %ebx,(%esp)
     c0e:	e8 dd fa ff ff       	call   6f0 <gettoken>
  cmd = parseline(ps, es);
     c13:	89 74 24 04          	mov    %esi,0x4(%esp)
     c17:	89 1c 24             	mov    %ebx,(%esp)
     c1a:	e8 f1 fe ff ff       	call   b10 <parseline>
  if(!peek(ps, es, ")"))
     c1f:	c7 44 24 08 58 15 00 	movl   $0x1558,0x8(%esp)
     c26:	00 
     c27:	89 74 24 04          	mov    %esi,0x4(%esp)
     c2b:	89 1c 24             	mov    %ebx,(%esp)
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
     c2e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     c30:	e8 fb fb ff ff       	call   830 <peek>
     c35:	85 c0                	test   %eax,%eax
     c37:	74 40                	je     c79 <parseblock+0xa9>
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
     c39:	89 74 24 04          	mov    %esi,0x4(%esp)
     c3d:	89 1c 24             	mov    %ebx,(%esp)
     c40:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     c47:	00 
     c48:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
     c4f:	00 
     c50:	e8 9b fa ff ff       	call   6f0 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     c55:	89 74 24 08          	mov    %esi,0x8(%esp)
     c59:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     c5d:	89 3c 24             	mov    %edi,(%esp)
     c60:	e8 2b fc ff ff       	call   890 <parseredirs>
  return cmd;
}
     c65:	83 c4 1c             	add    $0x1c,%esp
     c68:	5b                   	pop    %ebx
     c69:	5e                   	pop    %esi
     c6a:	5f                   	pop    %edi
     c6b:	5d                   	pop    %ebp
     c6c:	c3                   	ret    
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
     c6d:	c7 04 24 3c 15 00 00 	movl   $0x153c,(%esp)
     c74:	e8 e7 f6 ff ff       	call   360 <panic>
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
     c79:	c7 04 24 47 15 00 00 	movl   $0x1547,(%esp)
     c80:	e8 db f6 ff ff       	call   360 <panic>
     c85:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000c90 <nulterminate>:
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	53                   	push   %ebx
     c94:	83 ec 14             	sub    $0x14,%esp
     c97:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     c9a:	85 db                	test   %ebx,%ebx
     c9c:	0f 84 8e 00 00 00    	je     d30 <nulterminate+0xa0>
    return 0;

  switch(cmd->type){
     ca2:	83 3b 05             	cmpl   $0x5,(%ebx)
     ca5:	77 49                	ja     cf0 <nulterminate+0x60>
     ca7:	8b 03                	mov    (%ebx),%eax
     ca9:	ff 24 85 bc 15 00 00 	jmp    *0x15bc(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     cb0:	8b 43 04             	mov    0x4(%ebx),%eax
     cb3:	89 04 24             	mov    %eax,(%esp)
     cb6:	e8 d5 ff ff ff       	call   c90 <nulterminate>
    nulterminate(lcmd->right);
     cbb:	8b 43 08             	mov    0x8(%ebx),%eax
     cbe:	89 04 24             	mov    %eax,(%esp)
     cc1:	e8 ca ff ff ff       	call   c90 <nulterminate>
    break;
     cc6:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     cc8:	83 c4 14             	add    $0x14,%esp
     ccb:	5b                   	pop    %ebx
     ccc:	5d                   	pop    %ebp
     ccd:	c3                   	ret    
     cce:	66 90                	xchg   %ax,%ax
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     cd0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     cd3:	89 d8                	mov    %ebx,%eax
     cd5:	85 c9                	test   %ecx,%ecx
     cd7:	74 17                	je     cf0 <nulterminate+0x60>
     cd9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
     ce0:	8b 50 2c             	mov    0x2c(%eax),%edx
     ce3:	83 c0 04             	add    $0x4,%eax
     ce6:	c6 02 00             	movb   $0x0,(%edx)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
     ce9:	8b 50 04             	mov    0x4(%eax),%edx
     cec:	85 d2                	test   %edx,%edx
     cee:	75 f0                	jne    ce0 <nulterminate+0x50>
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     cf0:	83 c4 14             	add    $0x14,%esp
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
     cf3:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     cf5:	5b                   	pop    %ebx
     cf6:	5d                   	pop    %ebp
     cf7:	c3                   	ret    
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
     cf8:	8b 43 04             	mov    0x4(%ebx),%eax
     cfb:	89 04 24             	mov    %eax,(%esp)
     cfe:	e8 8d ff ff ff       	call   c90 <nulterminate>
    break;
  }
  return cmd;
}
     d03:	83 c4 14             	add    $0x14,%esp
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
     d06:	89 d8                	mov    %ebx,%eax
  }
  return cmd;
}
     d08:	5b                   	pop    %ebx
     d09:	5d                   	pop    %ebp
     d0a:	c3                   	ret    
     d0b:	90                   	nop
     d0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
     d10:	8b 43 04             	mov    0x4(%ebx),%eax
     d13:	89 04 24             	mov    %eax,(%esp)
     d16:	e8 75 ff ff ff       	call   c90 <nulterminate>
    *rcmd->efile = 0;
     d1b:	8b 43 0c             	mov    0xc(%ebx),%eax
     d1e:	c6 00 00             	movb   $0x0,(%eax)
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d21:	83 c4 14             	add    $0x14,%esp

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;
     d24:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     d26:	5b                   	pop    %ebx
     d27:	5d                   	pop    %ebp
     d28:	c3                   	ret    
     d29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
    return 0;
     d30:	31 c0                	xor    %eax,%eax
     d32:	eb 94                	jmp    cc8 <nulterminate+0x38>
     d34:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     d3a:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000d40 <parsecmd>:
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);

struct cmd*
parsecmd(char *s)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	56                   	push   %esi
     d44:	53                   	push   %ebx
     d45:	83 ec 10             	sub    $0x10,%esp
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
     d48:	8b 5d 08             	mov    0x8(%ebp),%ebx
     d4b:	89 1c 24             	mov    %ebx,(%esp)
     d4e:	e8 ed 00 00 00       	call   e40 <strlen>
     d53:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     d55:	8d 45 08             	lea    0x8(%ebp),%eax
     d58:	89 5c 24 04          	mov    %ebx,0x4(%esp)
     d5c:	89 04 24             	mov    %eax,(%esp)
     d5f:	e8 ac fd ff ff       	call   b10 <parseline>
  peek(&s, es, "");
     d64:	c7 44 24 08 a3 15 00 	movl   $0x15a3,0x8(%esp)
     d6b:	00 
     d6c:	89 5c 24 04          	mov    %ebx,0x4(%esp)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
     d70:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     d72:	8d 45 08             	lea    0x8(%ebp),%eax
     d75:	89 04 24             	mov    %eax,(%esp)
     d78:	e8 b3 fa ff ff       	call   830 <peek>
  if(s != es){
     d7d:	8b 45 08             	mov    0x8(%ebp),%eax
     d80:	39 d8                	cmp    %ebx,%eax
     d82:	75 11                	jne    d95 <parsecmd+0x55>
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
     d84:	89 34 24             	mov    %esi,(%esp)
     d87:	e8 04 ff ff ff       	call   c90 <nulterminate>
  return cmd;
}
     d8c:	83 c4 10             	add    $0x10,%esp
     d8f:	89 f0                	mov    %esi,%eax
     d91:	5b                   	pop    %ebx
     d92:	5e                   	pop    %esi
     d93:	5d                   	pop    %ebp
     d94:	c3                   	ret    

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
     d95:	89 44 24 08          	mov    %eax,0x8(%esp)
     d99:	c7 44 24 04 5a 15 00 	movl   $0x155a,0x4(%esp)
     da0:	00 
     da1:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
     da8:	e8 b3 03 00 00       	call   1160 <printf>
    panic("syntax");
     dad:	c7 04 24 1e 15 00 00 	movl   $0x151e,(%esp)
     db4:	e8 a7 f5 ff ff       	call   360 <panic>
     db9:	66 90                	xchg   %ax,%ax
     dbb:	66 90                	xchg   %ax,%ax
     dbd:	66 90                	xchg   %ax,%ax
     dbf:	90                   	nop

00000dc0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, const char *t)
{
     dc0:	55                   	push   %ebp
     dc1:	89 e5                	mov    %esp,%ebp
     dc3:	8b 45 08             	mov    0x8(%ebp),%eax
     dc6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     dc9:	53                   	push   %ebx
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     dca:	89 c2                	mov    %eax,%edx
     dcc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     dd0:	83 c1 01             	add    $0x1,%ecx
     dd3:	0f b6 59 ff          	movzbl -0x1(%ecx),%ebx
     dd7:	83 c2 01             	add    $0x1,%edx
     dda:	84 db                	test   %bl,%bl
     ddc:	88 5a ff             	mov    %bl,-0x1(%edx)
     ddf:	75 ef                	jne    dd0 <strcpy+0x10>
    ;
  return os;
}
     de1:	5b                   	pop    %ebx
     de2:	5d                   	pop    %ebp
     de3:	c3                   	ret    
     de4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     dea:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

00000df0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     df0:	55                   	push   %ebp
     df1:	89 e5                	mov    %esp,%ebp
     df3:	8b 55 08             	mov    0x8(%ebp),%edx
     df6:	53                   	push   %ebx
     df7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     dfa:	0f b6 02             	movzbl (%edx),%eax
     dfd:	84 c0                	test   %al,%al
     dff:	74 2d                	je     e2e <strcmp+0x3e>
     e01:	0f b6 19             	movzbl (%ecx),%ebx
     e04:	38 d8                	cmp    %bl,%al
     e06:	74 0e                	je     e16 <strcmp+0x26>
     e08:	eb 2b                	jmp    e35 <strcmp+0x45>
     e0a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     e10:	38 c8                	cmp    %cl,%al
     e12:	75 15                	jne    e29 <strcmp+0x39>
    p++, q++;
     e14:	89 d9                	mov    %ebx,%ecx
     e16:	83 c2 01             	add    $0x1,%edx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     e19:	0f b6 02             	movzbl (%edx),%eax
    p++, q++;
     e1c:	8d 59 01             	lea    0x1(%ecx),%ebx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     e1f:	0f b6 49 01          	movzbl 0x1(%ecx),%ecx
     e23:	84 c0                	test   %al,%al
     e25:	75 e9                	jne    e10 <strcmp+0x20>
     e27:	31 c0                	xor    %eax,%eax
    p++, q++;
  return (uchar)*p - (uchar)*q;
     e29:	29 c8                	sub    %ecx,%eax
}
     e2b:	5b                   	pop    %ebx
     e2c:	5d                   	pop    %ebp
     e2d:	c3                   	ret    
     e2e:	0f b6 09             	movzbl (%ecx),%ecx
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     e31:	31 c0                	xor    %eax,%eax
     e33:	eb f4                	jmp    e29 <strcmp+0x39>
     e35:	0f b6 cb             	movzbl %bl,%ecx
     e38:	eb ef                	jmp    e29 <strcmp+0x39>
     e3a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000e40 <strlen>:
  return (uchar)*p - (uchar)*q;
}

uint
strlen(const char *s)
{
     e40:	55                   	push   %ebp
     e41:	89 e5                	mov    %esp,%ebp
     e43:	8b 4d 08             	mov    0x8(%ebp),%ecx
  int n;

  for(n = 0; s[n]; n++)
     e46:	80 39 00             	cmpb   $0x0,(%ecx)
     e49:	74 12                	je     e5d <strlen+0x1d>
     e4b:	31 d2                	xor    %edx,%edx
     e4d:	8d 76 00             	lea    0x0(%esi),%esi
     e50:	83 c2 01             	add    $0x1,%edx
     e53:	80 3c 11 00          	cmpb   $0x0,(%ecx,%edx,1)
     e57:	89 d0                	mov    %edx,%eax
     e59:	75 f5                	jne    e50 <strlen+0x10>
    ;
  return n;
}
     e5b:	5d                   	pop    %ebp
     e5c:	c3                   	ret    
uint
strlen(const char *s)
{
  int n;

  for(n = 0; s[n]; n++)
     e5d:	31 c0                	xor    %eax,%eax
    ;
  return n;
}
     e5f:	5d                   	pop    %ebp
     e60:	c3                   	ret    
     e61:	eb 0d                	jmp    e70 <memset>
     e63:	90                   	nop
     e64:	90                   	nop
     e65:	90                   	nop
     e66:	90                   	nop
     e67:	90                   	nop
     e68:	90                   	nop
     e69:	90                   	nop
     e6a:	90                   	nop
     e6b:	90                   	nop
     e6c:	90                   	nop
     e6d:	90                   	nop
     e6e:	90                   	nop
     e6f:	90                   	nop

00000e70 <memset>:

void*
memset(void *dst, int c, uint n)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	8b 55 08             	mov    0x8(%ebp),%edx
     e76:	57                   	push   %edi
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     e77:	8b 4d 10             	mov    0x10(%ebp),%ecx
     e7a:	8b 45 0c             	mov    0xc(%ebp),%eax
     e7d:	89 d7                	mov    %edx,%edi
     e7f:	fc                   	cld    
     e80:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     e82:	89 d0                	mov    %edx,%eax
     e84:	5f                   	pop    %edi
     e85:	5d                   	pop    %ebp
     e86:	c3                   	ret    
     e87:	89 f6                	mov    %esi,%esi
     e89:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000e90 <strchr>:

char*
strchr(const char *s, char c)
{
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
     e93:	8b 45 08             	mov    0x8(%ebp),%eax
     e96:	53                   	push   %ebx
     e97:	8b 55 0c             	mov    0xc(%ebp),%edx
  for(; *s; s++)
     e9a:	0f b6 18             	movzbl (%eax),%ebx
     e9d:	84 db                	test   %bl,%bl
     e9f:	74 1d                	je     ebe <strchr+0x2e>
    if(*s == c)
     ea1:	38 d3                	cmp    %dl,%bl
     ea3:	89 d1                	mov    %edx,%ecx
     ea5:	75 0d                	jne    eb4 <strchr+0x24>
     ea7:	eb 17                	jmp    ec0 <strchr+0x30>
     ea9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     eb0:	38 ca                	cmp    %cl,%dl
     eb2:	74 0c                	je     ec0 <strchr+0x30>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     eb4:	83 c0 01             	add    $0x1,%eax
     eb7:	0f b6 10             	movzbl (%eax),%edx
     eba:	84 d2                	test   %dl,%dl
     ebc:	75 f2                	jne    eb0 <strchr+0x20>
    if(*s == c)
      return (char*)s;
  return 0;
     ebe:	31 c0                	xor    %eax,%eax
}
     ec0:	5b                   	pop    %ebx
     ec1:	5d                   	pop    %ebp
     ec2:	c3                   	ret    
     ec3:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
     ec9:	8d bc 27 00 00 00 00 	lea    0x0(%edi,%eiz,1),%edi

00000ed0 <gets>:

char*
gets(char *buf, int max)
{
     ed0:	55                   	push   %ebp
     ed1:	89 e5                	mov    %esp,%ebp
     ed3:	57                   	push   %edi
     ed4:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ed5:	31 f6                	xor    %esi,%esi
  return 0;
}

char*
gets(char *buf, int max)
{
     ed7:	53                   	push   %ebx
     ed8:	83 ec 2c             	sub    $0x2c,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     edb:	8d 7d e7             	lea    -0x19(%ebp),%edi
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     ede:	eb 31                	jmp    f11 <gets+0x41>
    cc = read(0, &c, 1);
     ee0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     ee7:	00 
     ee8:	89 7c 24 04          	mov    %edi,0x4(%esp)
     eec:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     ef3:	e8 02 01 00 00       	call   ffa <read>
    if(cc < 1)
     ef8:	85 c0                	test   %eax,%eax
     efa:	7e 1d                	jle    f19 <gets+0x49>
      break;
    buf[i++] = c;
     efc:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     f00:	89 de                	mov    %ebx,%esi
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     f02:	8b 55 08             	mov    0x8(%ebp),%edx
    if(c == '\n' || c == '\r')
     f05:	3c 0d                	cmp    $0xd,%al

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    buf[i++] = c;
     f07:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     f0b:	74 0c                	je     f19 <gets+0x49>
     f0d:	3c 0a                	cmp    $0xa,%al
     f0f:	74 08                	je     f19 <gets+0x49>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     f11:	8d 5e 01             	lea    0x1(%esi),%ebx
     f14:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     f17:	7c c7                	jl     ee0 <gets+0x10>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     f19:	8b 45 08             	mov    0x8(%ebp),%eax
     f1c:	c6 04 30 00          	movb   $0x0,(%eax,%esi,1)
  return buf;
}
     f20:	83 c4 2c             	add    $0x2c,%esp
     f23:	5b                   	pop    %ebx
     f24:	5e                   	pop    %esi
     f25:	5f                   	pop    %edi
     f26:	5d                   	pop    %ebp
     f27:	c3                   	ret    
     f28:	90                   	nop
     f29:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000f30 <stat>:

int
stat(const char *n, struct stat *st)
{
     f30:	55                   	push   %ebp
     f31:	89 e5                	mov    %esp,%ebp
     f33:	56                   	push   %esi
     f34:	53                   	push   %ebx
     f35:	83 ec 10             	sub    $0x10,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f38:	8b 45 08             	mov    0x8(%ebp),%eax
     f3b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     f42:	00 
     f43:	89 04 24             	mov    %eax,(%esp)
     f46:	e8 d7 00 00 00       	call   1022 <open>
  if(fd < 0)
     f4b:	85 c0                	test   %eax,%eax
stat(const char *n, struct stat *st)
{
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     f4d:	89 c3                	mov    %eax,%ebx
  if(fd < 0)
     f4f:	78 27                	js     f78 <stat+0x48>
    return -1;
  r = fstat(fd, st);
     f51:	8b 45 0c             	mov    0xc(%ebp),%eax
     f54:	89 1c 24             	mov    %ebx,(%esp)
     f57:	89 44 24 04          	mov    %eax,0x4(%esp)
     f5b:	e8 da 00 00 00       	call   103a <fstat>
  close(fd);
     f60:	89 1c 24             	mov    %ebx,(%esp)
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
  r = fstat(fd, st);
     f63:	89 c6                	mov    %eax,%esi
  close(fd);
     f65:	e8 a0 00 00 00       	call   100a <close>
  return r;
     f6a:	89 f0                	mov    %esi,%eax
}
     f6c:	83 c4 10             	add    $0x10,%esp
     f6f:	5b                   	pop    %ebx
     f70:	5e                   	pop    %esi
     f71:	5d                   	pop    %ebp
     f72:	c3                   	ret    
     f73:	90                   	nop
     f74:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  int fd;
  int r;

  fd = open(n, O_RDONLY);
  if(fd < 0)
    return -1;
     f78:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     f7d:	eb ed                	jmp    f6c <stat+0x3c>
     f7f:	90                   	nop

00000f80 <atoi>:
  return r;
}

int
atoi(const char *s)
{
     f80:	55                   	push   %ebp
     f81:	89 e5                	mov    %esp,%ebp
     f83:	8b 4d 08             	mov    0x8(%ebp),%ecx
     f86:	53                   	push   %ebx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     f87:	0f be 11             	movsbl (%ecx),%edx
     f8a:	8d 42 d0             	lea    -0x30(%edx),%eax
     f8d:	3c 09                	cmp    $0x9,%al
int
atoi(const char *s)
{
  int n;

  n = 0;
     f8f:	b8 00 00 00 00       	mov    $0x0,%eax
  while('0' <= *s && *s <= '9')
     f94:	77 17                	ja     fad <atoi+0x2d>
     f96:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     f98:	83 c1 01             	add    $0x1,%ecx
     f9b:	8d 04 80             	lea    (%eax,%eax,4),%eax
     f9e:	8d 44 42 d0          	lea    -0x30(%edx,%eax,2),%eax
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     fa2:	0f be 11             	movsbl (%ecx),%edx
     fa5:	8d 5a d0             	lea    -0x30(%edx),%ebx
     fa8:	80 fb 09             	cmp    $0x9,%bl
     fab:	76 eb                	jbe    f98 <atoi+0x18>
    n = n*10 + *s++ - '0';
  return n;
}
     fad:	5b                   	pop    %ebx
     fae:	5d                   	pop    %ebp
     faf:	c3                   	ret    

00000fb0 <memmove>:

void*
memmove(void *vdst, const void *vsrc, int n)
{
     fb0:	55                   	push   %ebp
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     fb1:	31 d2                	xor    %edx,%edx
  return n;
}

void*
memmove(void *vdst, const void *vsrc, int n)
{
     fb3:	89 e5                	mov    %esp,%ebp
     fb5:	56                   	push   %esi
     fb6:	8b 45 08             	mov    0x8(%ebp),%eax
     fb9:	53                   	push   %ebx
     fba:	8b 5d 10             	mov    0x10(%ebp),%ebx
     fbd:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     fc0:	85 db                	test   %ebx,%ebx
     fc2:	7e 12                	jle    fd6 <memmove+0x26>
     fc4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    *dst++ = *src++;
     fc8:	0f b6 0c 16          	movzbl (%esi,%edx,1),%ecx
     fcc:	88 0c 10             	mov    %cl,(%eax,%edx,1)
     fcf:	83 c2 01             	add    $0x1,%edx
  char *dst;
  const char *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     fd2:	39 da                	cmp    %ebx,%edx
     fd4:	75 f2                	jne    fc8 <memmove+0x18>
    *dst++ = *src++;
  return vdst;
}
     fd6:	5b                   	pop    %ebx
     fd7:	5e                   	pop    %esi
     fd8:	5d                   	pop    %ebp
     fd9:	c3                   	ret    

00000fda <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     fda:	b8 01 00 00 00       	mov    $0x1,%eax
     fdf:	cd 40                	int    $0x40
     fe1:	c3                   	ret    

00000fe2 <exit>:
SYSCALL(exit)
     fe2:	b8 02 00 00 00       	mov    $0x2,%eax
     fe7:	cd 40                	int    $0x40
     fe9:	c3                   	ret    

00000fea <wait>:
SYSCALL(wait)
     fea:	b8 03 00 00 00       	mov    $0x3,%eax
     fef:	cd 40                	int    $0x40
     ff1:	c3                   	ret    

00000ff2 <pipe>:
SYSCALL(pipe)
     ff2:	b8 04 00 00 00       	mov    $0x4,%eax
     ff7:	cd 40                	int    $0x40
     ff9:	c3                   	ret    

00000ffa <read>:
SYSCALL(read)
     ffa:	b8 05 00 00 00       	mov    $0x5,%eax
     fff:	cd 40                	int    $0x40
    1001:	c3                   	ret    

00001002 <write>:
SYSCALL(write)
    1002:	b8 10 00 00 00       	mov    $0x10,%eax
    1007:	cd 40                	int    $0x40
    1009:	c3                   	ret    

0000100a <close>:
SYSCALL(close)
    100a:	b8 15 00 00 00       	mov    $0x15,%eax
    100f:	cd 40                	int    $0x40
    1011:	c3                   	ret    

00001012 <kill>:
SYSCALL(kill)
    1012:	b8 06 00 00 00       	mov    $0x6,%eax
    1017:	cd 40                	int    $0x40
    1019:	c3                   	ret    

0000101a <exec>:
SYSCALL(exec)
    101a:	b8 07 00 00 00       	mov    $0x7,%eax
    101f:	cd 40                	int    $0x40
    1021:	c3                   	ret    

00001022 <open>:
SYSCALL(open)
    1022:	b8 0f 00 00 00       	mov    $0xf,%eax
    1027:	cd 40                	int    $0x40
    1029:	c3                   	ret    

0000102a <mknod>:
SYSCALL(mknod)
    102a:	b8 11 00 00 00       	mov    $0x11,%eax
    102f:	cd 40                	int    $0x40
    1031:	c3                   	ret    

00001032 <unlink>:
SYSCALL(unlink)
    1032:	b8 12 00 00 00       	mov    $0x12,%eax
    1037:	cd 40                	int    $0x40
    1039:	c3                   	ret    

0000103a <fstat>:
SYSCALL(fstat)
    103a:	b8 08 00 00 00       	mov    $0x8,%eax
    103f:	cd 40                	int    $0x40
    1041:	c3                   	ret    

00001042 <link>:
SYSCALL(link)
    1042:	b8 13 00 00 00       	mov    $0x13,%eax
    1047:	cd 40                	int    $0x40
    1049:	c3                   	ret    

0000104a <mkdir>:
SYSCALL(mkdir)
    104a:	b8 14 00 00 00       	mov    $0x14,%eax
    104f:	cd 40                	int    $0x40
    1051:	c3                   	ret    

00001052 <chdir>:
SYSCALL(chdir)
    1052:	b8 09 00 00 00       	mov    $0x9,%eax
    1057:	cd 40                	int    $0x40
    1059:	c3                   	ret    

0000105a <dup>:
SYSCALL(dup)
    105a:	b8 0a 00 00 00       	mov    $0xa,%eax
    105f:	cd 40                	int    $0x40
    1061:	c3                   	ret    

00001062 <getpid>:
SYSCALL(getpid)
    1062:	b8 0b 00 00 00       	mov    $0xb,%eax
    1067:	cd 40                	int    $0x40
    1069:	c3                   	ret    

0000106a <sbrk>:
SYSCALL(sbrk)
    106a:	b8 0c 00 00 00       	mov    $0xc,%eax
    106f:	cd 40                	int    $0x40
    1071:	c3                   	ret    

00001072 <sleep>:
SYSCALL(sleep)
    1072:	b8 0d 00 00 00       	mov    $0xd,%eax
    1077:	cd 40                	int    $0x40
    1079:	c3                   	ret    

0000107a <uptime>:
SYSCALL(uptime)
    107a:	b8 0e 00 00 00       	mov    $0xe,%eax
    107f:	cd 40                	int    $0x40
    1081:	c3                   	ret    

00001082 <helloworld>:
SYSCALL(helloworld)
    1082:	b8 16 00 00 00       	mov    $0x16,%eax
    1087:	cd 40                	int    $0x40
    1089:	c3                   	ret    

0000108a <enablecount>:
SYSCALL(enablecount)
    108a:	b8 17 00 00 00       	mov    $0x17,%eax
    108f:	cd 40                	int    $0x40
    1091:	c3                   	ret    

00001092 <disablecount>:
SYSCALL(disablecount)
    1092:	b8 18 00 00 00       	mov    $0x18,%eax
    1097:	cd 40                	int    $0x40
    1099:	c3                   	ret    

0000109a <resetcount>:
SYSCALL(resetcount)
    109a:	b8 19 00 00 00       	mov    $0x19,%eax
    109f:	cd 40                	int    $0x40
    10a1:	c3                   	ret    

000010a2 <ps>:
SYSCALL(ps)
    10a2:	b8 1a 00 00 00       	mov    $0x1a,%eax
    10a7:	cd 40                	int    $0x40
    10a9:	c3                   	ret    

000010aa <scarlet>:
SYSCALL(scarlet)
    10aa:	b8 1b 00 00 00       	mov    $0x1b,%eax
    10af:	cd 40                	int    $0x40
    10b1:	c3                   	ret    
    10b2:	66 90                	xchg   %ax,%ax
    10b4:	66 90                	xchg   %ax,%ax
    10b6:	66 90                	xchg   %ax,%ax
    10b8:	66 90                	xchg   %ax,%ax
    10ba:	66 90                	xchg   %ax,%ax
    10bc:	66 90                	xchg   %ax,%ax
    10be:	66 90                	xchg   %ax,%ax

000010c0 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
    10c0:	55                   	push   %ebp
    10c1:	89 e5                	mov    %esp,%ebp
    10c3:	57                   	push   %edi
    10c4:	56                   	push   %esi
    10c5:	89 c6                	mov    %eax,%esi
    10c7:	53                   	push   %ebx
    10c8:	83 ec 4c             	sub    $0x4c,%esp
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    10cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
    10ce:	85 db                	test   %ebx,%ebx
    10d0:	74 09                	je     10db <printint+0x1b>
    10d2:	89 d0                	mov    %edx,%eax
    10d4:	c1 e8 1f             	shr    $0x1f,%eax
    10d7:	84 c0                	test   %al,%al
    10d9:	75 75                	jne    1150 <printint+0x90>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    10db:	89 d0                	mov    %edx,%eax
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    10dd:	c7 45 c4 00 00 00 00 	movl   $0x0,-0x3c(%ebp)
    10e4:	89 75 c0             	mov    %esi,-0x40(%ebp)
    x = -xx;
  } else {
    x = xx;
  }

  i = 0;
    10e7:	31 ff                	xor    %edi,%edi
    10e9:	89 ce                	mov    %ecx,%esi
    10eb:	8d 5d d7             	lea    -0x29(%ebp),%ebx
    10ee:	eb 02                	jmp    10f2 <printint+0x32>
  do{
    buf[i++] = digits[x % base];
    10f0:	89 cf                	mov    %ecx,%edi
    10f2:	31 d2                	xor    %edx,%edx
    10f4:	f7 f6                	div    %esi
    10f6:	8d 4f 01             	lea    0x1(%edi),%ecx
    10f9:	0f b6 92 db 15 00 00 	movzbl 0x15db(%edx),%edx
  }while((x /= base) != 0);
    1100:	85 c0                	test   %eax,%eax
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    1102:	88 14 0b             	mov    %dl,(%ebx,%ecx,1)
  }while((x /= base) != 0);
    1105:	75 e9                	jne    10f0 <printint+0x30>
  if(neg)
    1107:	8b 55 c4             	mov    -0x3c(%ebp),%edx
    x = xx;
  }

  i = 0;
  do{
    buf[i++] = digits[x % base];
    110a:	89 c8                	mov    %ecx,%eax
    110c:	8b 75 c0             	mov    -0x40(%ebp),%esi
  }while((x /= base) != 0);
  if(neg)
    110f:	85 d2                	test   %edx,%edx
    1111:	74 08                	je     111b <printint+0x5b>
    buf[i++] = '-';
    1113:	8d 4f 02             	lea    0x2(%edi),%ecx
    1116:	c6 44 05 d8 2d       	movb   $0x2d,-0x28(%ebp,%eax,1)

  while(--i >= 0)
    111b:	8d 79 ff             	lea    -0x1(%ecx),%edi
    111e:	66 90                	xchg   %ax,%ax
    1120:	0f b6 44 3d d8       	movzbl -0x28(%ebp,%edi,1),%eax
    1125:	83 ef 01             	sub    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1128:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    112f:	00 
    1130:	89 5c 24 04          	mov    %ebx,0x4(%esp)
    1134:	89 34 24             	mov    %esi,(%esp)
    1137:	88 45 d7             	mov    %al,-0x29(%ebp)
    113a:	e8 c3 fe ff ff       	call   1002 <write>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    113f:	83 ff ff             	cmp    $0xffffffff,%edi
    1142:	75 dc                	jne    1120 <printint+0x60>
    putc(fd, buf[i]);
}
    1144:	83 c4 4c             	add    $0x4c,%esp
    1147:	5b                   	pop    %ebx
    1148:	5e                   	pop    %esi
    1149:	5f                   	pop    %edi
    114a:	5d                   	pop    %ebp
    114b:	c3                   	ret    
    114c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
    1150:	89 d0                	mov    %edx,%eax
    1152:	f7 d8                	neg    %eax
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    1154:	c7 45 c4 01 00 00 00 	movl   $0x1,-0x3c(%ebp)
    115b:	eb 87                	jmp    10e4 <printint+0x24>
    115d:	8d 76 00             	lea    0x0(%esi),%esi

00001160 <printf>:
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1160:	55                   	push   %ebp
    1161:	89 e5                	mov    %esp,%ebp
    1163:	57                   	push   %edi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    1164:	31 ff                	xor    %edi,%edi
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1166:	56                   	push   %esi
    1167:	53                   	push   %ebx
    1168:	83 ec 3c             	sub    $0x3c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    116b:	8b 5d 0c             	mov    0xc(%ebp),%ebx
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    116e:	8d 45 10             	lea    0x10(%ebp),%eax
}

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, const char *fmt, ...)
{
    1171:	8b 75 08             	mov    0x8(%ebp),%esi
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
    1174:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  for(i = 0; fmt[i]; i++){
    1177:	0f b6 13             	movzbl (%ebx),%edx
    117a:	83 c3 01             	add    $0x1,%ebx
    117d:	84 d2                	test   %dl,%dl
    117f:	75 39                	jne    11ba <printf+0x5a>
    1181:	e9 c2 00 00 00       	jmp    1248 <printf+0xe8>
    1186:	66 90                	xchg   %ax,%ax
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
    1188:	83 fa 25             	cmp    $0x25,%edx
    118b:	0f 84 bf 00 00 00    	je     1250 <printf+0xf0>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1191:	8d 45 e2             	lea    -0x1e(%ebp),%eax
    1194:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    119b:	00 
    119c:	89 44 24 04          	mov    %eax,0x4(%esp)
    11a0:	89 34 24             	mov    %esi,(%esp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
    11a3:	88 55 e2             	mov    %dl,-0x1e(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11a6:	e8 57 fe ff ff       	call   1002 <write>
    11ab:	83 c3 01             	add    $0x1,%ebx
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    11ae:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    11b2:	84 d2                	test   %dl,%dl
    11b4:	0f 84 8e 00 00 00    	je     1248 <printf+0xe8>
    c = fmt[i] & 0xff;
    if(state == 0){
    11ba:	85 ff                	test   %edi,%edi
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    11bc:	0f be c2             	movsbl %dl,%eax
    if(state == 0){
    11bf:	74 c7                	je     1188 <printf+0x28>
      if(c == '%'){
        state = '%';
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
    11c1:	83 ff 25             	cmp    $0x25,%edi
    11c4:	75 e5                	jne    11ab <printf+0x4b>
      if(c == 'd'){
    11c6:	83 fa 64             	cmp    $0x64,%edx
    11c9:	0f 84 31 01 00 00    	je     1300 <printf+0x1a0>
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    11cf:	25 f7 00 00 00       	and    $0xf7,%eax
    11d4:	83 f8 70             	cmp    $0x70,%eax
    11d7:	0f 84 83 00 00 00    	je     1260 <printf+0x100>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    11dd:	83 fa 73             	cmp    $0x73,%edx
    11e0:	0f 84 a2 00 00 00    	je     1288 <printf+0x128>
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    11e6:	83 fa 63             	cmp    $0x63,%edx
    11e9:	0f 84 35 01 00 00    	je     1324 <printf+0x1c4>
        putc(fd, *ap);
        ap++;
      } else if(c == '%'){
    11ef:	83 fa 25             	cmp    $0x25,%edx
    11f2:	0f 84 e0 00 00 00    	je     12d8 <printf+0x178>
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    11f8:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    11fb:	83 c3 01             	add    $0x1,%ebx
    11fe:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1205:	00 
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1206:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1208:	89 44 24 04          	mov    %eax,0x4(%esp)
    120c:	89 34 24             	mov    %esi,(%esp)
    120f:	89 55 d0             	mov    %edx,-0x30(%ebp)
    1212:	c6 45 e6 25          	movb   $0x25,-0x1a(%ebp)
    1216:	e8 e7 fd ff ff       	call   1002 <write>
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    121b:	8b 55 d0             	mov    -0x30(%ebp),%edx
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    121e:	8d 45 e7             	lea    -0x19(%ebp),%eax
    1221:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1228:	00 
    1229:	89 44 24 04          	mov    %eax,0x4(%esp)
    122d:	89 34 24             	mov    %esi,(%esp)
      } else if(c == '%'){
        putc(fd, c);
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
    1230:	88 55 e7             	mov    %dl,-0x19(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1233:	e8 ca fd ff ff       	call   1002 <write>
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    1238:	0f b6 53 ff          	movzbl -0x1(%ebx),%edx
    123c:	84 d2                	test   %dl,%dl
    123e:	0f 85 76 ff ff ff    	jne    11ba <printf+0x5a>
    1244:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    1248:	83 c4 3c             	add    $0x3c,%esp
    124b:	5b                   	pop    %ebx
    124c:	5e                   	pop    %esi
    124d:	5f                   	pop    %edi
    124e:	5d                   	pop    %ebp
    124f:	c3                   	ret    
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
    1250:	bf 25 00 00 00       	mov    $0x25,%edi
    1255:	e9 51 ff ff ff       	jmp    11ab <printf+0x4b>
    125a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    1260:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1263:	b9 10 00 00 00       	mov    $0x10,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1268:	31 ff                	xor    %edi,%edi
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
    126a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1271:	8b 10                	mov    (%eax),%edx
    1273:	89 f0                	mov    %esi,%eax
    1275:	e8 46 fe ff ff       	call   10c0 <printint>
        ap++;
    127a:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    127e:	e9 28 ff ff ff       	jmp    11ab <printf+0x4b>
    1283:	90                   	nop
    1284:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      } else if(c == 's'){
        s = (char*)*ap;
    1288:	8b 45 d4             	mov    -0x2c(%ebp),%eax
        ap++;
    128b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
        ap++;
      } else if(c == 'x' || c == 'p'){
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
        s = (char*)*ap;
    128f:	8b 38                	mov    (%eax),%edi
        ap++;
        if(s == 0)
          s = "(null)";
    1291:	b8 d4 15 00 00       	mov    $0x15d4,%eax
    1296:	85 ff                	test   %edi,%edi
    1298:	0f 44 f8             	cmove  %eax,%edi
        while(*s != 0){
    129b:	0f b6 07             	movzbl (%edi),%eax
    129e:	84 c0                	test   %al,%al
    12a0:	74 2a                	je     12cc <printf+0x16c>
    12a2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    12a8:	88 45 e3             	mov    %al,-0x1d(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    12ab:	8d 45 e3             	lea    -0x1d(%ebp),%eax
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
          putc(fd, *s);
          s++;
    12ae:	83 c7 01             	add    $0x1,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    12b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12b8:	00 
    12b9:	89 44 24 04          	mov    %eax,0x4(%esp)
    12bd:	89 34 24             	mov    %esi,(%esp)
    12c0:	e8 3d fd ff ff       	call   1002 <write>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    12c5:	0f b6 07             	movzbl (%edi),%eax
    12c8:	84 c0                	test   %al,%al
    12ca:	75 dc                	jne    12a8 <printf+0x148>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    12cc:	31 ff                	xor    %edi,%edi
    12ce:	e9 d8 fe ff ff       	jmp    11ab <printf+0x4b>
    12d3:	90                   	nop
    12d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    12d8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    12db:	31 ff                	xor    %edi,%edi
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    12dd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    12e4:	00 
    12e5:	89 44 24 04          	mov    %eax,0x4(%esp)
    12e9:	89 34 24             	mov    %esi,(%esp)
    12ec:	c6 45 e5 25          	movb   $0x25,-0x1b(%ebp)
    12f0:	e8 0d fd ff ff       	call   1002 <write>
    12f5:	e9 b1 fe ff ff       	jmp    11ab <printf+0x4b>
    12fa:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    1300:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    1303:	b9 0a 00 00 00       	mov    $0xa,%ecx
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1308:	66 31 ff             	xor    %di,%di
      } else {
        putc(fd, c);
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
    130b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1312:	8b 10                	mov    (%eax),%edx
    1314:	89 f0                	mov    %esi,%eax
    1316:	e8 a5 fd ff ff       	call   10c0 <printint>
        ap++;
    131b:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    131f:	e9 87 fe ff ff       	jmp    11ab <printf+0x4b>
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1324:	8b 45 d4             	mov    -0x2c(%ebp),%eax
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
        putc(fd, c);
      }
      state = 0;
    1327:	31 ff                	xor    %edi,%edi
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1329:	8b 00                	mov    (%eax),%eax
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    132b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    1332:	00 
    1333:	89 34 24             	mov    %esi,(%esp)
        while(*s != 0){
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
    1336:	88 45 e4             	mov    %al,-0x1c(%ebp)
#include "user.h"

static void
putc(int fd, char c)
{
  write(fd, &c, 1);
    1339:	8d 45 e4             	lea    -0x1c(%ebp),%eax
    133c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1340:	e8 bd fc ff ff       	call   1002 <write>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
        putc(fd, *ap);
        ap++;
    1345:	83 45 d4 04          	addl   $0x4,-0x2c(%ebp)
    1349:	e9 5d fe ff ff       	jmp    11ab <printf+0x4b>
    134e:	66 90                	xchg   %ax,%ax

00001350 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    1350:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1351:	a1 e4 1b 00 00       	mov    0x1be4,%eax
static Header base;
static Header *freep;

void
free(void *ap)
{
    1356:	89 e5                	mov    %esp,%ebp
    1358:	57                   	push   %edi
    1359:	56                   	push   %esi
    135a:	53                   	push   %ebx
    135b:	8b 5d 08             	mov    0x8(%ebp),%ebx
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    135e:	8b 08                	mov    (%eax),%ecx
void
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
    1360:	8d 53 f8             	lea    -0x8(%ebx),%edx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1363:	39 d0                	cmp    %edx,%eax
    1365:	72 11                	jb     1378 <free+0x28>
    1367:	90                   	nop
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1368:	39 c8                	cmp    %ecx,%eax
    136a:	72 04                	jb     1370 <free+0x20>
    136c:	39 ca                	cmp    %ecx,%edx
    136e:	72 10                	jb     1380 <free+0x30>
    1370:	89 c8                	mov    %ecx,%eax
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1372:	39 d0                	cmp    %edx,%eax
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1374:	8b 08                	mov    (%eax),%ecx
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    1376:	73 f0                	jae    1368 <free+0x18>
    1378:	39 ca                	cmp    %ecx,%edx
    137a:	72 04                	jb     1380 <free+0x30>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    137c:	39 c8                	cmp    %ecx,%eax
    137e:	72 f0                	jb     1370 <free+0x20>
      break;
  if(bp + bp->s.size == p->s.ptr){
    1380:	8b 73 fc             	mov    -0x4(%ebx),%esi
    1383:	8d 3c f2             	lea    (%edx,%esi,8),%edi
    1386:	39 cf                	cmp    %ecx,%edi
    1388:	74 1e                	je     13a8 <free+0x58>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
    138a:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  if(p + p->s.size == bp){
    138d:	8b 48 04             	mov    0x4(%eax),%ecx
    1390:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    1393:	39 f2                	cmp    %esi,%edx
    1395:	74 28                	je     13bf <free+0x6f>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
    1397:	89 10                	mov    %edx,(%eax)
  freep = p;
    1399:	a3 e4 1b 00 00       	mov    %eax,0x1be4
}
    139e:	5b                   	pop    %ebx
    139f:	5e                   	pop    %esi
    13a0:	5f                   	pop    %edi
    13a1:	5d                   	pop    %ebp
    13a2:	c3                   	ret    
    13a3:	90                   	nop
    13a4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    bp->s.size += p->s.ptr->s.size;
    13a8:	03 71 04             	add    0x4(%ecx),%esi
    13ab:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    13ae:	8b 08                	mov    (%eax),%ecx
    13b0:	8b 09                	mov    (%ecx),%ecx
    13b2:	89 4b f8             	mov    %ecx,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    13b5:	8b 48 04             	mov    0x4(%eax),%ecx
    13b8:	8d 34 c8             	lea    (%eax,%ecx,8),%esi
    13bb:	39 f2                	cmp    %esi,%edx
    13bd:	75 d8                	jne    1397 <free+0x47>
    p->s.size += bp->s.size;
    13bf:	03 4b fc             	add    -0x4(%ebx),%ecx
    p->s.ptr = bp->s.ptr;
  } else
    p->s.ptr = bp;
  freep = p;
    13c2:	a3 e4 1b 00 00       	mov    %eax,0x1be4
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    p->s.size += bp->s.size;
    13c7:	89 48 04             	mov    %ecx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    13ca:	8b 53 f8             	mov    -0x8(%ebx),%edx
    13cd:	89 10                	mov    %edx,(%eax)
  } else
    p->s.ptr = bp;
  freep = p;
}
    13cf:	5b                   	pop    %ebx
    13d0:	5e                   	pop    %esi
    13d1:	5f                   	pop    %edi
    13d2:	5d                   	pop    %ebp
    13d3:	c3                   	ret    
    13d4:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    13da:	8d bf 00 00 00 00    	lea    0x0(%edi),%edi

000013e0 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    13e0:	55                   	push   %ebp
    13e1:	89 e5                	mov    %esp,%ebp
    13e3:	57                   	push   %edi
    13e4:	56                   	push   %esi
    13e5:	53                   	push   %ebx
    13e6:	83 ec 1c             	sub    $0x1c,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13e9:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    13ec:	8b 1d e4 1b 00 00    	mov    0x1be4,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13f2:	8d 48 07             	lea    0x7(%eax),%ecx
    13f5:	c1 e9 03             	shr    $0x3,%ecx
  if((prevp = freep) == 0){
    13f8:	85 db                	test   %ebx,%ebx
malloc(uint nbytes)
{
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    13fa:	8d 71 01             	lea    0x1(%ecx),%esi
  if((prevp = freep) == 0){
    13fd:	0f 84 9b 00 00 00    	je     149e <malloc+0xbe>
    1403:	8b 13                	mov    (%ebx),%edx
    1405:	8b 7a 04             	mov    0x4(%edx),%edi
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1408:	39 fe                	cmp    %edi,%esi
    140a:	76 64                	jbe    1470 <malloc+0x90>
    140c:	8d 04 f5 00 00 00 00 	lea    0x0(,%esi,8),%eax
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1413:	bb 00 80 00 00       	mov    $0x8000,%ebx
    1418:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    141b:	eb 0e                	jmp    142b <malloc+0x4b>
    141d:	8d 76 00             	lea    0x0(%esi),%esi
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1420:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1422:	8b 78 04             	mov    0x4(%eax),%edi
    1425:	39 fe                	cmp    %edi,%esi
    1427:	76 4f                	jbe    1478 <malloc+0x98>
    1429:	89 c2                	mov    %eax,%edx
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    142b:	3b 15 e4 1b 00 00    	cmp    0x1be4,%edx
    1431:	75 ed                	jne    1420 <malloc+0x40>
morecore(uint nu)
{
  char *p;
  Header *hp;

  if(nu < 4096)
    1433:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    1436:	81 fe 00 10 00 00    	cmp    $0x1000,%esi
    143c:	bf 00 10 00 00       	mov    $0x1000,%edi
    1441:	0f 43 fe             	cmovae %esi,%edi
    1444:	0f 42 c3             	cmovb  %ebx,%eax
    nu = 4096;
  p = sbrk(nu * sizeof(Header));
    1447:	89 04 24             	mov    %eax,(%esp)
    144a:	e8 1b fc ff ff       	call   106a <sbrk>
  if(p == (char*)-1)
    144f:	83 f8 ff             	cmp    $0xffffffff,%eax
    1452:	74 18                	je     146c <malloc+0x8c>
    return 0;
  hp = (Header*)p;
  hp->s.size = nu;
    1454:	89 78 04             	mov    %edi,0x4(%eax)
  free((void*)(hp + 1));
    1457:	83 c0 08             	add    $0x8,%eax
    145a:	89 04 24             	mov    %eax,(%esp)
    145d:	e8 ee fe ff ff       	call   1350 <free>
  return freep;
    1462:	8b 15 e4 1b 00 00    	mov    0x1be4,%edx
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
    1468:	85 d2                	test   %edx,%edx
    146a:	75 b4                	jne    1420 <malloc+0x40>
        return 0;
    146c:	31 c0                	xor    %eax,%eax
    146e:	eb 20                	jmp    1490 <malloc+0xb0>
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
    1470:	89 d0                	mov    %edx,%eax
    1472:	89 da                	mov    %ebx,%edx
    1474:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      if(p->s.size == nunits)
    1478:	39 fe                	cmp    %edi,%esi
    147a:	74 1c                	je     1498 <malloc+0xb8>
        prevp->s.ptr = p->s.ptr;
      else {
        p->s.size -= nunits;
    147c:	29 f7                	sub    %esi,%edi
    147e:	89 78 04             	mov    %edi,0x4(%eax)
        p += p->s.size;
    1481:	8d 04 f8             	lea    (%eax,%edi,8),%eax
        p->s.size = nunits;
    1484:	89 70 04             	mov    %esi,0x4(%eax)
      }
      freep = prevp;
    1487:	89 15 e4 1b 00 00    	mov    %edx,0x1be4
      return (void*)(p + 1);
    148d:	83 c0 08             	add    $0x8,%eax
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
}
    1490:	83 c4 1c             	add    $0x1c,%esp
    1493:	5b                   	pop    %ebx
    1494:	5e                   	pop    %esi
    1495:	5f                   	pop    %edi
    1496:	5d                   	pop    %ebp
    1497:	c3                   	ret    
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    if(p->s.size >= nunits){
      if(p->s.size == nunits)
        prevp->s.ptr = p->s.ptr;
    1498:	8b 08                	mov    (%eax),%ecx
    149a:	89 0a                	mov    %ecx,(%edx)
    149c:	eb e9                	jmp    1487 <malloc+0xa7>
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    149e:	c7 05 e4 1b 00 00 e8 	movl   $0x1be8,0x1be4
    14a5:	1b 00 00 
    base.s.size = 0;
    14a8:	ba e8 1b 00 00       	mov    $0x1be8,%edx
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    14ad:	c7 05 e8 1b 00 00 e8 	movl   $0x1be8,0x1be8
    14b4:	1b 00 00 
    base.s.size = 0;
    14b7:	c7 05 ec 1b 00 00 00 	movl   $0x0,0x1bec
    14be:	00 00 00 
    14c1:	e9 46 ff ff ff       	jmp    140c <malloc+0x2c>
