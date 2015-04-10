(use-package evil
  :ensure t
  :config
  (use-package evil-jumper
    :ensure t)
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  :config
  (evil-mode 1))

(provide 'my-evil)
