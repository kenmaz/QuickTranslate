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

install: build
	@echo "📦 /Applications/$(APP_NAME).app にインストール中..."
	@rm -rf /Applications/$(APP_NAME).app
	@cp -R $(BUILD_DIR)/$(APP_NAME).app /Applications/
	@echo "✅ インストール完了！"
	@echo "🔄 起動中..."
	@open /Applications/$(APP_NAME).app

clean:
	rm -rf build
