; extends

((identifier) @keyword.coroutine
  (#eq? @keyword.coroutine "Promise")
  (#set! priority 200))
