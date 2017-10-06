# 1 "game.c"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "game.c"
# 1 "game.h" 1
typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int size;
 int height;
 int width;
 int active;
 int lives;
 int rowDel;
 int rowAcc;
 int colAcc;
 int waterRow;
 int shieldEnable;
 int kills;
} PLAYER;

typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int size;
 int active;
 int type;
 int colAcc;
 int rowAcc;
 int hits;
} OBSTACLE;

typedef struct {
 int row;
 int col;
 int spriteRow;
 int spriteCol;
 int height;
 int width;
 int rdel;
 int cdel;
 int color;
 int active;
 int type;
} BULLET;

void updateBoat(PLAYER *p);
void updateObstacle(OBSTACLE *o, int frame);
void fireObstacle(OBSTACLE *o, PLAYER *p);
void playerObstacleCollision(PLAYER *p, OBSTACLE *o);
void updateBullet(BULLET *bullet);
void fireBullet(BULLET *bullet, PLAYER *p);
void obstacleBulletCollision(BULLET *b, OBSTACLE *o, PLAYER *p);
# 2 "game.c" 2
# 1 "myLib.h" 1



typedef unsigned short u16;
# 42 "myLib.h"
extern unsigned short *videoBuffer;

extern unsigned short *frontBuffer;
extern unsigned short *backBuffer;


void setPixel(int row, int col, unsigned short color);
void drawRect(int row, int col, int height, int width, unsigned short color);
void drawRectInBounds(int row, int col, int height, int width, unsigned short color);
void waitForVBlank();
void fillScreen(unsigned short color);
void drawBackgroundImage3(const unsigned short*);
void drawImage3(const unsigned short* image, int row, int col, int height, int width);

void loadPalette(const unsigned short* palette);
void loadMap(const unsigned short * map, unsigned short mapLen, unsigned short palIndex, unsigned short sbb);

int rand();
void srand();
# 78 "myLib.h"
extern unsigned int oldButtons;
extern unsigned int buttons;
# 88 "myLib.h"
void DMANow(int channel, volatile const void* source, volatile const void* destination, unsigned int control);






typedef struct
{
    const volatile void *src;
    const volatile void *dst;
    unsigned int cnt;
} DMA_CONTROLLER;
# 231 "myLib.h"
typedef struct { u16 tileimg[8192]; } charblock;
typedef struct { u16 tilemap[1024]; } screenblock;
# 289 "myLib.h"
typedef struct{
    unsigned short attr0;
    unsigned short attr1;
    unsigned short attr2;
    unsigned short fill;
}OBJ_ATTR;

typedef struct {
    int row;
    int col;
} Sprite;
# 3 "game.c" 2
# 1 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 1 3
# 29 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 15 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/newlib.h" 1 3
# 16 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 1 3



# 1 "/opt/devkitARM/arm-none-eabi/include/machine/ieeefp.h" 1 3
# 5 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/features.h" 1 3
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/config.h" 2 3
# 17 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 2 3
# 30 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3





# 1 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 1 3
# 43 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 1 3
# 27 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3

# 27 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int8_t;

typedef unsigned char __uint8_t;
# 41 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int16_t;

typedef short unsigned int __uint16_t;
# 63 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int32_t;

typedef long unsigned int __uint32_t;
# 89 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int64_t;

typedef long long unsigned int __uint64_t;
# 120 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef signed char __int_least8_t;

typedef unsigned char __uint_least8_t;
# 146 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef short int __int_least16_t;

typedef short unsigned int __uint_least16_t;
# 168 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long int __int_least32_t;

typedef long unsigned int __uint_least32_t;
# 186 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef long long int __int_least64_t;

typedef long long unsigned int __uint_least64_t;
# 200 "/opt/devkitARM/arm-none-eabi/include/machine/_default_types.h" 3
typedef int __intptr_t;

typedef unsigned int __uintptr_t;
# 44 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3

# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 216 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int size_t;
# 46 "/opt/devkitARM/arm-none-eabi/include/sys/cdefs.h" 2 3
# 36 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 149 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef int ptrdiff_t;
# 328 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wchar_t;
# 37 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3


# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdarg.h" 1 3 4
# 40 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 40 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3







# 1 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 1 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/_ansi.h" 1 3
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 15 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 1 3
# 12 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/_types.h" 1 3
# 13 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 1 3




# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 1 3 4
# 9 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 1 3 4
# 13 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/_intsup.h" 1 3 4
# 14 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 2 3 4






typedef __int8_t int8_t ;
typedef __uint8_t uint8_t ;




typedef __int_least8_t int_least8_t;
typedef __uint_least8_t uint_least8_t;




typedef __int16_t int16_t ;
typedef __uint16_t uint16_t ;




typedef __int_least16_t int_least16_t;
typedef __uint_least16_t uint_least16_t;




typedef __int32_t int32_t ;
typedef __uint32_t uint32_t ;




typedef __int_least32_t int_least32_t;
typedef __uint_least32_t uint_least32_t;




typedef __int64_t int64_t ;
typedef __uint64_t uint64_t ;




typedef __int_least64_t int_least64_t;
typedef __uint_least64_t uint_least64_t;
# 74 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast8_t;
  typedef unsigned int uint_fast8_t;
# 84 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast16_t;
  typedef unsigned int uint_fast16_t;
# 94 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef int int_fast32_t;
  typedef unsigned int uint_fast32_t;
# 104 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int int_fast64_t;
  typedef long long unsigned int uint_fast64_t;
# 153 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long int intmax_t;
# 162 "/opt/devkitARM/arm-none-eabi/include/stdint.h" 3 4
  typedef long long unsigned int uintmax_t;






typedef __intptr_t intptr_t;
typedef __uintptr_t uintptr_t;
# 10 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stdint.h" 2 3 4
# 6 "/opt/devkitARM/arm-none-eabi/include/sys/lock.h" 2 3

typedef int32_t _LOCK_T;

struct __lock_t {
 _LOCK_T lock;
 uint32_t thread_tag;
 uint32_t counter;
};

typedef struct __lock_t _LOCK_RECURSIVE_T;

extern void __libc_lock_init(_LOCK_T *lock);
extern void __libc_lock_init_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_close(_LOCK_T *lock);
extern void __libc_lock_close_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_acquire(_LOCK_T *lock);
extern void __libc_lock_acquire_recursive(_LOCK_RECURSIVE_T *lock);
extern void __libc_lock_release(_LOCK_T *lock);
extern void __libc_lock_release_recursive(_LOCK_RECURSIVE_T *lock);


extern int __libc_lock_try_acquire(_LOCK_T *lock);
extern int __libc_lock_try_acquire_recursive(_LOCK_RECURSIVE_T *lock);
# 14 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3


typedef long _off_t;



typedef int __dev_t;



typedef unsigned short __uid_t;


typedef unsigned short __gid_t;



__extension__ typedef long long _off64_t;







typedef long _fpos_t;
# 55 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
typedef signed int _ssize_t;
# 67 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 357 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 3 4
typedef unsigned int wint_t;
# 68 "/opt/devkitARM/arm-none-eabi/include/sys/_types.h" 2 3



typedef struct
{
  int __count;
  union
  {
    wint_t __wch;
    unsigned char __wchb[4];
  } __value;
} _mbstate_t;



typedef _LOCK_RECURSIVE_T _flock_t;




typedef void *_iconv_t;
# 16 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 2 3






typedef unsigned long __ULong;
# 38 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent;






struct _Bigint
{
  struct _Bigint *_next;
  int _k, _maxwds, _sign, _wds;
  __ULong _x[1];
};


struct __tm
{
  int __tm_sec;
  int __tm_min;
  int __tm_hour;
  int __tm_mday;
  int __tm_mon;
  int __tm_year;
  int __tm_wday;
  int __tm_yday;
  int __tm_isdst;
};







