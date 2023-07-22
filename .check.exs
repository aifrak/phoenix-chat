# Override default config from the "ex_check"
# https://github.com/karolsluszniak/ex_check/blob/master/lib/ex_check/config/default.ex
[
  retry: false,
  tools: [
    # —————————————————————————————————————————————— #
    #       Extends curated tools from ex_check      #
    # —————————————————————————————————————————————— #
    {
      :sobelow,
      "mix sobelow.default",
      umbrella: [recursive: true],
      detect: [
        {:package, :sobelow, else: :skip},
        {:package, :phoenix, else: :skip}
      ]
    }
  ]
]
