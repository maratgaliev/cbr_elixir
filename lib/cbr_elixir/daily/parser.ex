defmodule CbrElixir.Daily.Parser do
  import SweetXml

  def parse_data(xml) do
    data = xml |> String.replace(~r{<\?xml .*\?>}, "")
    res = data |> xmap(valcurs: [
          ~x[//ValCurs/Valute]l,
          id: ~x[./@ID]s,
          numcode: ~x[./NumCode/text()]s,
          charcode: ~x[./CharCode/text()]s,
          nominal: ~x[./Nominal/text()]i,
          name: ~x[./Name/text()]s,
          value: ~x[./Value/text()]s,
          ])
    parse_valute_curses(res)
  end

  def parse_valute_curses(object) do
    data = struct(CbrElixir.Models.ValuteCurses, object)
    valutes = Enum.map(data.valcurs, &parse_valute/1)
    %{data | valcurs: valutes}
  end

  def parse_valute(object) do
    struct(CbrElixir.Models.Valute , object)
  end
end
