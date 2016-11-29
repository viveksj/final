defmodule Ecom.CostIncrementar do
#this can be done as a 2nd app in the umbrell aproject

use GenServer
alias Ecom.CostIncrementar

@me __MODULE__
##################
#       API      #
##################

def start_link(default \\ []) do
  {:ok, _pid} = GenServer.start_link(@me, default, name: @me)
end

def set(key, value) do
    {fv,_} = Float.parse(value)
     v = Float.round(fv*1.1)
    :ok = GenServer.cast(@me,{:set, key, v})
end

def get(key) do
  GenServer.call(@me,{:get, key})
end

####################################
#       Implementation      #
####################################

def init(args) do
{:ok, %{}}
end

def clear do
    :ok = GenServer.cast(@me, :clear)
end

def handle_cast({:set,key,value},state) do
{
    :noreply, Map.put(state,key,value)
}
end

def handle_cast(:clear, _state) do
    {:noreply, %{}}
  end

def handle_call({:get,key},_from, state) do
  {:reply, state[key], state}
end

end

#Call this using GenServer.start(CostIncrementar, [])
#iex -S mix
#r CostIncrementar
