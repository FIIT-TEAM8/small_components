db = new Mongo().getDB("ams");
db.createCollection('articles', {storageEngine: {wiredTiger: {configString: 'block_compressor=zlib'}}})
db.createCollection('crimemaps', {storageEngine: {wiredTiger: {configString: 'block_compressor=zlib'}}})
db.createCollection('errorlinks', {storageEngine: {wiredTiger: {configString: 'block_compressor=zlib'}}})