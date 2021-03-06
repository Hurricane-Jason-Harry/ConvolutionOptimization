ifndef TIMES
TIMES:=1
endif

RISCV_CXX:=riscv64-unknown-elf-gcc
RISCV_CXX_FLAGS:= -Wall -O2 -march=RV64IMAFDXhwacha -Wno-format -mhwacha4 -std=c99 -lm -o main

RISCV_SPIKE:= spike --l2=512:8:64 --isa=RV64IMAFDXhwacha pk -c 
ifdef ASSEM
RISCV_CXX_FLAGS= -Wall -O2 -march=RV64IMAFDXhwacha -mhwacha4  -std=c99 -lm -S
endif

X86_CXX:=gcc
X86_CXX_FLAGS:=-Wall -mavx2 -mfma -O2 -std=c99 -fopenmp -lm -ldl -lpthread -o main
CFILES:=src/main.c src/optimizations.c src/utils.c

CMAKE_TEST_FILES:=src/make_test.c
MAKE_TEST_FLAGS:= -Wall -std=c99 -lm -o make_testfile

X86_FLUSH_CACHE_FILES:=src/x86_flush_cache.c
X86_FLUSH_CACHE_FLAGS:= -Wall -std=c99 -O0 -fopenmp -o x86_flush_cache
OPT:=MATCONV_NAIVE
	
all: naive omp simd cb lu rb omp_simd omp_simd_cb \
     omp_simd_cb_lu omp_simd_cb_lu_rb
		 
naive:
	@echo naive:
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_NAIVE
	
omp:
	@echo openmp:
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_OMP
	
simd:
	@echo simd:
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_SIMD
	
cb:
	@echo cacheBlock
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_CB

lu:
	@echo loopUnroll
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_LU
	
rb:
	@echo registerBlock
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_RB
	
omp_simd:
	@echo openmp_simd
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_OMP_SIMD
	
omp_simd_lu:
	@echo openmp_simd_cacheBlock_loopUnroll
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_OMP_SIMD_LU

omp_simd_lu_rb:
	@echo openmp_simd_cacheBlock_loopnUnroll_registerBlock
	@$(MAKE) -s $(ISA)_basic OPT=MATCONV_OMP_SIMD_LU_RB
	
testfile:
	$(X86_CXX) $(MAKE_TEST_FLAGS) $(CMAKE_TEST_FILES)
	./make_testfile

x86_basic:
	$(MAKE) -s clean
	$(X86_CXX) $(X86_CXX_FLAGS) $(CFILES) -D $(OPT)
	$(MAKE) x86_flush_cache
	$(foreach num,$(shell seq 1 $(TIMES)), ./main;)

	
x86_flush_cache:
	$(X86_CXX) $(X86_FLUSH_CACHE_FLAGS) $(X86_FLUSH_CACHE_FILES) 
	./x86_flush_cache
	
riscv_basic:
	$(MAKE) -s clean
	$(RISCV_CXX) $(RISCV_CXX_FLAGS) $(CFILES) -D $(OPT)
	$(RISCV_SPIKE) ./main
	
clean:
	rm -f main make_testfile x86_flush_cache *.o

#@number=1;\
#result=0;\
#while [ $$number -le $(TIMES) ];do\
#		$(MAKE) -s clean;\
#		$(X86_CXX) $(X86_CXX_FLAGS) $(CFILES) -D $(OPT);\
#		$(MAKE) -B -s x86_flush_cache;\
#		output=$$(./main);\
#		result=$$(echo $$output + $$result | bc);\
#		number=$$(($$number+1)); \
#	done;\
#result=$$(echo $$result / $(TIMES) | bc);\
#echo $$result;