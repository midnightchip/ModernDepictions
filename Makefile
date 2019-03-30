THEOS_DEVICE_IP ?= 0
THEOS_DEVICE_PORT ?= 2222
TARGET = iphone:clang:11.2:8.0
ARCHS = arm64 armv7
CFLAGS = -include macros.h -fobjc-arc -Wno-deprecated-declarations -Wno-unguarded-availability-new -Wno-non-literal-null-conversion -Wno-comment
LDFLAGS = -ObjC

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = ModernDepictions
ModernDepictions_FILES = Tweak.xm $(wildcard MMMarkdown/*.m ModernDepictions/*.mm Extensions/*.mm)
ModernDepictions_FRAMEWORKS = WebKit
ModernDepictions_LIBRARIES = GoogleMobileAds colorpicker
ModernDepictions_EXTRA_FRAMEWORKS = nanopb GoogleUtilities GoogleMobileAds GoogleAppMeasurement

include $(THEOS_MAKE_PATH)/tweak.mk

install-example:
	@$(THEOS)/bin/dm.pl -Zlzma -b ExamplePackage ExamplePackage.deb
	@cat ExamplePackage.deb | ssh -p$(THEOS_DEVICE_PORT) root@$(THEOS_DEVICE_IP) "cat > /tmp/_.deb; dpkg -i /tmp/_.deb"

SUBPROJECTS += ModernDepictionsPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
