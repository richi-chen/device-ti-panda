UNIXBENCH_BENCH_APPS :=         \
    bench_ubench_hanoi          \
    bench_ubench_syscall        \
    bench_ubench_context1       \
    bench_ubench_pipe           \
    bench_ubench_spawn          \
    bench_ubench_execl          \
    bench_ubench_looper         \
    bench_ubench_fstime         \
    bench_ubench_arithoh        \
    bench_ubench_register       \
    bench_ubench_short          \
    bench_ubench_int            \
    bench_ubench_long           \
    bench_ubench_float          \
    bench_ubench_double         \
    bench_ubench_dhry2          \
    bench_ubench_dhry2reg       \
    bench_ubench_whetstone-double

LIBMICRO_BENCH_APPS :=          \
    bench_getpid                \
    bench_bind                  \
    bench_cascade_mutex         \
    bench_cascade_fcntl         \
    bench_cascade_flock         \
    bench_chdir                 \
    bench_close                 \
    bench_close_tcp             \
    bench_connection            \
    bench_dup                   \
    bench_exec                  \
    bench_exit                  \
    bench_exp                   \
    bench_fcntl                 \
    bench_fcntl_ndelay          \
    bench_file_lock             \
    bench_fork                  \
    bench_getenv                \
    bench_gettimeofday          \
    bench_getpeername           \
    bench_getrusage             \
    bench_getsockname           \
    bench_isatty                \
    bench_listen                \
    bench_localtime_r           \
    bench_log                   \
    bench_longjmp               \
    bench_lrand48               \
    bench_lseek                 \
    bench_malloc                \
    bench_memcpy                \
    bench_memmove               \
    bench_memrand               \
    bench_memset                \
    bench_mktime                \
    bench_mprotect              \
    bench_mmap                  \
    bench_msync                 \
    bench_munmap                \
    bench_mutex                 \
    bench_nop                   \
    bench_open                  \
    bench_pipe                  \
    bench_poll                  \
    bench_pread                 \
    bench_pthread_create        \
    bench_pwrite                \
    bench_read                  \
    bench_realpath              \
    bench_recurse               \
    bench_select                \
    bench_setsockopt            \
    bench_sigaction             \
    bench_siglongjmp            \
    bench_signal                \
    bench_sigprocmask           \
    bench_socket                \
    bench_socketpair            \
    bench_stat                  \
    bench_strcasecmp            \
    bench_strchr                \
    bench_strcmp                \
    bench_strcpy                \
    bench_strftime              \
    bench_strlen                \
    bench_strtol                \
    bench_system                \
    bench_time                  \
    bench_times                 \
    bench_write                 \
    bench_writev

ZEROXBENCHMARK_NATIVE_APPS :=   \
    $(UNIXBENCH_BENCH_APPS)     \
    $(LIBMICRO_BENCH_APPS)
