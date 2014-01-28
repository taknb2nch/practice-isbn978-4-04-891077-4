var lines = [];
var reader = require('readline').createInterface({
	input: process.stdin,
	output: process.stdout
});

reader.on('line', function(line) {
	lines.push(line);

	console.log(line);
});

process.stdin.on('end', function() {
	//console.log(lines);
});