struct _on_exit_args {
 void * _fnargs[32];
 void * _dso_handle[32];

 __ULong _fntypes;


 __ULong _is_cxa;
};
# 91 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _atexit {
 struct _atexit *_next;
 int _ind;

 void (*_fns[32])(void);
        struct _on_exit_args _on_exit_args;
};
# 115 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sbuf {
 unsigned char *_base;
 int _size;
};
# 179 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct __sFILE {
  unsigned char *_p;
  int _r;
  int _w;
  short _flags;
  short _file;
  struct __sbuf _bf;
  int _lbfsize;






  void * _cookie;

  int (* _read) (struct _reent *, void *, char *, int)
                                          ;
  int (* _write) (struct _reent *, void *, const char *, int)

                                   ;
  _fpos_t (* _seek) (struct _reent *, void *, _fpos_t, int);
  int (* _close) (struct _reent *, void *);


  struct __sbuf _ub;
  unsigned char *_up;
  int _ur;


  unsigned char _ubuf[3];
  unsigned char _nbuf[1];


  struct __sbuf _lb;


  int _blksize;
  _off_t _offset;


  struct _reent *_data;



  _flock_t _lock;

  _mbstate_t _mbstate;
  int _flags2;
};
# 285 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
typedef struct __sFILE __FILE;



struct _glue
{
  struct _glue *_next;
  int _niobs;
  __FILE *_iobs;
};
# 317 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _rand48 {
  unsigned short _seed[3];
  unsigned short _mult[3];
  unsigned short _add;




};
# 569 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
struct _reent
{
  int _errno;




  __FILE *_stdin, *_stdout, *_stderr;

  int _inc;
  char _emergency[25];

  int _current_category;
  const char *_current_locale;

  int __sdidinit;

  void (* __cleanup) (struct _reent *);


  struct _Bigint *_result;
  int _result_k;
  struct _Bigint *_p5s;
  struct _Bigint **_freelist;


  int _cvtlen;
  char *_cvtbuf;

  union
    {
      struct
        {
          unsigned int _unused_rand;
          char * _strtok_last;
          char _asctime_buf[26];
          struct __tm _localtime_buf;
          int _gamma_signgam;
          __extension__ unsigned long long _rand_next;
          struct _rand48 _r48;
          _mbstate_t _mblen_state;
          _mbstate_t _mbtowc_state;
          _mbstate_t _wctomb_state;
          char _l64a_buf[8];
          char _signal_buf[24];
          int _getdate_err;
          _mbstate_t _mbrlen_state;
          _mbstate_t _mbrtowc_state;
          _mbstate_t _mbsrtowcs_state;
          _mbstate_t _wcrtomb_state;
          _mbstate_t _wcsrtombs_state;
   int _h_errno;
        } _reent;



      struct
        {

          unsigned char * _nextf[30];
          unsigned int _nmalloc[30];
        } _unused;
    } _new;



  struct _atexit *_atexit;
  struct _atexit _atexit0;



  void (**(_sig_func))(int);




  struct _glue __sglue;
  __FILE __sf[3];
};
# 762 "/opt/devkitARM/arm-none-eabi/include/sys/reent.h" 3
extern struct _reent *_impure_ptr ;
extern struct _reent *const _global_impure_ptr ;

void _reclaim_reent (struct _reent *);





  struct _reent * __getreent (void);
# 48 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 1 3
# 69 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
# 1 "/opt/devkitARM/lib/gcc/arm-none-eabi/5.3.0/include/stddef.h" 1 3 4
# 70 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 1 "/opt/devkitARM/arm-none-eabi/include/machine/types.h" 1 3
# 19 "/opt/devkitARM/arm-none-eabi/include/machine/types.h" 3
typedef long int __off_t;
typedef int __pid_t;

