#include <stdexcept>
#include <mylib.hpp>
#include <gtest/gtest.h>

const char *str = "canberk";

TEST(ExceptionContainer, Test1) {
    try {
        exception_container c;
        c.assign(std::runtime_error(str));
        c.raise();
    }
    catch (std::runtime_error &e) {
        EXPECT_STREQ(e.what(), str);
    }
}
