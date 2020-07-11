# sjis-checker
SJISコード指定で生じるトラブルを防ぐためのチェッカーです。

## USAGE
```ruby:
checker = SjisChecker.new

checker.available?("sample") #=> true

checker.available?("sample🌟") # SJISでは🌟の使用は不可
=> false

# SJISで仕様不可のコードはnilを返す
checker.execute("🌟")
=> nil
```
