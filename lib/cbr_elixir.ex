defmodule CbrElixir do

  import CbrElixir.Daily.Parser

  def daily(date \\ nil) do
    period = date || format_date(Timex.today)
    xml = HTTPoison.get!("http://www.cbr.ru/scripts/XML_daily.asp?date_req=#{period}").body
    {:ok, resp} = xml |> Codepagex.to_string("VENDORS/MICSFT/WINDOWS/CP1251")
    parse_data(resp)
  end

  def format_date(datetime) do
    Timex.format!(datetime, "%d/%m/%Y", :strftime)
  end

  def parse_date(datetime) do
    Timex.parse!(datetime, "%d/%m/%Y", :strftime)
  end
end
