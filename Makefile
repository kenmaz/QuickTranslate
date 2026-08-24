APP_NAME = QuickTranslate
PROJECT  = $(APP_NAME).xcodeproj
SCHEME   = $(APP_NAME)
BUILD_DIR = build/Release

.PHONY: build install clean

build:
	xcodebuild -project $(PROJECT) \
	           -scheme $(SCHEME) \
	           -configuration Release \
	           CONFIGURATION_BUILD_DIR=$(PWD)/$(BUILD_DIR)

# /Applications/ への設置は project.yml の postBuildScript が build 中に行う。
# ここで rm -rf + cp をやり直すと、中断時に中途半端なアプリが残る。
install: build
	@echo "🔄 起動中..."
	@open /Applications/$(APP_NAME).app

clean:
	rm -rf build
