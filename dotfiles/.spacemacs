;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(csv
     shell-scripts
     javascript
     yaml
     html
     helm
     haskell
     ;;(keyboard-layout :variables kl-layout 'colemak-hnei)
     (auto-completion :variables
                      spacemacs-default-company-backends
                      '(company-files company-capf ein:company-backend))
     emacs-lisp
     google-calendar
     bibtex
     ipython-notebook
     (mu4e :variables mu4e-account-alist t)
     ;;(elfeed :variables rmh-elfeed-org-files (list "~/Dropbox/Org/RSS.org"))
     git
     markdown
     python
     pdf-tools
     org
     (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)
     themes-megapack
     spell-checking
     syntax-checking
     vinegar
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      (stylus-mode :location (recipe :fetcher github :repo "vladh/stylus-mode"))
                                      (ereader :location (recipe :fetcher github :repo "bddean/emacs-ereader"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(adaptive-wrap)
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(gotham
                         sanityinc-tomorrow-night
                         gruvbox
                         spacemacs-dark)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro" 
                               :size 30
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non-nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non-nil the paste micro-state is enabled. When enabled pressing `p'
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil
   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling nil
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   dotspacemacs-frame-title-format "%I@%S"
   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."

  ;; General
  (setq vc-follow-symlinks t) ;; Always follow symlinks. 

  ;; HiDPI. Make both fringes 18 pixels wide
  (fringe-mode 18)
  (define-fringe-bitmap 'right-arrow
    (vector #b000000000000000000
            #b000000000000000000
            #b000000000001110000
            #b000000000000111000
            #b000000000000011100
            #b000000000000001110
            #b111111111111111111
            #b111111111111111111
            #b111111111111111111
            #b000000000000001110
            #b000000000000011100
            #b000000000000111000
            #b000000000001110000
            #b000000000000000000
            #b000000000000000000
            #b000000000000000000
            #b000000000000000000))

  ;; Org Mode
  (setq org-startup-indented t)
  (setq org-todo-keywords
        '((sequence "TODO" "|" "DONE" "CANCELED")))
  (setq evil-org-key-theme '(textobjects navigation additional insert todo))
  (setq org-default-priority ?C)
  (setq org-lowest-priority ?G)
  (setq org-time-clocksum-format '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))


  ;; Fancy custom syntax highlighting of quoted strings!
  ;; (add-hook 'org-mode-hook
  ;;           (lambda ()
  ;;             (font-lock-add-keywords nil '(("\".*?\"" 1 font-lock-constant-face t)
  ;;                                           ("'.*?'" 1 font-lock-doc-face t)))))

  (defun org-journal-new-entry ()
    "Inserts header with inactive timestamp, hours and minutes. 
A custom journal helper function."
    (interactive)
    (org-insert-heading)
    (org-insert-time-stamp (current-time) t t))

  ;; Enable visual-line-mode by default in Org Mode. 
  (add-hook 'org-mode-hook 'visual-line-mode)
  ;; Make evil-mode up/down operate in screen lines instead of logical lines
  (define-key evil-normal-state-map "j" 'evil-next-visual-line)
  (define-key evil-normal-state-map "k" 'evil-previous-visual-line)
  ;; Also in visual mode
  (define-key evil-visual-state-map "j" 'evil-next-visual-line)
  (define-key evil-visual-state-map "k" 'evil-previous-visual-line)

  ;; Org Code Execution
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python . t)
     (haskell . t)
     (emacs-lisp . t)))

  ;; Org Calendar and Diary
  (setq diary-file "~/Dropbox/Org/diary")
  (setq org-agenda-include-diary t)
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (calendar-set-date-style 'iso)))
  (add-hook 'diary-mode-hook 'diary-fancy-display-mode)

  ;; Google Calendar
  (setq org-gcal-up-days 0)
  (setq org-gcal-client-id "812416789443-us4rbfjj1h9t2o2ds0fvqcgrvb60bi2h.apps.googleusercontent.com"
        org-gcal-file-alist '(("jon.reeve@gmail.com" . "/home/jon/Dropbox/Org/Projects/schedule.org"))
        cfw:org-capture-template '("s" "Scedule an event" entry
                                   (file "/home/jon/Dropbox/Org/Projects/schedule.org")
                                   "* %^{Description}\n%^{LOCATION}p\n%(cfw:org-capture-day)\n%?"))

  ;; Load from .authinfo. Adapted from https://github.com/myuhe/org-gcal.el/issues/47
  (require 'netrc)
  (defun get-authinfo (host port)
    (let* ((netrc (netrc-parse (expand-file-name "~/.authinfo")))
           (hostentry (netrc-machine netrc host port port)))
      (when hostentry (netrc-get hostentry "password"))))

  (setq org-gcal-client-secret (get-authinfo "gcal.api" "9999"))

  (setq org-modules '(org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-rmail org-w3m org-protocol))

  ;; My Autolinks mode. 
  ;;(load-file "~/.emacs.d/private/org-autolinks/autolinks-mode.el")

  ;; Org Agenda
  (setq org-agenda-files (list "~/Dropbox/Org/Projects/"))
  (setq org-refile-targets '((nil :maxlevel . 9)
                             (org-agenda-files :maxlevel . 9)))
  (setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
  (setq org-refile-use-outline-path t)                  ; Show full paths for refiling

  ;; Adapted from http://stackoverflow.com/a/12751732/584121
  (server-start)
  (require 'org-protocol)
  (setq org-protocol-default-template-key "l")
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "/home/jon/Dropbox/Org/notes.org" "Tasks")
           "* TODO %?  %i\n  %a")
          ("m" "Movie" entry (file+headline "/home/jon/Dropbox/Org/movies.org" "To Watch")
           "* %a\n %?\n %i")
          ("l" "Link" entry (file+olp "/home/jon/Dropbox/Org/notes.org" "Web Links")
           "* %a\n %?\n %i")))

  ;; Disable holidays. Is there an easier way of doing this? 
  (setq holiday-christian-holidays nil)
  (setq holiday-islamic-holidays nil)
  (setq holiday-bahai-holidays nil)
  (setq holiday-oriental-holidays nil)
  (setq holiday-hebrew-holidays nil)

  ;; Bibliography
  (setq reftex-default-bibliography '("~/Dropbox/Papers/library.bib"))
  (setq org-ref-default-bibliography '("~/Dropbox/Papers/library.bib")
        org-ref-pdf-directory "~/Dropbox/Papers" ;; keep the final slash off
        org-ref-bibliography-notes "~/Dropbox/Org/Projects/books.org"
        bibtex-completion-pdf-field "file"
        org-ref-get-pdf-filename-function 'org-ref-get-zotero-pdf-filename)

  (setq org-ref-note-title-format
    "** TODO %y - %t
 :PROPERTIES:
  :Custom_ID: %k
  :AUTHOR: %9a
  :JOURNAL: %j
  :YEAR: %y
 :END:
")

  (defun org-ref-get-zotero-pdf-filename (key)
    "Return the pdf filename indicated by zotero file field.
Argument KEY is the bibtex key."
    (let* ((results (org-ref-get-bibtex-key-and-file key))
           (bibfile (cdr results))
           entry)
      (with-temp-buffer
        (insert-file-contents bibfile)
        (bibtex-set-dialect (parsebib-find-bibtex-dialect) t)
        (bibtex-search-entry key nil 0)
        (setq entry (bibtex-parse-entry))
        (let ((e (org-ref-reftex-get-bib-field "file" entry)))
          (if (> (length e) 4)
              (let ((clean-field (replace-regexp-in-string "/+" "/" e)))
                (let ((first-file (car (split-string clean-field ";" t))))
                  (concat org-ref-pdf-directory first-file)))
            (message "PDF filename not found.")
            )))))

  ;; Override this function. 
  (defun org-ref-open-bibtex-pdf ()
    "Open pdf for a bibtex entry, if it exists.
assumes point is in
the entry of interest in the bibfile.  but does not check that."
    (interactive)
    (save-excursion
      (bibtex-beginning-of-entry)
      (let* ((bibtex-expand-strings t)
             (entry (bibtex-parse-entry t))
             (key (reftex-get-bib-field "=key=" entry))
             (pdf (org-ref-get-zotero-pdf-filename key)))
        (message "%s" pdf)
        (if (file-exists-p pdf)
            (org-open-link-from-string (format "[[file:%s]]" pdf))
          (ding)))))

  (setq neo-theme 'nerd)

  ;; Jupyter
  (setq ein:use-auto-complete t)
  ;; Or, to enable "superpack" (a little bit hacky improvements):
  (setq ein:use-auto-complete-superpack t)
  ;; More autocomplete for jupyter 
  ;;(add-to-list 'company-backends #'user-company-ein-backend)

  (spacemacs|add-company-backends
   :backends ein:company-backend
   :modes ein:notebook-mode)

  ;; Markdown 
  (add-hook 'markdown-mode 'visual-line-mode)

  ;; Mail 
  ;; Send email via Gmail:
  ;;        smtpmail-smtp-service 25)
  (setq smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        message-send-mail-function 'smtpmail-send-it
        smtpmail-default-smtp-server "smtp.gmail.com")

  (add-hook 'mu4e-view-mode-hook 'visual-line-mode)
  (setq mu4e-html2text-command "w3m -T text/html")

  ;; configure orgmode support in mu4e
  ;; (require 'org-mu4e)
  ;; when mail is sent, automatically convert org body to HTML
  (setq org-mu4e-convert-to-html t)

  ;; Better looking HTML mail
  ;; (setq shr-color-visible-luminance-min 80)
  ;; (setq shr-use-colors nil)

  (setq mu4e-contexts
        `( ,(make-mu4e-context
             :name "Gmail"
             :enter-func (lambda () (mu4e-message "Switch to Gmail."))
             ;; leave-func not defined
             :match-func (lambda (msg)
                           (when msg
                             (mu4e-message-contact-field-matches msg
                                                                 :to "jon.reeve@gmail.com")))
             :vars '(  ( user-mail-address  . "jon.reeve@gmail.com" )
                       ( user-full-name     . "Jonathan Reeve" )
                       ( mu4e-sent-folder   . "/gmail/[Gmail]/.Sent Mail" )
                       ( mu4e-drafts-folder . "/gmail/[Gmail]/.Drafts" )
                       ( smtpmail-smtp-user . "jon.reeve" )

                       ;; ( mu4e-compose-signature .
                       ;;                          (concat
                       ;;                           "Alice Derleth\n"
                       ;;                           "Lauttasaari, Finland\n"))
                       ))
           ,(make-mu4e-context
             :name "Columbia"
             :enter-func (lambda () (mu4e-message "Switch to Columbia."))
             ;; leave-fun not defined
             :match-func (lambda (msg)
                           (when msg
                             (or 
                              (mu4e-message-contact-field-matches msg
                                                                  :to "jonathan.reeve@columbia.edu")
                              (mu4e-message-contact-field-matches msg
                                                                  :to "jpr2152@columbia.edu"))
                             ))
             :vars '(  ( user-mail-address   . "jonathan.reeve@columbia.edu" )
                       ( user-full-name      . "Jonathan Reeve" )
                       ( mu4e-sent-folder    . "/columbia/[Gmail]/.Sent Mail" )
                       ( mu4e-drafts-folder  . "/columbia/[Gmail]/.Drafts" )
                       ( smtpmail-smtp-user  . "jpr2152@columbia.edu" )

                       ;; ( mu4e-compose-signature .
                       ;;                          (concat
                       ;;                           "Prof. Alice Derleth\n"
                       ;;                           "Miskatonic University, Dept. of Occult Sciences\n"))
                       ))))

  ;; start with the first (default) context;
  ;; default is to ask-if-none (ask when there's no context yet, and none match)
  (setq mu4e-context-policy 'pick-first)

  ;; compose with the current context is no context matches;
  ;; default is to ask
  (setq mu4e-compose-context-policy nil)

  (setq mu4e-maildir "~/Mail"
        mu4e-trash-folder "/Trash"
        mu4e-refile-folder "/Archive"
        mu4e-get-mail-command "mbsync -a"
        mu4e-update-interval 900
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        mu4e-compose-dont-reply-to-self t)

  ;; Bookmarks
  (setq mu4e-bookmarks
        `(("flag:unread AND NOT flag:trashed" "Unread messages" ?u)
          ("date:7d..now NOT flag:trashed AND NOT flag:replied" "Last 7 days unreplied" ?w)
          ("maildir:/columbia/Inbox NOT flag:trashed AND NOT flag:replied" "Columbia" ?c)
          ("maildir:/gmail/Inbox NOT flag:trashed AND NOT flag:replied" "Gmail" ?g)
          ("maildir:/gmail/Lists NOT flag:trashed AND NOT flag:replied" "Lists" ?l)))

  ;; RSS
  (eval-after-load 'shr
    '(progn (setq shr-width -1)
            (defun shr-fill-text (text) text)
            (defun shr-fill-lines (start end) nil)
            (defun shr-fill-line () nil)))
  (add-hook 'elfeed-show-mode-hook 'visual-line-mode)

  )
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(auth-source-save-behavior nil)
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#373b41" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(org-agenda-files
   (quote
    ("~/Dropbox/Org/Projects/books.org" "/home/jon/Dropbox/Org/Projects/orals.org" "/home/jon/Dropbox/Org/Projects/DH Box.org" "/home/jon/Dropbox/Org/Projects/Joyce TEI.org" "/home/jon/Dropbox/Org/Projects/Middlemarch.org" "/home/jon/Dropbox/Org/Projects/University Writing.org" "/home/jon/Dropbox/Org/Projects/annotags.org" "/home/jon/Dropbox/Org/Projects/chapters.org" "/home/jon/Dropbox/Org/Projects/late style.org" "/home/jon/Dropbox/Org/Projects/macro-etym.org" "/home/jon/Dropbox/Org/Projects/prospectus.org" "/home/jon/Dropbox/Org/Projects/schedule.org" "/home/jon/Dropbox/Org/Projects/todo.org")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-habit org-info org-irc org-mhe org-protocol org-rmail org-w3m org-wikinodes)))
 '(package-selected-packages
   (quote
    (stylus-mode spinner hydra parent-mode projectile flx iedit anzu goto-chg highlight powerline popwin request diminish pkg-info epl bind-map bind-key packed f s avy popup csv-mode undo-tree xml+ insert-shebang flycheck-bashate fish-mode company-shell autothemer window-purpose imenu-list async org-brain impatient-mode evil-org ereader org-notebook add-node-modules-path request-deferred ht helm-bibtex alert log4e gntp intero hlint-refactor hindent helm-hoogle parsebib haskell-snippets haml-mode gitignore-mode flyspell-correct pos-tip flycheck-haskell magit-popup git-commit simple-httpd ace-jump-mode noflet websocket dante web-completion-data company-ghci company-ghc ghc haskell-mode company-cabal cmm-mode biblio biblio-core anaconda-mode pythonic auto-complete password-generator key-chord evil-lion editorconfig ivy company elfeed smartparens evil flycheck helm helm-core yasnippet markdown-mode deferred org-plus-contrib magit with-editor dash pdf-tools tablist livid-mode json-mode js2-refactor company-tern dash-functional web-beautify skewer-mode json-snatcher json-reformat multiple-cursors js2-mode js-doc tern coffee-mode zonokai-theme zenburn-theme zen-and-art-theme yapfify yaml-mode xterm-color ws-butler winum white-sand-theme which-key web-mode volatile-highlights vi-tilde-fringe uuidgen use-package underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toc-org tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit symon sunny-day-theme sublime-themes subatomic256-theme subatomic-theme string-inflection spaceline spacegray-theme soothe-theme solarized-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode sass-mode reverse-theme restart-emacs rebecca-theme rainbow-delimiters railscasts-theme pyvenv pytest pyenv-mode py-isort purple-haze-theme pug-mode professional-theme planet-theme pip-requirements phoenix-dark-pink-theme phoenix-dark-mono-theme persp-mode pcre2el pastels-on-dark-theme paradox orgit organic-green-theme org-ref org-projectile org-present org-pomodoro org-gcal org-download org-bullets open-junk-file omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme noctilux-theme niflheim-theme neotree naquadah-theme mustang-theme multi-term mu4e-maildirs-extension mu4e-alert move-text monokai-theme monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme material-theme markdown-toc majapahit-theme magit-gitflow madhat2r-theme macrostep lush-theme lorem-ipsum live-py-mode linum-relative link-hint light-soap-theme less-css-mode jbeans-theme jazz-theme ir-black-theme inkpot-theme info+ indent-guide hy-mode hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation hide-comnt heroku-theme hemisu-theme help-fns+ helm-themes helm-swoop helm-pydoc helm-purpose helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-css-scss helm-company helm-c-yasnippet helm-ag hc-zenburn-theme gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme fuzzy flyspell-correct-helm flycheck-pos-tip flx-ido flatui-theme flatland-theme firebelly-theme fill-column-indicator farmhouse-theme fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu espresso-theme eshell-z eshell-prompt-extras esh-help emmet-mode elisp-slime-nav elfeed-web elfeed-org elfeed-goodies ein dumb-jump dracula-theme django-theme define-word darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cython-mode cyberpunk-theme company-web company-statistics company-anaconda column-enforce-mode color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized clues-theme clean-aindent-mode cherry-blossom-theme calfw busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet auto-highlight-symbol auto-dictionary auto-compile apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes aggressive-indent afternoon-theme ace-window ace-link ace-jump-helm-line ac-ispell)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
) 
