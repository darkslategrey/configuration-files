(defun sum-column()
  "Sums a column of numbers starting at point"
  (interactive)
  (save-excursion
    (if (and (not (= (current-column) 0))
	     (re-search-backward "[ \t]" 0 t ))
	(forward-char))
    (let ((retn 0)
	  (old-column (current-column))
	  (old-next-line-add-newlines))
      (setq next-line-add-newlines nil)
      (while (not
	      (looking-at "^[ \t]*$"))
	(move-to-column old-column t)
	(if (and (looking-at "-?[0123456789]+")
		 (eq (current-column) old-column))
		(setq retn (+ retn (string-to-number (current-word)))))
	(forward-line)
	(beginning-of-line))
      (forward-line)
      (forward-line)
      (move-end-of-line 0)
      (insert (make-string (- old-column (current-column)) 32))
      (insert (number-to-string retn))
      (setq next-line-add-newlines old-next-line-add-newlines)
      retn)))

(provide 'cool-stuff)
