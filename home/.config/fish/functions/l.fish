# Defined in - @ line 1
function l --wraps='lsd -lha' --description 'alias l=lsd -lha'
  lsd -lha $argv;
end
