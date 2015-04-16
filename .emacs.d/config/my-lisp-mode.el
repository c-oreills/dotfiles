;;; my-lisp-mode.el
;;;
;;; Settings for working with lisps.

(use-package smartparens
  :ensure t
  :config
  (require 'smartparens-config)
  (use-package evil-smartparens
	    :ensure t
	    :config (add-hook 'smartparens-enabled-hook #'evil-smartparens-mode))
  (add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
  (after 'evil
    (evil-define-key 'normal smartparens-mode-map
      (kbd ">") 'sp-forward-slurp-sexp
      (kbd "<") 'sp-forward-barf-sexp
      (kbd "C-<") 'sp-backward-slurp-sexp
      (kbd "C->") 'sp-backward-barf-sexp)))

(use-package elisp-slime-nav
  :ensure t
  :config
  (after 'evil
    (evil-define-key 'normal emacs-lisp-mode-map (kbd "K")
      'elisp-slime-nav-describe-elisp-thing-at-point))
  (progn
    (defun my-lisp-hook ()
      (elisp-slime-nav-mode)
      (eldoc-mode))
    (add-hook 'emacs-lisp-mode-hook 'my-lisp-hook)))


(provide 'my-lisp-mode)
