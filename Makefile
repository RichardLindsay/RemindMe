export THEOS_DEVICE_IP=192.168.1.12
export TARGET = iphone:7.0:4.3
export ARCHS = armv7 arm64
include theos/makefiles/common.mk

TWEAK_NAME = RemindMe
RemindMe_FILES = Tweak.xm
RemindMe_FRAMEWORKS = UIKit Foundation

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += sbsettings
SUBPROJECTS += remindme
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
