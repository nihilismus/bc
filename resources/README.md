# Overview

Today we're going to build a new microservice which will be part of our next generation media delivery platform.

You may use any online resource you want during the exercise.

# Background

Most online video delivery today uses a variant of a "segmented" (chunked) delivery technology.

In segmented delivery, the video player first requests a Manifest file, which contains a list of the URLs of small chunks of media for the player to play, and the duration of each of those segments.

The delivery technology we're using is called "HTTP Live Streaming" (HLS). Here are some examples of some manifests.

1. [2 Second segments](./cucumber/fixtures/expected-manifest-2s-seg.m3u8)
2. [10 Second segments](./cucumber/fixtures/expected-manifest-10s-seg.m3u8).

We're going to build a microservice which generates these HLS manifest files based on some metadata.

<sup>If you want to know more about HLS, [read the Apple developer's guide, here](https://developer.apple.com/library/ios/documentation/NetworkingInternet/Conceptual/StreamingMediaGuide/Introduction/Introduction.html), or [the latest specification here](https://tools.ietf.org/html/draft-pantos-http-live-streaming-19).</sup>

# Task 1

Create and setup a web server on port ":8080". Please do this in the language you feel most comfortable. Seriously, please. 

Then, create a single endpoint "/healthcheck" that returns a body "ok" with "Content-Type":"text/plain". 

To make sure everything is working correctly, run `./test.sh task1` script found in the zip file given to you.  

This is the end of the initial setup. When you come in for the intervew, we will be giving you additional tasks to complete. 