__extension__ typedef long long int __loff_t;
# 71 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 2 3
# 93 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned char u_char;



typedef unsigned short u_short;



typedef unsigned int u_int;



typedef unsigned long u_long;





typedef unsigned short ushort;
typedef unsigned int uint;
typedef unsigned long ulong;



typedef unsigned long clock_t;




typedef long time_t;







struct timespec {
  time_t tv_sec;
  long tv_nsec;
};


struct itimerspec {
  struct timespec it_interval;
  struct timespec it_value;
};


typedef long daddr_t;



typedef char * caddr_t;
# 155 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned int ino_t;
# 184 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef _off_t off_t;
typedef __dev_t dev_t;
typedef __uid_t uid_t;
typedef __gid_t gid_t;





typedef int pid_t;







typedef long key_t;

typedef _ssize_t ssize_t;
# 217 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned int mode_t __attribute__ ((__mode__ (__SI__)));




typedef unsigned short nlink_t;
# 244 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef long fd_mask;







typedef struct _types_fd_set {
 fd_mask fds_bits[(((64)+(((sizeof (fd_mask) * 8))-1))/((sizeof (fd_mask) * 8)))];
} _types_fd_set;
# 275 "/opt/devkitARM/arm-none-eabi/include/sys/types.h" 3
typedef unsigned long clockid_t;




typedef unsigned long timer_t;



typedef unsigned long useconds_t;
typedef long suseconds_t;

typedef __uint32_t fsblkcnt_t;
typedef __uint32_t fsfilcnt_t;
# 49 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3



typedef __FILE FILE;




typedef _fpos_t fpos_t;





# 1 "/opt/devkitARM/arm-none-eabi/include/sys/stdio.h" 1 3
# 64 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 2 3
# 164 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3
FILE * tmpfile (void);
char * tmpnam (char *);

char * tempnam (const char *, const char *);

