# CBR Elixir

**http://fucking-great-advice.ru Central Bank of the Russian Federation API Elixir wrapper**

## Installation

The package can be installed from hex:

1. Add `cbr_elixir` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:cbr_elixir, "~> 0.1.1"}]
end
```

2. Ensure `cbr_elixir` is started before your application:

```elixir
def application do
  [applications: [:cbr_elixir]]
end
```

3. Get daily data (for today's date):

```elixir
iex(1)> CbrElixir.daily
  %CbrElixir.Models.ValuteCurses{valcurs: [%CbrElixir.Models.Valute{charcode: "AUD",
     id: "R01010", name: "Австралийский доллар", nominal: 1,
     numcode: "036", value: "45,8701"},
    %CbrElixir.Models.Valute{charcode: "AZN", id: "R01020A",
     name: "Азербайджанский манат", nominal: 1,
     numcode: "944", value: "35,4713"},
    %CbrElixir.Models.Valute{charcode: "GBP", id: "R01035",
     name: "Фунт стерлингов Соединенного королевства",
     nominal: 1, numcode: "826", value: "78,2273"}
```

4. Get data for specific date:

```elixir
iex(1)> CbrElixir.daily("03.08.2014")
  %CbrElixir.Models.ValuteCurses{valcurs: [%CbrElixir.Models.Valute{charcode: "AUD",
     id: "R01010", name: "Австралийский доллар", nominal: 1,
     numcode: "036", value: "43,9016"},
    %CbrElixir.Models.Valute{charcode: "AZN", id: "R01020A",
     name: "Азербайджанский манат", nominal: 1,
     numcode: "944", value: "57,4120"},
    %CbrElixir.Models.Valute{charcode: "GBP", id: "R01035",
     name: "Фунт стерлингов Соединенного королевства",
     nominal: 1, numcode: "826", value: "93,9403"},
```

## License

    Copyright © 2017 Marat Galiev <kazanlug@gmail.com>

    This work is free. You can redistribute it and/or modify it under the
    terms of the MIT License. See the LICENSE file for more details.