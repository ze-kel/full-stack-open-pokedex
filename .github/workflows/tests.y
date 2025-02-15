name: Testing stuff

on:
  push:
    branches:
      - master

jobs:
  a_test_job:
    runs-on: ubuntu-18.04
    steps:
      - uses: actions/checkout@v2
      - name: gihub context
        env:
          GITHUB_CONTEXT: ${{ toJson(github) }}
        run: echo "$GITHUB_CONTEXT"
      - name: skipcheck
        env:
          COMMITS: ${{ contains(join(toJson(github.event.commits.*.message)), '#skip') }}
        if: ${{ !contains(join(toJson(github.event.commits.*.message)), '#skip') }}
        run: echo "$COMMITS"
