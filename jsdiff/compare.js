const {
	createPatch,
	parsePatch,
	applyPatch,
	merge,
	diffLines,
} = require('diff');
const { diff3Merge } = require('node-diff3');
const fs = require('fs');

const fromText = fs.readFileSync('./compare/from.ts', { encoding: 'utf-8' });
const toText = fs.readFileSync('./compare/to.ts', { encoding: 'utf-8' });
const currentText = fs.readFileSync('./compare/current.ts', {
	encoding: 'utf-8',
});

/*/
const merged = merge(currentText, toText, fromText);
// console.log(JSON.stringify(merged, null, 2));
// console.log(diffLines(fromText, toText));

console.log(
	merged.hunks[0].lines
		.filter(line => line.conflict || line[0] !== '-')
		.flatMap(line =>
			line.conflict
				? [
						'<<<<<<<',
						...line.mine
							.filter(line => line[0] !== '-')
							.map(line => line.substring(1)),
						'=======',
						...line.theirs
							.filter(line => line[0] !== '-')
							.map(line => line.substring(1)),
						'>>>>>>>',
				  ]
				: [line.substring(1)]
		)
		.join('\n')
);

// const patch = createPatch('file', fromText, toText, undefined, undefined, {
// 	context: 1,
// });
// console.log(patch);

// let parsed = parsePatch(merged);
// console.log(JSON.stringify(parsed, null, 2));

// let newText = applyPatch(fromText, merged);
// console.log(newText);
/*/

const result = diff3Merge(currentText, fromText, toText, {
	stringSeparator: '\n',
});

const file = result.reduce((file, { ok, conflict }) => {
	if (ok) {
		return [file, ...ok].join('\n');
	} else {
		return [
			file,
			'<<<<<<<',
			...conflict.a,
			'=======',
			...conflict.b,
			'>>>>>>>',
		].join('\n');
	}
}, '');

console.log(file);
//*/
