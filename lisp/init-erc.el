(require 'erc)

(setq erc-autojoin-channels-alist '(("freenode.net"
                                     "#org-mode"
                                     "#emacs"
                                     "#emacs-ops"
                                     "#postgresql"
                                     "#sql
                                      ##networking"))
 erc-server "irc.freenode.net"
 erc-nick "pawelbx")

(provide 'init-erc)
