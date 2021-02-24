LOCAL_PATH:=$(call my-dir)

HCX_CFLAGS:=-std=gnu99 -O3 -Wall -Wextra

include $(CLEAR_VARS)
LOCAL_MODULE			:= hcxdumptool
LOCAL_CFLAGS			+= $(HCX_CFLAGS)
LOCAL_SRC_FILES			:= hcxdumptool.c

LOCAL_C_INCLUDES		:= /opt/android-libs/aarch64/include
LOCAL_CFLAGS			+= -L/opt/android-libs/aarch64/lib

PRODUCTION			:= 0
PRODUCTION_VERSION		:= 6.1.5
PRODUCTION_YEAR			:= 2021

ifeq ($(PRODUCTION),1)
VERSION_TAG			:= $(PRODUCTION_VERSION)
else
VERSION_TAG			:= $(shell git describe --tags || echo $(PRODUCTION_VERSION))
endif
VERSION_YEAR			:= $(shell echo $(PRODUCTION_YEAR))

LOCAL_CFLAGS			+= -DVERSION_TAG=\"$(VERSION_TAG)\" -DVERSION_YEAR=\"$(VERSION_YEAR)\"

include $(BUILD_EXECUTABLE)
