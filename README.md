# sjis-checker
SJISコード指定で生じるトラブルを防ぐためのチェッカーです。

## USAGE

### チェッカーを用意する
```
checker = SjisChecker.new
```

### available?
SJISで使用可能な文字列化を真偽値で返す

```ruby:
checker = SjisChecker.new
checker.available?("sample") #=> true

checker.available?("sample🌟") # SJISでは🌟の使用は不可
=> false
```

### execute(string)
使用できる場合は文字列を、使用できない文字列の場合はnilを返す

```ruby:
checker = SjisChecker.new
checker.execute("🌟")
=> nil
```
