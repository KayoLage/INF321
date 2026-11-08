defmodule HighScore do
# map = %{
#  nome: "Kayo",         # Átomo
#  "idade" => 22,        # String
#  10 => "dez",          # Integer
#  true => "verdadeiro"  # Boolean
#}

  @initial_score 0

  def new() do
    %{}
  end

  # A função é aridade 3, porém o terceiro argumento é opcional, senão fornecido o score = 0
  def add_player(score_map, name, score \\ @initial_score) do
    # para adicionar itens num map, usamos o método Map.put(map, key, value)
    score_map = Map.put(score_map, name, score)
  end

  def remove_player(score_map, name) do
    # para remover usamos Map.delete(map, key)
    score_map = Map.delete(score_map, name)
  end

  def reset_score(score_map, name) do
    # basta sobrescrever o value da key name que já existe no map com Map.put()
    score_map = Map.put(score_map, name, 0)
  end

  def update_score(score_map, name, score) do
    # basta sobrescrever o value da key name que já existe no map com Map.put()
    # mas aqui devemos somar com o value antigo da chave, usamos o método Map.get(map, key)
    old_score = Map.get(score_map, name) # pode ser que o jogador nao exista, neste caso retorna o átomo :nil
    if old_score != :nil do
      new_score = old_score + score
      score_map = Map.put(score_map, name, new_score)
    else
      score_map = Map.put(score_map, name, score)
    end
  end

  def get_players(score_map) do
    Map.keys(score_map)
    # |> IO.inspect
  end
end
