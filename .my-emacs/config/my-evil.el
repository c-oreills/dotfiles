(use-package evil
  :ensure t
  :config
  (use-package evil-jumper
    :ensure t
    :config
    (evil-jumper-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode 1))
  (use-package evil-leader
    :ensure t
    :config
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "e" ())
    )
  :config
  (evil-mode 1)
  (global-evil-leader-mode)
  ; Search by symbols rather than words by default
  (set-default 'evil-symbol-word-search t)
  )

(provide 'my-evil)
