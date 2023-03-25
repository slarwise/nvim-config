.PHONY: convert
convert:
	cat nvim.yaml | yq > nvim.json
