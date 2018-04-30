# irsssi setup

This is my irssi setup

## perl path

had to use brew-installed perl

```
/set perl_use_lib = "/usr/local/bin/perl"
```

...which added this to the config:

```
settings = {
  "perl/core" = { perl_use_lib = "= \"/usr/local/bin/perl\""; };
}
```

## awl

needed to install a perl module:

```
$> cpan
cpan> install "Text::CharWidth"
```


