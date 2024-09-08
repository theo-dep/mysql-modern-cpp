CXX = g++
CXXFLAGS = -std=c++23 -O2 -Wall -Wextra -Werror -I.
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
