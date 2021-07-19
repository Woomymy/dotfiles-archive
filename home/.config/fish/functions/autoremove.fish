function autoremove --wraps='paru -Qdtq | paru -Rs -' --description 'alias autoremove paru -Qdtq | paru -Rs -'
  paru -Qdtq | paru -Rs - $argv; 
end
