(if nil ; true for auto-complete, false for company
    (progn
      (use-package auto-complete
	:ensure t
	:config
	(require 'auto-complete-config)
	(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
	(ac-config-default))

      (use-package ycmd
	:ensure t
	:config
	(ycmd-setup)))

  (use-package company
    :ensure t
    :config
    (global-company-mode)))

(provide 'my-completion)
