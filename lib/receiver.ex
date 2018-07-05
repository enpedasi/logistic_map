defmodule NIFThread.Receiver do
  use GenServer

  def start_link(init_list\\[]) do
    GenServer.start_link(__MODULE__, init_list)
  end

  def init(list) do
    {:ok, list}
  end

  def handle_call(:get, _from, state) do
    {:reply, state, []}
  end

  def handle_info({:push, new_state}, state) do
    IO.inspect server: new_state
    {:noreply, [new_state | state]}
  end
  def handle_info(:ok, state) do
    {:noreply, state}
  end
  def handle_info({:ok, _new_state}, state) do
    {:noreply, state}
  end
  def handle_info(any, state) do
    IO.inspect err: any
    {:noreply, state}
  end

end
