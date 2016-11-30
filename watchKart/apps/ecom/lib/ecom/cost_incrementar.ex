defmodule Ecom.CostIncrementar do
#this can be done as a 2nd app in the umbrell aproject
use GenServer
alias Ecom.CostIncrementar


@me __MODULE__
##################
#       API      #
##################

def start_link(default \\ []) do
  GenServer.start_link(@me, default, name: @me)
  #  caller(default)
end

def caller(params) do
    set("price", params["price"])
    set("product_quantity", params["product_quantity"])
end

def set("price", price_value) do
    :ok = GenServer.cast(@me,{:set, "price", price_value})
end

def get("price") do
  GenServer.call(@me,{:get, "price"})
end


def set("product_quantity", qvalue) do
    :ok = GenServer.cast(@me,{:set, "product_quantity", qvalue})
end

def get("product_quantity") do
  GenServer.call(@me,{:get, "product_quantity"})
end



####################################
#       Implementation      #
####################################

def init(args) do
{:ok, %{}}
end


def handle_cast({:set,"price",price_value},state) do
  {v,_} = Float.parse(price_value)
   fv = Float.round((v*1.1),2)

  {  :noreply, Map.put(state,"price",fv)}
end

def handle_call({:get,"price"},_from, state) do
  {:reply, state["price"], state}
end



def handle_cast({:set,"product_quantity",qvalue},state) do
  q=qvalue-1
  {  :noreply, Map.put(state,"product_quantity",q)}
end


def handle_call({:get,"product_quantity"},_from, state) do
  {:reply, state["product_quantity"], state}
end


end


#r CostIncrementar
# alias Ecom.CostIncrementar, as: CI
# CI.set("price", "1024")
# CI.get("price")
# CI.set("product_quantity", "14")
# CI.get("product_quantity")
