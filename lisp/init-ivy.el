(require-package 'counsel)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq ivy-display-style 'fancy)

(setq ivy-re-builders-alist
      '((t . ivy--regex-fuzzy)))

(setq ivy-initial-inputs-alist nil)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)


(provide 'init-ivy)
