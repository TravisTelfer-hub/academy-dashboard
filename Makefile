encrypt:
	python3 scripts/encrypt/encrypt_public.py

encrypt-show:
	python3 scripts/encrypt/encrypt_public.py --show

publish: encrypt
	git add public && git commit -m "Snapshot update" && git push
