# defmodule CostIncrementar.ProdServer do
#   use GenServer
#
#   @me __MODULE__
#
#   def start_link(low, high) do
#     		GenServer.start(@me, [low, high], name: @me)
#   end
#
#
#   def init( ) do
#
#     {:ok, {}}
#   end
#
#   def handle_call({:guess_number, num}, _from, state) do
#     		cond do
#     			(num<state)  -> IO.puts "low"
#     			{:reply, :low, state}
#     			(num>state)  -> IO.puts "high"
#     			{:reply, :high, state}
#     			true       -> IO.puts "yes!"
#     			{:reply, :correct, state}
#     		end
#   end
#
#   def handle_call({}, _from, {}) do
#   		{:reply,{low, high}, number}
#   end
#
# end
