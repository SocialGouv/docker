

clean:
	rm -Rf ${CACHE_MAKE_DIR}

purge: clean
	rm -Rf $(CACHE_DIR)
