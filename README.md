# sjis-checker
SJISコード指定で生じるトラブルを防ぐためのチェッカーです。
 

## USAGE

### 準備
`sjis_checker.rb`と`checker_mode.rb`は同一もディレクトリに配置してください。


チェッカーを使用したいファイルに以下を追記してください。

```
require "[PATH]/sjis＿checker.rb"
```


### チェッカーを用意する
```
checker = SjisChecker.new
```

### available?
SJISで使用可能な文字列か否かを真偽値で返す

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

## 置換モード

置換モードに設定すると、executeの返り値が、SJISで使用できない文字を ？ で置換したものになります。

```
replacer = SjisChecker.new(CheckerMode::Replace)
```

```
replacer.execute("🌟")
=> "?"
```


