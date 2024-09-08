CXX = g++
CXXFLAGS = -std=c++23 -O2 -Wall -Wextra -Werror -I.
LDFLAGS = -lmysqlclient -lz -lzstd -lssl -lcrypto -lresolv -lm

SRCS = $(wildcard *.cpp)
OBJS = $(SRCS:.cpp=.o)

MYSQL_TARGET = database-mysqlppp

TARGET = test

all: $(MYSQL_TARGET) $(TARGET)

$(TARGET): $(OBJS)
	$(CXX) $(CXXFLAGS) -o $@ $^ $(LDFLAGS)

%.o: %.cpp
	$(CXX) $(CXXFLAGS) -c $< -o $@

$(MYSQL_TARGET): database.sql
	-docker stop $(MYSQL_TARGET)
	-docker rm $(MYSQL_TARGET)
	docker run -d \
		--name $@ \
		-p 3306:3306 \
		-v ./database.sql:/docker-entrypoint-initdb.d/database.sql \
		-e MYSQL_ROOT_PASSWORD=tester \
		mysql:latest \
	> $@

clean:
	docker stop $(MYSQL_TARGET)
	docker rm $(MYSQL_TARGET)
	rm -f $(OBJS) $(TARGET) $(MYSQL_TARGET)

.PHONY: all clean
