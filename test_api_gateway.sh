#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Starting API Gateway Test Script${NC}"
echo "----------------------------------------"

# Test regular endpoints
echo -e "${YELLOW}Testing regular endpoints:${NC}"
echo -e "${GREEN}Testing /users endpoint:${NC}"
curl -s http://localhost:8080/users
echo ""

echo -e "${GREEN}Testing /orders endpoint:${NC}"
curl -s http://localhost:8080/orders
echo ""

# Test rate limiting
# echo -e "${YELLOW}Testing rate limiting:${NC}"
# echo -e "${GREEN}Sending 10 rapid requests to /limited-users to trigger rate limiting:${NC}"
# for i in {1..10}; do
#     echo -n "Request $i: "
#     response=$(curl -s -w "%{http_code}" http://localhost:8080/limited-users)
#     http_code=${response: -3}
#     content=${response:0:${#response}-3}
    
#     if [ "$http_code" == "200" ]; then
#         echo -e "${GREEN}Success (200)${NC}"
#     else
#         echo -e "${RED}Rate limited ($http_code)${NC}"
#     fi
#     sleep 0.1
# done

# Test rate limiting
echo -e "${YELLOW}Testing rate limiting:${NC}"
echo -e "${GREEN}Sending 20 rapid requests to /limited-users to trigger rate limiting:${NC}"
for i in {1..20}; do
    echo -n "Request $i: "
    response=$(curl -s -w "%{http_code}" http://localhost:8080/limited-users)
    http_code=${response: -3}
    content=${response:0:${#response}-3}
    
    if [ "$http_code" == "200" ]; then
        echo -e "${GREEN}Success (200)${NC}"
    else
        echo -e "${RED}Rate limited ($http_code)${NC}"
    fi
    # Remove or reduce this sleep to send requests more rapidly
    sleep 0.01
done

echo ""
echo -e "${YELLOW}Testing custom headers:${NC}"
echo -e "${GREEN}Checking if custom header is added:${NC}"
curl -s -v http://localhost:8080/users 2>&1 | grep "X-Custom-Header"

echo ""
echo -e "${YELLOW}Test completed!${NC}"