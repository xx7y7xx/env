// build.js
// 2016-04-11

// ============================================================================
// This file is part of wware.
// Published under the WWARE License.
// Copyright (C) by masol.li@gmail.com.
//
// See http://www.wware.org/license.html for more information.
// ============================================================================

/*jslint node:true, nomen: true*/
/*global sp, when, _, _s, reqlib*/

/**
 * how to use
 * ```
 * $ sudo npm install -g dot
 * ```
 */

const UID = "8bdb86b8543ea88808c5178508c51785";
const snippets = {
  "paymentcreatetransaction": {
    "id": "a202a36c7a53279f7b6c47cbfb9278d3",
    "name": "创建交易",
    "desc": "通过调用payment module的<code>create_transaction()</code>方法来根据payment method id创建一个新的交易。<br>维护者：<a href='mailto:d3vin.chen@gmail.com'>d3vin.chen@gmail.com</a><br>版本：rev 0.1"
  },
  "paymentgetpaymentmethod": {
    "id": "a32ec50963c01d7008e70ea860bf62bd",
    "name": "获取支付方式列表",
    "desc": "通过调用payment module的<code>get_payment_method()</code>方法来获取当前网站启用的支付方式列表数组。<br>维护者：<a href='mailto:d3vin.chen@gmail.com'>d3vin.chen@gmail.com</a><br>版本：rev 0.3"
  },
  "syslogsyslog": {
    "id": "e0f2f4fbd96bb1d5d96bb1d5d96bb1d5",
    "name": "系统日志",
    "desc": "通过调用syslog module中的<code>req.syslog()</code>系统日志函数，将日志正文写入服务器端日志文件和数据库中。<br>维护者：<a href='mailto:d3vin.chen@gmail.com'>d3vin.chen@gmail.com</a><br>版本：rev 0.1"
  }
};
const exec = require('child_process').exec;
const ERROR_CMDLINE_OPTIONS_PARSING = 1;
const ERROR_SNIPPET_NAME_NOT_FOUND = 2;
const ERROR_COMPILE = 3;
const ERROR_UPLOAD = 4;

// import modules.

const doT = require('dot');
const fs = require('fs');
const path = require('path');

var tmpl_params = {},
  generator_tmpl,
  cmd, child,
  debug_mode = false;

// command line params parsing.

if (process.argv[2] === undefined) {
  console.log("usage: node build.js paymentgetpaymentmethod [debug]");
  process.exit(ERROR_CMDLINE_OPTIONS_PARSING);
}

// e.g. paymentgetpaymentmethod
const dir_name = process.argv[2];

if (snippets[dir_name] === undefined) {
  console.log('ERROR: snippet name not found!');
  process.exit(ERROR_SNIPPET_NAME_NOT_FOUND);
}

const snippet = snippets[dir_name];

// files

// paymentgetpaymentmethod/generator.js
const generator_src_path = path.join(dir_name, "generator.js");
// paymentgetpaymentmethod/generator.tpl.js
const generator_tmpl_path = path.join(dir_name, "generator.tpl.js");
// paymentgetpaymentmethod/schema.js
const schema_path = path.join(dir_name, "schema.json");
// paymentgetpaymentmethod/schema_param_severity.js
const schema_param_severity_path = path.join(dir_name, "schema_param_severity.json");
// paymentgetpaymentmethod/intro.html
const intro_path = path.join(dir_name, "intro.html");
// paymentgetpaymentmethod/snippet.js
const snippet_path = path.join(dir_name, "snippet.js");

// debug mode
if (process.argv[3] !== undefined && process.argv[3] === "debug") {
  debug_mode = true;
}

// building template.

doT.templateSettings.strip = false;

function loadfile(filepath) {
  return fs.readFileSync(filepath);
}

// intro.html -> intro
// node api polyfill
// https://nodejs.org/docs/latest-v0.10.x/api/path.html
// https://nodejs.org/dist/latest-v4.x/docs/api/path.html#path_path_parse_pathstring
function getName(filename) {
  if (path.hasOwnProperty("parse")) {
    return path.parse(filename).name;
  } else {
    return filename.replace(/\.[^/.]+$/, "");
  }
}

// load source code (html/js), wrap to js string with doT.
function file2str(filepath) {
  tmp_str = doT.template(loadfile(filepath)).toString();
  tmp_str = tmp_str.replace("function anonymous(it) {\nvar out=", "");
  return tmp_str.replace(";return out;\n}", "");
}

// load source code (html/js), wrap to doT template function
function file2tmpl(filepath) {
  var name = getName(path.basename(filepath));
  return doT.template(loadfile(filepath)).toString().replace("function anonymous(it", "function " + name + "(placeholder");
}

// upload generator.js to wware
function upload_snippet(snippet, filepath, callback) {
  console.log("upload snippet...");
  var cmd = 'upload_snippet.sh ' + UID + ' ' + snippet.id + ' "' + snippet.name + '" "' + snippet.desc + '" ' + filepath;
  /*var child = */exec(cmd, function (error, stdout, stderr) {
    console.log("stdout: " + stdout);
    if (stderr) {
      console.log("stderr: " + stderr);
    }
    if (error !== null) {
      console.log("exec error: " + error);
      process.exit(ERROR_UPLOAD);
    }
    callback();
  });
}

// compile generator.js
function compile_and_upload(snippet, filepath, callback) {
  console.log("compile snippet...");
  var cmd = 'compile_snippet.sh ' + filepath + ' /tmp/generator.min.js';
  /*var child = */exec(cmd, function (error, stdout, stderr) {
    console.log("stdout: " + stdout);
    if (stderr) {
      console.log("stderr: " + stderr);
    }
    if (error !== null) {
      console.log("exec error: " + error);
      process.exit(ERROR_COMPILE);
    }
    upload_snippet(snippet, "/tmp/generator.min.js", callback);
  });
}

function job_complete() {
  try {
    fs.mkdirSync(path.join("/home/chenyang/wware/auth/_codesnippet", dir_name));
  } catch (e) {
    if ( e.code !== 'EEXIST' ) throw e;
  }
  fs.renameSync(generator_src_path, path.join("/home/chenyang/wware/auth/_codesnippet", generator_src_path));
  console.log("Job completed.");
  process.exit(0);
}

tmpl_params = {
  "snippet": file2tmpl(snippet_path)
};

if (fs.existsSync(intro_path)) {
  tmpl_params.intro = file2str(intro_path);
}

if (fs.existsSync(schema_path)) {
  tmpl_params.schema = loadfile(schema_path);
}

if (fs.existsSync(schema_param_severity_path)) {
  tmpl_params.schema_param_severity = loadfile(schema_param_severity_path);
}

// generate generator.js file

doT.templateSettings.strip = false;
generator_tmpl = doT.template(loadfile(generator_tmpl_path));

fs.writeFileSync(generator_src_path, generator_tmpl(tmpl_params));

if (debug_mode) {
  upload_snippet(snippet, generator_src_path, job_complete);
} else {
  compile_and_upload(snippet, generator_src_path, job_complete);
}
