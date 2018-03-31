LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE                  := hwcomposer.$(TARGET_BOARD_PLATFORM)

ifneq ($(TARGET_IS_HEADLESS), true)
LOCAL_MODULE_PATH_32          := $(TARGET_OUT_VENDOR)/lib
LOCAL_MODULE_PATH_64          := $(TARGET_OUT_VENDOR)/lib64
endif

LOCAL_MODULE_RELATIVE_PATH    := hw
LOCAL_MODULE_TAGS             := optional
LOCAL_C_INCLUDES              := hardware/qcom/display-caf-msm8992/displayengine/include/ \
                                 hardware/qcom/display-caf-msm8992/libgralloc/ \
                                 hardware/qcom/display-caf-msm8992/libqservice/ \
                                 hardware/qcom/display-caf-msm8992/libqdutils/
LOCAL_CFLAGS                  := -Wno-missing-field-initializers -Wno-unused-parameter \
                                 -Wconversion -Wall -Werror \
                                 -DLOG_TAG=\"SDE\"
LOCAL_SHARED_LIBRARIES        := libsde libqservice libbinder libhardware libhardware_legacy \
                                 libutils libcutils libsync libmemalloc libqdutils
LOCAL_SRC_FILES               := hwc_session.cpp \
                                 hwc_display.cpp \
                                 hwc_display_primary.cpp \
                                 hwc_display_external.cpp \
                                 hwc_display_virtual.cpp \
                                 hwc_debugger.cpp \
                                 hwc_buffer_allocator.cpp \
                                 hwc_buffer_sync_handler.cpp

include $(BUILD_SHARED_LIBRARY)
