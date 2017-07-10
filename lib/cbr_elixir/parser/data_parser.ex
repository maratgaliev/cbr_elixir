defmodule CbrElixir.Parser.DataParser do
  import SweetXml

  def parse_daily_data(xml) do
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

  def parse_catalog_data(xml) do
    data = xml |> String.replace(~r{<\?xml .*\?>}, "")
    res = data |> xmap(items: [
          ~x[//Valuta/Item]l,
          id: ~x[./@ID]s,
          name: ~x[./Name/text()]s,
          engname: ~x[./EngName/text()]s,
          nominal: ~x[./Nominal/text()]i,
          parentcode: ~x[./ParentCode/text()]s |> transform_by(&String.trim/1),
          ])
    parse_valutes(res)
  end

  def parse_valute_curses(object) do
    data = struct(CbrElixir.Models.ValuteCurses, object)
    valutes = Enum.map(data.valcurs, &parse_valute/1)
    %{data | valcurs: valutes}
  end

  def parse_valute(object) do
    struct(CbrElixir.Models.Valute , object)
  end

  def parse_valutes(object) do
    data = struct(CbrElixir.Models.Valutes, object)
    items = Enum.map(data.items, &parse_item/1)
    %{data | items: items}
  end

  def parse_item(object) do
    struct(CbrElixir.Models.Item , object)
  end
end
