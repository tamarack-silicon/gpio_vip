# Verification IP dependency in 'ip' folder
IP_DEP := 

# Verification IP dependency in same folder as current ip
REPO_DEP := 

# Testbench top level module name
TESTS_TOP_NAME := gpio_vip_tests_top

# Default test name
TEST := gpio_vip_single_base_test

include ip/flows/verification-ip.mk
