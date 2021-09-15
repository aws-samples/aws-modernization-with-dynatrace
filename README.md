# Overview

This repo contains the content for the workshop available at https://dynatrace.awsworkshop.io

# Feedback

Whether it's a bug report, new feature, correction, or additional documentation, we greatly value feedback and contributions.

You can share your feedback by opening a `new issue` [here](https://github.com/dt-alliances-workshops/aws-modernization-with-dynatrace/issues)

Please ensure we have all the necessary information to effectively respond to your bug report or contribution such as:
* A reproducible test case or series of steps
* The URL to the page with an issue

# Developer Notes

* Need to use [Hugo 0.71.0](https://github.com/gohugoio/hugo/releases/tag/v0.71.0)
* If you are a MAC you may need to run this command on the hugo binary `xattr -d com.apple.quarantine hugo`
* After forking repo run these commands to initialize the themes

    ```
    git submodule init
    git submodule update
    ```

* To run locally call `hugo server`

# Maintainer

alliances-help@dyntrace.com