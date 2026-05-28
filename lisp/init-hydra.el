(use-package hydra
  :ensure t
  :config
  ;; 1. The "Window Resizer" - Use C-c w to start
  (defhydra hydra-window (:color red :hint nil)
    ("h" shrink-window-horizontally)
    ("l" enlarge-window-horizontally)
    ("k" enlarge-window)
    ("j" shrink-window)
    ("v" split-window-right)
    ("s" split-window-below)
    ("x" delete-window)
    ("o" delete-other-windows)
    ("u" winner-undo)
    ("b" balance-windows)
    ("f" delete-other-windows :color blue)
    ("q" nil :color blue))

  (global-set-key (kbd "C-c w") 'hydra-window/body))

(provide 'init-hydra)
