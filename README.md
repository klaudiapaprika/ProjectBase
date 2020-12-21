# iOS Intermed Lesson 1 MVVM vs VIPER. iOS Enterprise architectures comparison

## **Make a MVVM-C app:**
  * hardcoded login with creds user/123qwe checked by viewmodel
  * navigates to list of stings fetched from
  * https://www.random.org/strings/?num=10&len=8&digits=on&upperalpha=on&loweralpha=on&unique=on&format=plain&rnd=new
  * protocol binding
  * unit tests for:
    + ViewModels,
    + FlowController,
    + Network Request (Correct Url + Parsing of template contract test, not an API test!)


# iOS Intermed Lesson4 Fastlane & Jenkins

## **Create a Fastlane build script for Homework #1:**
- Message to hipchat/slack/etc “Started building $targetName $branchName $version”
- Build
- Run tests
- Message “Built $targetName $branchName $version”

## **OPTIONAL (Setup Jenkins for it)**

- Jenkins setup detailed https://www.guru99.com/jenkins-github-integration.html
- Fastlane:
  - Setup https://docs.fastlane.tools/getting-started/ios/setup/
  - Running tests https://docs.fastlane.tools/getting-started/ios/running-tests/
  - Beta deployment & distribution https://docs.fastlane.tools/getting-started/ios/beta-deployment/
  - Appstore https://docs.fastlane.tools/getting-started/ios/appstore-deployment/
