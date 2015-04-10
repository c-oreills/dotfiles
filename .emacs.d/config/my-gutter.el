(use-package linum
  :ensure t
  :config (global-linum-mode 1))

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode 1)
  (after 'linum
    (git-gutter:linum-setup)))

(provide 'my-gutter)
