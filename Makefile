all:
	hugo
serve:
	hugo server
drafts:
	hugo server --buildDrafts --buildFuture
