; extends

((type_identifier) @keyword.coroutine
  (#eq? @keyword.coroutine "Promise")
  (#set! priority 200))

((identifier) @keyword.coroutine
  (#eq? @keyword.coroutine "Promise")
  (#set! priority 200))
