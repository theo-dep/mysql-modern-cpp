CXX = g++
CXXFLAGS = -std=c++11 -O2 -Wall -Wextra -Werror -I. -DNO_STD_OPTIONAL
LDFLAGS = -lmysqlclient -lz -lzstd -lssl -lcrypto -lresolv -lm

SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)

TARGET = test

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)

.PHONY: all clean
