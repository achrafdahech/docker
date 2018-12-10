"use strict";

var _http = require("http");

var _http2 = _interopRequireDefault(_http);

var _express = require("express");

var _express2 = _interopRequireDefault(_express);

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { default: obj }; }

const PORT = 9000;
const DELAY = 2500;

const reverse = s => {
  const out = s.split("").reverse().join("");
  return new Promise(resolve => {
    setTimeout(() => resolve(out), DELAY);
  });
};

const app = (0, _express2.default)();
app.server = _http2.default.createServer(app);

app.get("/api/reverse/:something", async (req, res) => {
  const something = req.params.something;
  console.log(`Reversing "${something}"`);
  const reversed = await reverse(something);
  res.json(reversed);
});

app.server.listen(PORT);
console.log(`API started on port ${app.server.address().port}`);