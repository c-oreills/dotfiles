(add-to-list 'load-path (concat user-emacs-directory "config"))

(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
                         ("org" . "http://orgmode.org/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")))

(require 'package)
(package-initialize)
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(require 'my-core)
(require 'my-evil)
(require 'my-python-mode)
(require 'my-lisp-mode)
(require 'my-flycheck)
(require 'my-gutter)
(require 'my-helm)
(require 'my-paradox)
(require 'my-magit)
(require 'my-completion)
(require 'my-theme)
(require 'my-misc)
