import { instantiate, invoke } from './wasm/main.mjs';
import wasm from './wasm/main.wasm';

export default {
	async fetch(request, env, ctx) {
		const importObjectPromise = Promise.resolve({});
		const modulePromise = Promise.resolve(wasm);
		const instance = await instantiate(modulePromise, importObjectPromise);

		instance.exports.$invokeMain([]);

		return new Response(await dispatchMethod(request.url), { status: 200 });
	},
};
