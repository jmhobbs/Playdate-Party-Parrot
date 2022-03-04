build: increment_build
	pdc src/ PartyParrot.pdx

increment_build:
	bash hack/increment-build.sh
	