int fclose (FILE *);
int fflush (FILE *);
FILE * freopen (const char *restrict, const char *restrict, FILE *restrict);
void setbuf (FILE *restrict, char *restrict);
int setvbuf (FILE *restrict, char *restrict, int, size_t);
int fprintf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fscanf (FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int printf (const char *restrict, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int scanf (const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int sscanf (const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int vfprintf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int vsprintf (char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int fgetc (FILE *);
char * fgets (char *restrict, int, FILE *restrict);
int fputc (int, FILE *);
int fputs (const char *restrict, FILE *restrict);
int getc (FILE *);
int getchar (void);
char * gets (char *);
int putc (int, FILE *);
int putchar (int);
int puts (const char *);
int ungetc (int, FILE *);
size_t fread (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite (const void * restrict , size_t _size, size_t _n, FILE *);



int fgetpos (FILE *restrict, fpos_t *restrict);

int fseek (FILE *, long, int);



int fsetpos (FILE *, const fpos_t *);

long ftell ( FILE *);
void rewind (FILE *);
void clearerr (FILE *);
int feof (FILE *);
int ferror (FILE *);
void perror (const char *);

FILE * fopen (const char *restrict _name, const char *restrict _type);
int sprintf (char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int remove (const char *);
int rename (const char *, const char *);
# 244 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3
int asiprintf (char **, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
char * asniprintf (char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * asnprintf (char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int asprintf (char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int diprintf (int, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;

int fiprintf (FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int fiscanf (FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int iprintf (const char *, ...) __attribute__ ((__format__ (__printf__, 1, 2)))
                                                            ;
int iscanf (const char *, ...) __attribute__ ((__format__ (__scanf__, 1, 2)))
                                                           ;
int siprintf (char *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int siscanf (const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int snprintf (char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int sniprintf (char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int vasiprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
char * vasniprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * vasnprintf (char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vasprintf (char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vdiprintf (int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiprintf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vfiscanf (FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vfscanf (FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int viprintf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 1, 0)))
                                                            ;
int viscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vscanf (const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 1, 0)))
                                                           ;
int vsiprintf (char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int vsiscanf (const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int vsniprintf (char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsnprintf (char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int vsscanf (const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
# 357 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3
int _asiprintf_r (struct _reent *, char **, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
char * _asniprintf_r (struct _reent *, char *, size_t *, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
char * _asnprintf_r (struct _reent *, char *restrict, size_t *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _asprintf_r (struct _reent *, char **restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _diprintf_r (struct _reent *, int, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _dprintf_r (struct _reent *, int, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fclose_r (struct _reent *, FILE *);
int _fcloseall_r (struct _reent *);
FILE * _fdopen_r (struct _reent *, int, const char *);
int _fflush_r (struct _reent *, FILE *);
int _fgetc_r (struct _reent *, FILE *);
int _fgetc_unlocked_r (struct _reent *, FILE *);
char * _fgets_r (struct _reent *, char *restrict, int, FILE *restrict);
char * _fgets_unlocked_r (struct _reent *, char *restrict, int, FILE *restrict);




int _fgetpos_r (struct _reent *, FILE *, fpos_t *);
int _fsetpos_r (struct _reent *, FILE *, const fpos_t *);

int _fiprintf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fiscanf_r (struct _reent *, FILE *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
FILE * _fmemopen_r (struct _reent *, void *restrict, size_t, const char *restrict);
FILE * _fopen_r (struct _reent *, const char *restrict, const char *restrict);
FILE * _freopen_r (struct _reent *, const char *restrict, const char *restrict, FILE *restrict);
int _fprintf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _fpurge_r (struct _reent *, FILE *);
int _fputc_r (struct _reent *, int, FILE *);
int _fputc_unlocked_r (struct _reent *, int, FILE *);
int _fputs_r (struct _reent *, const char *restrict, FILE *restrict);
int _fputs_unlocked_r (struct _reent *, const char *restrict, FILE *restrict);
size_t _fread_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fread_unlocked_r (struct _reent *, void * restrict, size_t _size, size_t _n, FILE *restrict);
int _fscanf_r (struct _reent *, FILE *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _fseek_r (struct _reent *, FILE *, long, int);
int _fseeko_r (struct _reent *, FILE *, _off_t, int);
long _ftell_r (struct _reent *, FILE *);
_off_t _ftello_r (struct _reent *, FILE *);
void _rewind_r (struct _reent *, FILE *);
size_t _fwrite_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t _fwrite_unlocked_r (struct _reent *, const void * restrict, size_t _size, size_t _n, FILE *restrict);
int _getc_r (struct _reent *, FILE *);
int _getc_unlocked_r (struct _reent *, FILE *);
int _getchar_r (struct _reent *);
int _getchar_unlocked_r (struct _reent *);
char * _gets_r (struct _reent *, char *);
int _iprintf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _iscanf_r (struct _reent *, const char *, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
FILE * _open_memstream_r (struct _reent *, char **, size_t *);
void _perror_r (struct _reent *, const char *);
int _printf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 2, 3)))
                                                            ;
int _putc_r (struct _reent *, int, FILE *);
int _putc_unlocked_r (struct _reent *, int, FILE *);
int _putchar_unlocked_r (struct _reent *, int);
int _putchar_r (struct _reent *, int);
int _puts_r (struct _reent *, const char *);
int _remove_r (struct _reent *, const char *);
int _rename_r (struct _reent *, const char *_old, const char *_new)
                                          ;
int _scanf_r (struct _reent *, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 2, 3)))
                                                           ;
int _siprintf_r (struct _reent *, char *, const char *, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _siscanf_r (struct _reent *, const char *, const char *, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
int _sniprintf_r (struct _reent *, char *, size_t, const char *, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _snprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 4, 5)))
                                                            ;
int _sprintf_r (struct _reent *, char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__printf__, 3, 4)))
                                                            ;
int _sscanf_r (struct _reent *, const char *restrict, const char *restrict, ...) __attribute__ ((__format__ (__scanf__, 3, 4)))
                                                           ;
char * _tempnam_r (struct _reent *, const char *, const char *);
FILE * _tmpfile_r (struct _reent *);
char * _tmpnam_r (struct _reent *, char *);
int _ungetc_r (struct _reent *, int, FILE *);
int _vasiprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
char * _vasniprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
char * _vasnprintf_r (struct _reent*, char *, size_t *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vasprintf_r (struct _reent *, char **, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdiprintf_r (struct _reent *, int, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vdprintf_r (struct _reent *, int, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiprintf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfiscanf_r (struct _reent *, FILE *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vfprintf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vfscanf_r (struct _reent *, FILE *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _viprintf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _viscanf_r (struct _reent *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vprintf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 2, 0)))
                                                            ;
int _vscanf_r (struct _reent *, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 2, 0)))
                                                           ;
int _vsiprintf_r (struct _reent *, char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsiscanf_r (struct _reent *, const char *, const char *, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;
int _vsniprintf_r (struct _reent *, char *, size_t, const char *, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsnprintf_r (struct _reent *, char *restrict, size_t, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 4, 0)))
                                                            ;
int _vsprintf_r (struct _reent *, char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__printf__, 3, 0)))
                                                            ;
int _vsscanf_r (struct _reent *, const char *restrict, const char *restrict, __gnuc_va_list) __attribute__ ((__format__ (__scanf__, 3, 0)))
                                                           ;



int fpurge (FILE *);
ssize_t __getdelim (char **, size_t *, int, FILE *);
ssize_t __getline (char **, size_t *, FILE *);


void clearerr_unlocked (FILE *);
int feof_unlocked (FILE *);
int ferror_unlocked (FILE *);
int fileno_unlocked (FILE *);
int fflush_unlocked (FILE *);
int fgetc_unlocked (FILE *);
int fputc_unlocked (int, FILE *);
size_t fread_unlocked (void * restrict, size_t _size, size_t _n, FILE *restrict);
size_t fwrite_unlocked (const void * restrict , size_t _size, size_t _n, FILE *);
# 538 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3
int __srget_r (struct _reent *, FILE *);
int __swbuf_r (struct _reent *, int, FILE *);
# 725 "/opt/devkitARM/arm-none-eabi/include/stdio.h" 3

# 4 "game.c" 2




# 7 "game.c"
int boatRow1 = 104;
int boatRow2 = 120;
int boatRow3 = 136;
int boatRow4 = 152;


void updateBoat(PLAYER *p) {

 if ((!(~(oldButtons)&((1<<6))) && (~buttons & ((1<<6))))) {
  if (p->row > boatRow1) {
   p->row-=16;
  }

 }

 if ((!(~(oldButtons)&((1<<7))) && (~buttons & ((1<<7))))) {
  if (p->row < boatRow4) {
   p->row+=16;
  }
 }




 int pCol = ((p->col) >> 8);
 if ((~(*(volatile unsigned int *)0x04000130) & ((1<<4)))) {
  p->col += p->colAcc;

  if (pCol >= 200) {
   p->col = ((200) << 8);
  }
 } else {
  p->col -= p->colAcc;

  if (pCol == 0) {
   p->active = 0;
  }
 }

}

void updateObstacle(OBSTACLE *o, int frame) {
 if (o->active) {
  if (o->type == 0) {
   o->col -= o->colAcc;
   if (o->hits > 0) {
    if (o->spriteCol == 4) {
     o->spriteCol = 3;
    } else {
     o->spriteCol = 4;
    }
   }
   if (frame % 10 == 0) {
    o->spriteRow++;
    if (o->spriteRow >= 5) {
     o->spriteRow = 1;
    }
   }
   if (o->col <= 0) {
    o->active = 0;
   }
  } else if (o->type == 1) {
   o->col -= o->colAcc;
   if (frame % 10 == 0) {
    o->spriteRow++;
    if (o->spriteRow >= 3) {
     o->spriteRow = 1;
    }
   }
   if (o->col <= 0) {
    o->active = 0;
   }
  } else if (o->type == 2) {
   o->col -= o->colAcc;
   o->row += o->rowAcc;
   if (frame % 10 == 0) {
    o->spriteRow++;
    if (o->spriteRow >= 4) {
     o->spriteRow = 1;
    }
   }
   if (((o->col) >> 8) <= 0 || ((o->row) >> 8) >= 160) {
    o->active = 0;
   }
  }
 }

}






void fireObstacle(OBSTACLE *o, PLAYER *p) {
 if (!o->active) {
  o->active = 1;
  if (o->type == 0) {
   o->col = ((240) << 8);
   o->colAcc = 200;
   o->hits = 0;
   o->spriteCol = 3;
  } else if (o->type == 1) {
   o->col = ((230) << 8);
   o->colAcc = 150;
   o->spriteCol = 5;
   o->hits = 0;
  } else if (o->type == 2) {
   int random = (rand() % 140) + 100;
   o->col = ((random) << 8);
   o->row = ((0) << 8);
   o->colAcc = 200;
   o->rowAcc = 200;
   o->spriteRow = 1;
   o->spriteCol = 6;
  }




  if (o->type == 0 || o->type == 1) {
   int random1 = rand() % 2;
   if (random1 == 0) {
    o->row = ((p->row) << 8);
   } else {
    int random2 = rand() % 4;
    switch(random2) {
     case 0:
      o->row = ((boatRow1) << 8);
      break;
     case 1:
      o->row = ((boatRow2) << 8);
      break;
     case 2:
      o->row = ((boatRow3) << 8);
      break;
     case 3:
      o->row = ((boatRow4) << 8);
      break;
    }
   }


  }

 }
}







void playerObstacleCollision(PLAYER *p, OBSTACLE *o) {
 int obsCol = ((o->col) >> 8);
 int obsRow = ((o->row) >> 8);
 int pCol = ((p->col) >> 8);
 if (p->active == 1 && o->active == 1) {
  if (pCol + p->width >= obsCol && obsCol + o->size >= pCol) {
   if (obsRow + o->size >= p->row && obsRow <= p->row + p->height) {
    if (p->shieldEnable && o->type == 2) {
     o->rowAcc = -200;
     o->spriteCol = 7;
    } else {
     p->active = 0;
    }

   }
  }
 }
}


void fireBullet(BULLET *bullet, PLAYER *p) {
 bullet->active = 1;
 bullet->row = p->row + p->height/2 - 3;
 bullet->col = ((p->col) >> 8) + p->width - 5;
 bullet->spriteCol = 4;
}




void updateBullet(BULLET *bullet) {
 if (bullet->active == 1) {
  bullet->col+=3;
  if (bullet->col >= 240) {
   bullet->active = 0;
   bullet->col = 0;
   bullet->row = 0;
  }
 }
}
# 209 "game.c"
void obstacleBulletCollision(BULLET *b, OBSTACLE *o, PLAYER *p) {
 int obsCol = ((o->col) >> 8);
 int obsRow = ((o->row) >> 8);
 if (o->active == 1 && b->active == 1) {
  if (b->col + b->width >= obsCol && b->col <= obsCol + o->size) {
   if (obsRow + o->size >= b->row && obsRow <= b->row + b->height) {
    if (o->type == 0) {
     if (o->hits == 2) {
      o->active = 0;
      b->active = 0;
      p->kills++;
     } else {
      o->hits++;
      o->spriteCol = 4;
      o->colAcc += 100;
      b->active = 0;
     }
    } else if (o->type == 1) {
     if (o->hits == 8) {
      o->active = 0;
      b->active = 0;
      p->kills++;
     } else {
      o->hits++;
      b->active = 0;
      o->spriteRow = 3;
     }
    }

   }
  }
 }
}
