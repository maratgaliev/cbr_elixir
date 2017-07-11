defmodule CbrElixir do

  import CbrElixir.Parser.DataParser

  def daily(date \\ nil) do
    period = date || format_date(Timex.today)
    xml = HTTPoison.get!("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{period}").body
    {:ok, resp} = xml |> Codepagex.to_string("VENDORS/MICSFT/WINDOWS/CP1251")
    parse_daily_data(resp)
  end

  def daily_by_code(code, date \\ nil) do
    List.first(Enum.filter(daily(date).valcurs, fn(v) -> v.charcode == to_string(code) end))
  end

  def valute_catalog do
    xml = HTTPoison.get!("http://www.cbr.ru/scripts/XML_val.asp").body
    {:ok, resp} = xml |> Codepagex.to_string("VENDORS/MICSFT/WINDOWS/CP1251")
    parse_catalog_data(resp)
  end

  def format_date(datetime) do
    Timex.format!(datetime, "%d/%m/%Y", :strftime)
  end

  def parse_date(datetime) do
    Timex.parse!(datetime, "%d/%m/%Y", :strftime)
  end
end
