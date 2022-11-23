PETSC_DIR=/usr/local/petsc-3.11-mpich
PETSC_ARCH=linux-gnu-dbg32
CFLAGS = -I/usr/include/mpich-3.2-x86_64/ -I${PETSC_DIR}/include -I.
FFLAGS=
CXXFLAGS= -I/usr/include/mpich-3.2-x86_64 -I.
FPPFLAGS=
LOCDIR=
EXAMPLESC=
EXAMPLESF=
MANSEC=
CLEANFILES=
NP=

# USE /usr/local LIBS
include ${PETSC_DIR}/lib/petsc/conf/variables
include ${PETSC_DIR}/lib/petsc/conf/rules
include ${PETSC_DIR}/lib/petsc/conf/test

topopt: main.cc TopOpt.cc LinearElasticity.cc MMA.cc Filter.cc PDEFilter.cc MPIIO.cc
	-${CLINKER} -o topopt main.cc TopOpt.cc LinearElasticity.cc MMA.cc Filter.cc PDEFilter.cc MPIIO.cc  ${PETSC_SYS_LIB}
	${RM}  main.o TopOpt.o LinearElasticity.o MMA.o Filter.o PDEFilter.o MPIIO.o 
	rm -rf *.o

myclean:
	rm -rf topopt *.o output* binary* log* makevtu.pyc Restart* 

