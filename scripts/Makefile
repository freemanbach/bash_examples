CC=gcc
CXX=g++
RM=rm -f
CFLAGS=-g -Wall
CPPFLAGS=-g -Wall
# $(shell root-config --cflags)
# LDFLAGS=-g $(shell root-config --ldflags)
# LDLIBS=$(shell root-config --libs)

# SRCS=tool.cc support.cc
# OBJS=$(subst .cc,.o,$(SRCS))

TARGET = helloworld

all: $(TARGET)

$(TARGET): $(TARGET).cpp
		$(CXX) $(CPPFLAGS) -o $(TARGET) $(TARGET).cpp

#tool: $(OBJS)
#    $(CXX) $(LDFLAGS) -o tool $(OBJS) $(LDLIBS)

#tool.o: tool.cc support.hh

#support.o: support.hh support.cc

clean:
	$(RM) $(TARGET)

#distclean: clean
#	$(RM) tool
