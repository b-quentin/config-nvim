-- Définir une commande pour exécuter les fichiers avec l'extension .make
vim.cmd [[
  autocmd BufReadPost *.make lua ExecuteMakefile()
]]

-- Définition de la fonction ExecuteMakefile
function ExecuteMakefile()
  -- Appliquer les paramètres spécifiques
  vim.cmd("set noet ci pi sts=0 sw=4 ts=4")
end
