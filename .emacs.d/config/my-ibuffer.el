(use-package ibuffer
  :ensure t
  :config
  (use-package ibuffer-vc
    :ensure t)
  (after 'evil
    (evil-set-initial-state 'ibuffer-mode 'normal)
    (evil-define-key 'normal ibuffer-mode-map
      (kbd "j") 'evil-next-line
      (kbd "k") 'evil-previous-line
      (kbd "J") 'ibuffer-jump-to-buffer)))

(provide 'my-ibuffer)
