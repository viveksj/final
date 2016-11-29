defmodule Ecom.CostIncrementar do

#this can be done as a 2nd app in the umbrell aproject

use GenServer

@me __MODULE__
##################
#       API      #
##################

def start_link(default \\ []) do
  GenServer.start_link(__MODULE__, default, name: @me)
end

#I dont know what exactly defualt is. But start_link should give rise to initial state


def set(p_id,id,product_quantity,p_qty,price,p_price) do
  GenServer.cast(@me,{:set, p_id,id,product_quantity,p_qty,price,p_price})
end

def get(p_id,product_quantity,price) do
  GenServer.call(@me,{:get, p_id,product_quantity,price})
end

#Dont need get function for my application. As we only use the GenServer to increment the cose and decrement the product quantity
#But need it initially to display the result

####################################
#       Implementation      #
####################################


def init(args) do
{:ok,
Enum.into(args, %{})
}
end

def handle_cast({:set, p_id,id,product_quantity,p_qty,price,p_price},state) do
  {:noreply,
  # Map.put(state,p_id,id)

  Map.put(state,p_id,id),
  Map.put(state,product_quantity,p_qty),
  Map.put(state,price,p_price)

  # state
  # |> Map.put(p_id,id)
  # |> Map.put(product_quantity,p_qty)
  # |> Map.put(price,p_price)


  #Implement Logic here to convert the price and quantity into number from string and they increment price by 10% and decrement quantity by 1
}
end

def handle_call({:get, p_id,product_quantity,price},_from, state) do
  {:noreply, state[p_id],state[product_quantity],state[price], state}
end



end

#Call this using GenServer.start(CostIncrementar, [])
#iex -S mix
#r CostIncrementar
