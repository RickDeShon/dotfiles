;;; .emacs --- geo's emacs
;;; Code:
;;; Commentary:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t))

(package-initialize)

; -----------------------------------------------------------------------------
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(ansi-term-color-vector
   [unspecified "#FFFFFF" "#d15120" "#5f9411" "#d2ad00" "#6b82a7" "#a66bab" "#6b82a7" "#505050"])
 '(battery-mode-line-limit 90)
 '(custom-safe-themes
   (quote
    ("4606323118a4398021de28bec4b63905167be2b44b8e16ee275e4e6a4b78c2f8" "3ce68833fa9c36c1bfbbe0cf5b3c076f16d83e5da0ebab6397aaebb97bfffb17" "006e42c207afe260ff710ea6e9618462787ba7d7171298b7fe116ac7e0196c72" "020afe4a89445ee958c9b9ed904e00c37ba9e8bcf7a5223dbacfedac4aa16249" "16dd114a84d0aeccc5ad6fd64752a11ea2e841e3853234f19dc02a7b91f5d661" "e34496b6cb6d1364616a0c2e41d41648648c1d950af82a30858901a0a1c6805a" "f380fd03bab460c7ab257896fcf13c54052e6258bdb54e54246fd07e4923273b" "c1390663960169cd92f58aad44ba3253227d8f715c026438303c09b9fb66cdfb" default)))
 '(display-battery-mode t)
 '(evil-indent-convert-tabs t)
 '(fci-rule-character-color "#d9d9d9")
 '(fci-rule-color "#d9d9d9")
 '(global-hl-line-mode t)
 '(ido-mode (quote both) nil (ido))
 '(indent-tabs-mode nil)
 '(initial-buffer-choice t)
 '(js-indent-level 2)
 '(js2-missing-semi-one-line-override t)
 '(js2-mode-show-parse-errors nil)
 '(js2-strict-missing-semi-warning nil)
 '(mac-auto-operator-composition-mode t)
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (crystal-mode cargo flycheck-rust rust-mode company-mode company github-browse-file github-browse-commit browse-at-remote dockerfile-mode markdown-mode flycheck-status-emoji elixir-mode flycheck rjsx-mode prettier-js projectile-rails projectile bind-map magit key-chord helm zoom-frm yasnippet yaml-mode writeroom-mode which-key web-mode use-package twilight-bright-theme spaceline-all-the-icons smex smart-mode-line slim-mode sass-mode ruby-refactor ruby-end rspec-mode robe powerline-evil paradox magithub lua-mode ledger-mode keychain-environment json-mode js2-mode helm-rails helm-projectile helm-dash helm-ag go-mode git-timemachine geo-light-2-theme font-lock+ flycheck-elixir flycheck-dialyzer flycheck-credo flycheck-color-mode-line flx-ido exec-path-from-shell evil-rails evil-org evil-matchit evil-magit evil-leader elixir-mix drag-stuff discover-my-major discover diminish coffee-mode base16-theme all-the-icons-dired alchemist ag adoc-mode)))
 '(paradox-github-token t)
 '(rich-minority-mode t)
 '(rspec-use-bundler-when-possible t)
 '(tool-bar-mode nil)
 '(web-mode-code-indent-offset 2)
 '(web-mode-css-indent-offset 2)
 '(web-mode-enable-auto-closing nil)
 '(web-mode-enable-auto-opening nil)
 '(web-mode-enable-auto-pairing nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:weight normal :height 140 :width normal :foundry "nil" :family "PragmataPro Liga")))))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t
      make-backup-files nil
      indent-tabs-mode nil
      ns-use-native-fullscreen nil
      ad-redefinition-action 'accept
      backup-directory-alist `((".*" . ,temporary-file-directory))
      auto-save-file-name-transforms `((".*" ,temporary-file-directory t))
      tooltip-use-echo-area t
      blink-cursor-blinks 0                ; blink cursor forever
      global-hl-line-mode t                ; highlight current row
      show-paren-mode t
      mac-auto-operator-composition-mode t ; get ligatures on those fonts, yo!
      use-package-always-ensure t          ; make use-package install packages
      js-indent-level 2
      mac-option-modifier 'super           ; make opt key do Super
      create-lockfiles nil)

(eval-when-compile
  (require 'use-package))
(setq use-package-verbose t
      use-package-always-ensure t)

(add-to-list 'load-path "~/.emacs.d/config/")
(add-to-list 'load-path "~/.emacs.d/lisp/")

(use-package geo-evil :ensure nil)
(use-package geo-code-style :ensure nil)
(use-package geo-helm :ensure nil)
(use-package geo-ruby :ensure nil)
(use-package geo-js :ensure nil)
(use-package geo-look-and-feel :ensure nil)

(use-package key-chord
  :config
  (key-chord-mode 1)
  (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
  (key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
  (key-chord-define evil-normal-state-map "''" 'helm-M-x))

(use-package magit
  :bind (
  ("C-x g" . magit-status)))
(use-package evil-magit)
(use-package github-browse-file)
(use-package projectile
  :config
  (projectile-mode))

(use-package elixir-mode
  :config
  (use-package alchemist
    :config
    (add-to-list 'elixir-mode-hook 'alchemist-mode)
    )
  )

(use-package rust-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  (setq rust-format-on-save t))

(use-package yasnippet
  :diminish yas-minor-mode
  :config
  (setq yas-snippet-dirs '("~/bin/dotfiles/emacs/snippets"))
  (yas-global-mode 1)
  )

(use-package ag
  :config
  (use-package helm-ag)
  )

(use-package exec-path-from-shell
  :config
  (setq exec-path-from-shell-variables (quote ("PATH")))
  (exec-path-from-shell-initialize)
  )

(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
  )

(use-package yaml-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
  )

(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.eex\\'" . web-mode))
  )

(use-package geo-keyboard-overrides :ensure nil)
