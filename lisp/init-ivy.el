(require-package 'counsel)
(require-package 'flx)
(eval-after-load 'counsel
  '(progn
     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
     (setq ivy-count-format "(%d/%d) ")

     (ivy-mode 1)
     (setq ivy-use-virtual-buffers t)
     (setq ivy-count-format "(%d/%d) ")
     (setq ivy-display-style 'fancy)

     (setq ivy-re-builders-alist
           '((swiper . ivy--regex-plus)
             (t . ivy--regex-fuzzy)))

     (global-set-key (kbd "C-s") 'swiper)
     (global-set-key (kbd "M-x") 'counsel-M-x)
     (global-set-key (kbd "C-x C-f") 'counsel-find-file)))


(provide 'init-ivy)
