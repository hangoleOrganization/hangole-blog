#!/bin/bash

npm run build
firebase login
firebase deploy --only hosting:hangole-blog