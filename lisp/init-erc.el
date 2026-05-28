(use-package erc
  :ensure nil
  :custom
  (erc-nick "pawelb")
  (erc-autojoin-channels-alist '(("libera.chat" "#emacs" "#ruby" "#org-mode" "#emacs-ops" "#postgresql" "freenode.net")))
  (erc-interpret-mirc-color t)
  (erc-hide-list '("JOIN" "PART" "QUIT"))
  (erc-insert-timestamp-function 'erc-insert-timestamp-left) 
  (erc-header-line-format nil))

(provide 'init-erc)
