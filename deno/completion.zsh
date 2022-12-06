completion='$(deno completions zsh)'

if test -f $completion
then
  source $completion
fi
