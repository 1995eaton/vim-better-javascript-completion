" (A more up-to-date) Vim completion script
" Language:	JavaScript
" Maintainer:	Jake Eaton (1995eaton@gmail.com)
" Last Change:	2014 Jun 23
" Original Maintainer: Mikolaj Machowski ( mikmach AT wp DOT pl )

function! js#CompleteJS(findstart, base)
  if a:findstart
	" locate the start of the word
	let line = getline('.')
	let start = col('.') - 1
	let curline = line('.')
	let compl_begin = col('.') - 2
	" Bit risky but JS is rather limited language and local chars shouldn't
	" fint way into names
	while start >= 0 && line[start - 1] =~ '\k'
		let start -= 1
	endwhile
	let b:compl_context = getline('.')[0:compl_begin]
	return start
  else
	" Initialize base return lists
	let res = []
	let res2 = []
	" a:base is very short - we need context
	" Shortcontext is context without a:base, useful for checking if we are
	" looking for objects and for what objects we are looking for
	let context = b:compl_context
	let shortcontext = substitute(context, a:base.'$', '', '')
	unlet! b:compl_context

	if exists("b:jsrange")
		let file = getline(b:jsrange[0],b:jsrange[1])
		unlet! b:jsrange

		if len(b:js_extfiles) > 0
			let file = b:js_extfiles + file
		endif

	else
		let file = getline(1, '$')
	endif


	if shortcontext =~ '\.$'

		let doms = ['style.']

		let arrayprop = ['constructor', 'index', 'input', 'length', 'prototype']
		let arraymeth = ['constructor', 'toString', 'toLocaleString', 'join', 'pop', 'push', 'concat', 'reverse', 'shift', 'unshift', 'slice', 'splice', 'sort', 'filter', 'forEach', 'some', 'every', 'map', 'indexOf', 'lastIndexOf', 'reduce', 'reduceRight']
		call map(arraymeth, 'v:val."("')
		let arrays = arrayprop + arraymeth

		let datemeth = ['constructor', 'toString', 'toDateString', 'toTimeString', 'toLocaleString', 'toLocaleDateString', 'toLocaleTimeString', 'valueOf', 'getTime', 'getFullYear', 'getUTCFullYear', 'getMonth', 'getUTCMonth', 'getDate', 'getUTCDate', 'getDay', 'getUTCDay', 'getHours', 'getUTCHours', 'getMinutes', 'getUTCMinutes', 'getSeconds', 'getUTCSeconds', 'getMilliseconds', 'getUTCMilliseconds', 'getTimezoneOffset', 'setTime', 'setMilliseconds', 'setUTCMilliseconds', 'setSeconds', 'setUTCSeconds', 'setMinutes', 'setUTCMinutes', 'setHours', 'setUTCHours', 'setDate', 'setUTCDate', 'setMonth', 'setUTCMonth', 'setFullYear', 'setUTCFullYear', 'toGMTString', 'toUTCString', 'getYear', 'setYear', 'toISOString', 'toJSON']
		call map(datemeth, 'v:val."("')
		let dates = datemeth

		let funcprop = ['arguments', 'caller', 'length', 'name', 'prototype']
		let funcmeth = ['apply', 'arguments', 'bind', 'call', 'caller', 'constructor', 'length', 'name', 'toString']
		call map(funcmeth, 'v:val."("')
		let funcs = funcprop + funcmeth

		let mathprop = ['E', 'LN10', 'LN2', 'LOG2E', 'LOG10E', 'PI', 'SQRT1_2', 'SQRT2']
		let mathmeth = ['random', 'abs', 'acos', 'asin', 'atan', 'ceil', 'cos', 'exp', 'floor', 'log', 'round', 'sin', 'sqrt', 'tan', 'atan2', 'pow', 'max', 'min', 'imul']
		call map(mathmeth, 'v:val."("')
		let maths = mathprop + mathmeth

		let numbprop = ['length', 'name', 'arguments', 'caller', 'prototype', 'MAX_VALUE', 'MIN_VALUE', 'NaN', 'NEGATIVE_INFINITY', 'POSITIVE_INFINITY', 'MAX_SAFE_INTEGER', 'MIN_SAFE_INTEGER', 'EPSILON']
		let numbmeth = ['isFinite', 'isInteger', 'isNaN', 'isSafeInteger', 'parseInt', 'parseFloat', 'constructor', 'toString', 'toLocaleString', 'valueOf']
		call map(numbmeth, 'v:val."("')
		let numbs = numbprop + numbmeth

		let objeprop = ['arguments', 'caller', 'length', 'name', 'prototype']
		let objemeth = ['create', 'defineProperties', 'defineProperty', 'deliverChangeRecords', 'freeze', 'getNotifier', 'getOwnPropertyDescriptor', 'getOwnPropertyNames', 'getPrototypeOf', 'is', 'isExtensible', 'isFrozen', 'isSealed', 'keys', 'observe', 'preventExtensions', 'seal', 'setPrototypeOf', 'unobserve']
		call map(objemeth, 'v:val."("')
		let objes = objeprop + objemeth

		let regeprop = ['length', 'name', 'arguments', 'caller', 'prototype', 'input', 'multiline', 'lastMatch', 'lastParen', 'leftContext', 'rightContext', 'source', 'global', 'ignoreCase', 'multiline', 'lastIndex']
		let regemeth = ['constructor', 'exec', 'test', 'toString', 'compile']
		call map(regemeth, 'v:val."("')
		let reges = regeprop + regemeth

		let striprop = ['length']
		let strimeth = ['anchor', 'big', 'blink', 'bold', 'charAt', 'charCodeAt', 'concat', 'constructor', 'fixed', 'fontcolor', 'fontsize', 'indexOf', 'italics', 'lastIndexOf', 'link', 'localeCompare', 'match', 'normalize', 'replace', 'search', 'slice', 'small', 'split', 'strike', 'sub', 'substr', 'substring', 'sup', 'fromCharCode', 'toLocaleLowerCase', 'toLocaleUpperCase', 'toLowerCase', 'toString', 'toUpperCase', 'trim', 'trimLeft', 'trimRight', 'valueOf']
		call map(strimeth, 'v:val."("')
		let stris = striprop + strimeth

		let user_props1 = filter(copy(file), 'v:val =~ "this\\.\\k"')
		let juser_props1 = join(user_props1, ' ')
		let user_props1 = split(juser_props1, '\zethis\.')
		unlet! juser_props1
		call map(user_props1, 'matchstr(v:val, "this\\.\\zs\\k\\+\\ze")')

		let user_props2 = filter(copy(file), 'v:val =~ "\\.prototype\\.\\k"')
		let juser_props2 = join(user_props2, ' ')
		let user_props2 = split(juser_props2, '\zeprototype\.')
		unlet! juser_props2
		call map(user_props2, 'matchstr(v:val, "prototype\\.\\zs\\k\\+\\ze")')
		let user_props = user_props1 + user_props2

    let ctxprop = ['canvas', 'fillStyle', 'font', 'globalAlpha', 'globalCompositeOperation', 'imageSmoothingEnabled', 'lineCap', 'lineDashOffset', 'lineJoin', 'lineWidth', 'miterLimit', 'shadowBlur', 'shadowColor', 'shadowOffsetX', 'shadowOffsetY', 'strokeStyle', 'textAlign', 'textBaseline', 'webkitImageSmoothingEnabled']
    let ctxmeth = ['arc', 'arcTo', 'beginPath', 'bezierCurveTo', 'clearRect', 'clearShadow', 'clip', 'closePath', 'createImageData', 'createLinearGradient', 'createPattern', 'createRadialGradient', 'drawFocusIfNeeded', 'drawImage', 'drawImageFromRect', 'ellipse', 'fill', 'fillRect', 'fillText', 'getContextAttributes', 'getImageData', 'getLineDash', 'isPointInPath', 'isPointInStroke', 'lineTo', 'measureText', 'moveTo', 'putImageData', 'quadraticCurveTo', 'rect', 'resetTransform', 'restore', 'rotate', 'save', 'scale', 'setAlpha', 'setCompositeOperation', 'setFillColor', 'setLineCap', 'setLineDash', 'setLineJoin', 'setLineWidth', 'setMiterLimit', 'setShadow', 'setStrokeColor', 'setTransform', 'stroke', 'strokeRect', 'strokeText', 'transform', 'translate']
    call map(ctxmeth, 'v:val."("')
    let ctxs = ctxprop + ctxmeth

		let areaprop = ['accessKey', 'alt', 'coords', 'hash', 'host', 'hostname', 'href', 'id',
					\ 'noHref', 'pathname', 'port', 'protocol', 'search', 'shape', 'tabIndex', 'target']
		let areameth = ['onclick', 'ondblClick', 'onmouseOut', 'onmouseOver']
		call map(areameth, 'v:val."("')
		let areas = areaprop + areameth

    let storage = ['clear(', 'constructor(', 'getItem(', 'key(', 'removeItem(', 'setItem(', 'length']

		let baseprop = ['href', 'id', 'className', 'target']
		let bases = baseprop

		let bodyprop = ['aLink', 'accessKey', 'attributes', 'background', 'baseURI', 'bgColor', 'childElementCount', 'childNodes', 'children', 'classList', 'className', 'clientHeight', 'clientLeft', 'clientTop', 'clientWidth', 'contentEditable', 'dataset', 'dir', 'draggable', 'firstChild', 'firstElementChild', 'hidden', 'id', 'innerHTML', 'innerText', 'isContentEditable', 'lang', 'lastChild', 'lastElementChild', 'link', 'localName', 'namespaceURI', 'nextElementSibling', 'nextSibling', 'nodeName', 'nodeType', 'nodeValue', 'offsetHeight', 'offsetLeft', 'offsetParent', 'offsetTop', 'offsetWidth', 'onabort', 'onautocomplete', 'onautocompleteerror', 'onbeforecopy', 'onbeforecut', 'onbeforepaste', 'onbeforeunload', 'onblur', 'oncancel', 'oncanplay', 'oncanplaythrough', 'onchange', 'onclick', 'onclose', 'oncontextmenu', 'oncopy', 'oncuechange', 'oncut', 'ondblclick', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'ondurationchange', 'onemptied', 'onended', 'onerror', 'onfocus', 'onhashchange', 'oninput', 'oninvalid', 'onkeydown', 'onkeypress', 'onkeyup', 'onlanguagechange', 'onload', 'onloadeddata', 'onloadedmetadata', 'onloadstart', 'onmessage', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onoffline', 'ononline', 'onpagehide', 'onpageshow', 'onpaste', 'onpause', 'onplay', 'onplaying', 'onpopstate', 'onprogress', 'onratechange', 'onreset', 'onresize', 'onscroll', 'onsearch', 'onseeked', 'onseeking', 'onselect', 'onselectstart', 'onshow', 'onstalled', 'onstorage', 'onsubmit', 'onsuspend', 'ontimeupdate', 'ontoggle', 'onunload', 'onvolumechange', 'onwaiting', 'onwebkitfullscreenchange', 'onwebkitfullscreenerror', 'onwheel', 'outerHTML', 'outerText', 'ownerDocument', 'parentElement', 'parentNode', 'prefix', 'previousElementSibling', 'previousSibling', 'scrollHeight', 'scrollLeft', 'scrollTop', 'scrollWidth', 'shadowRoot', 'spellcheck', 'style', 'tabIndex', 'tagName', 'text', 'textContent', 'title', 'translate', 'vLink', 'webkitdropzone']
    let bodymeth = ['addEventListener', 'animate', 'appendChild', 'blur', 'click', 'cloneNode', 'compareDocumentPosition', 'contains', 'createShadowRoot', 'dispatchEvent', 'focus', 'getAttribute', 'getAttributeNS', 'getAttributeNode', 'getAttributeNodeNS', 'getBoundingClientRect', 'getClientRects', 'getDestinationInsertionPoints', 'getElementsByClassName', 'getElementsByTagName', 'getElementsByTagNameNS', 'hasAttribute', 'hasAttributeNS', 'hasAttributes', 'hasChildNodes', 'insertAdjacentElement', 'insertAdjacentHTML', 'insertAdjacentText', 'insertBefore', 'isDefaultNamespace', 'isEqualNode', 'isSameNode', 'lookupNamespaceURI', 'lookupPrefix', 'matches', 'normalize', 'querySelector', 'querySelectorAll', 'remove', 'removeAttribute', 'removeAttributeNS', 'removeAttributeNode', 'removeChild', 'removeEventListener', 'replaceChild', 'requestPointerLock', 'scrollByLines', 'scrollByPages', 'scrollIntoView', 'scrollIntoViewIfNeeded', 'setAttribute', 'setAttributeNS', 'setAttributeNode', 'setAttributeNodeNS', 'webkitMatchesSelector', 'webkitRequestFullScreen', 'webkitRequestFullscreen', 'webkitRequestPointerLock']
    call map(bodymeth, 'v:val."("')
		let bodys = bodyprop + bodymeth

		let docuprop = ['URL', 'activeElement', 'alinkColor', 'all', 'anchors', 'applets', 'baseURI', 'bgColor', 'body', 'characterSet', 'charset', 'childElementCount', 'childNodes', 'children', 'compatMode', 'contentType', 'cookie', 'currentScript', 'defaultCharset', 'defaultView', 'designMode', 'dir', 'doctype', 'documentElement', 'documentURI', 'domain', 'embeds', 'fgColor', 'firstChild', 'firstElementChild', 'fonts', 'forms', 'head', 'hidden', 'images', 'implementation', 'inputEncoding', 'lastChild', 'lastElementChild', 'lastModified', 'linkColor', 'links', 'localName', 'location', 'namespaceURI', 'nextSibling', 'nodeName', 'nodeType', 'nodeValue', 'onabort', 'onautocomplete', 'onautocompleteerror', 'onbeforecopy', 'onbeforecut', 'onbeforepaste', 'onblur', 'oncancel', 'oncanplay', 'oncanplaythrough', 'onchange', 'onclick', 'onclose', 'oncontextmenu', 'oncopy', 'oncuechange', 'oncut', 'ondblclick', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'ondurationchange', 'onemptied', 'onended', 'onerror', 'onfocus', 'oninput', 'oninvalid', 'onkeydown', 'onkeypress', 'onkeyup', 'onload', 'onloadeddata', 'onloadedmetadata', 'onloadstart', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onpaste', 'onpause', 'onplay', 'onplaying', 'onpointerlockchange', 'onpointerlockerror', 'onprogress', 'onratechange', 'onreadystatechange', 'onreset', 'onresize', 'onscroll', 'onsearch', 'onseeked', 'onseeking', 'onselect', 'onselectionchange', 'onselectstart', 'onshow', 'onstalled', 'onsubmit', 'onsuspend', 'ontimeupdate', 'ontoggle', 'onvolumechange', 'onwaiting', 'onwebkitfullscreenchange', 'onwebkitfullscreenerror', 'onwebkitpointerlockchange', 'onwebkitpointerlockerror', 'onwheel', 'ownerDocument', 'parentElement', 'parentNode', 'plugins', 'pointerLockElement', 'preferredStylesheetSet', 'previousSibling', 'readyState', 'referrer', 'rootElement', 'scripts', 'selectedStylesheetSet', 'styleSheets', 'textContent', 'title', 'visibilityState', 'vlinkColor', 'webkitCurrentFullScreenElement', 'webkitFullScreenKeyboardInputAllowed', 'webkitFullscreenElement', 'webkitFullscreenEnabled', 'webkitHidden', 'webkitIsFullScreen', 'webkitPointerLockElement', 'webkitVisibilityState', 'xmlEncoding', 'xmlStandalone', 'xmlVersion']
		let documeth = ['addEventListener', 'adoptNode', 'appendChild', 'captureEvents', 'caretRangeFromPoint', 'clear', 'cloneNode', 'close', 'compareDocumentPosition', 'contains', 'createAttribute', 'createAttributeNS', 'createCDATASection', 'createComment', 'createDocumentFragment', 'createElement', 'createElementNS', 'createEvent', 'createExpression', 'createNSResolver', 'createNodeIterator', 'createProcessingInstruction', 'createRange', 'createTextNode', 'createTreeWalker', 'dispatchEvent', 'elementFromPoint', 'evaluate', 'execCommand', 'exitPointerLock', 'getCSSCanvasContext', 'getElementById', 'getElementsByClassName', 'getElementsByName', 'getElementsByTagName', 'getElementsByTagNameNS', 'getOverrideStyle', 'getSelection', 'hasChildNodes', 'hasFocus', 'importNode', 'insertBefore', 'isDefaultNamespace', 'isEqualNode', 'isSameNode', 'lookupNamespaceURI', 'lookupPrefix', 'normalize', 'open', 'queryCommandEnabled', 'queryCommandIndeterm', 'queryCommandState', 'queryCommandSupported', 'queryCommandValue', 'querySelector', 'querySelectorAll', 'registerElement', 'releaseEvents', 'removeChild', 'removeEventListener', 'replaceChild', 'webkitCancelFullScreen', 'webkitExitFullscreen', 'webkitExitPointerLock', 'write', 'writeln']
		call map(documeth, 'v:val."("')
		let docus = docuprop + documeth

		let histprop = ['length', 'state']
		let histmeth = ['back', 'forward', 'go', 'pushState', 'replaceState']
		call map(histmeth, 'v:val."("')
		let hists = histprop + histmeth

		let ifraprop = ['align', 'frameBorder', 'height', 'id', 'longDesc', 'marginHeight', 'marginWidth',
					\ 'name', 'scrolling', 'src', 'width']
		let ifras = ifraprop

		let imagprop = ['accessKey', 'align', 'alt', 'attributes', 'baseURI', 'border', 'childElementCount', 'childNodes', 'children', 'classList', 'className', 'clientHeight', 'clientLeft', 'clientTop', 'clientWidth', 'complete', 'contentEditable', 'crossOrigin', 'dataset', 'dir', 'draggable', 'firstChild', 'firstElementChild', 'height', 'hidden', 'hspace', 'id', 'innerHTML', 'innerText', 'isContentEditable', 'isMap', 'lang', 'lastChild', 'lastElementChild', 'localName', 'longDesc', 'lowsrc', 'name', 'namespaceURI', 'naturalHeight', 'naturalWidth', 'nextElementSibling', 'nextSibling', 'nodeName', 'nodeType', 'nodeValue', 'offsetHeight', 'offsetLeft', 'offsetParent', 'offsetTop', 'offsetWidth', 'onabort', 'onautocomplete', 'onautocompleteerror', 'onbeforecopy', 'onbeforecut', 'onbeforepaste', 'onblur', 'oncancel', 'oncanplay', 'oncanplaythrough', 'onchange', 'onclick', 'onclose', 'oncontextmenu', 'oncopy', 'oncuechange', 'oncut', 'ondblclick', 'ondrag', 'ondragend', 'ondragenter', 'ondragleave', 'ondragover', 'ondragstart', 'ondrop', 'ondurationchange', 'onemptied', 'onended', 'onerror', 'onfocus', 'oninput', 'oninvalid', 'onkeydown', 'onkeypress', 'onkeyup', 'onload', 'onloadeddata', 'onloadedmetadata', 'onloadstart', 'onmousedown', 'onmouseenter', 'onmouseleave', 'onmousemove', 'onmouseout', 'onmouseover', 'onmouseup', 'onmousewheel', 'onpaste', 'onpause', 'onplay', 'onplaying', 'onprogress', 'onratechange', 'onreset', 'onresize', 'onscroll', 'onsearch', 'onseeked', 'onseeking', 'onselect', 'onselectstart', 'onshow', 'onstalled', 'onsubmit', 'onsuspend', 'ontimeupdate', 'ontoggle', 'onvolumechange', 'onwaiting', 'onwebkitfullscreenchange', 'onwebkitfullscreenerror', 'onwheel', 'outerHTML', 'outerText', 'ownerDocument', 'parentElement', 'parentNode', 'prefix', 'previousElementSibling', 'previousSibling', 'scrollHeight', 'scrollLeft', 'scrollTop', 'scrollWidth', 'shadowRoot', 'spellcheck', 'src', 'srcset', 'style', 'tabIndex', 'tagName', 'textContent', 'title', 'translate', 'useMap', 'vspace', 'webkitdropzone', 'width', 'x', 'y']
		let imagmeth = ['addEventListener', 'animate', 'appendChild', 'blur', 'click', 'cloneNode', 'compareDocumentPosition', 'contains', 'createShadowRoot', 'dispatchEvent', 'focus', 'getAttribute', 'getAttributeNS', 'getAttributeNode', 'getAttributeNodeNS', 'getBoundingClientRect', 'getClientRects', 'getDestinationInsertionPoints', 'getElementsByClassName', 'getElementsByTagName', 'getElementsByTagNameNS', 'hasAttribute', 'hasAttributeNS', 'hasAttributes', 'hasChildNodes', 'insertAdjacentElement', 'insertAdjacentHTML', 'insertAdjacentText', 'insertBefore', 'isDefaultNamespace', 'isEqualNode', 'isSameNode', 'lookupNamespaceURI', 'lookupPrefix', 'matches', 'normalize', 'querySelector', 'querySelectorAll', 'remove', 'removeAttribute', 'removeAttributeNS', 'removeAttributeNode', 'removeChild', 'removeEventListener', 'replaceChild', 'requestPointerLock', 'scrollByLines', 'scrollByPages', 'scrollIntoView', 'scrollIntoViewIfNeeded', 'setAttribute', 'setAttributeNS', 'setAttributeNode', 'setAttributeNodeNS', 'webkitMatchesSelector', 'webkitRequestFullScreen', 'webkitRequestFullscreen', 'webkitRequestPointerLock']
		call map(imagmeth, 'v:val."("')
		let imags = imagprop + imagmeth

		let linkprop = ['charset', 'disabled', 'href', 'hreflang', 'id', 'media',
					\ 'rel', 'rev', 'target', 'type']
		let linkmeth = ['onload']
		call map(linkmeth, 'v:val."("')
		let links = linkprop + linkmeth

		let locaprop = ['href', 'hash', 'host', 'hostname', 'pathname', 'port', 'protocol',
					\ 'search']
		let locameth = ['assign', 'reload', 'replace']
		call map(locameth, 'v:val."("')
		let locas = locaprop + locameth

		let naviprop = ['appCodeName', 'appName', 'appVersion', 'cookieEnabled', 'doNotTrack', 'geolocation', 'hardwareConcurrency', 'language', 'languages', 'maxTouchPoints', 'mimeTypes', 'onLine', 'platform', 'plugins', 'product', 'productSub', 'userAgent', 'vendor', 'vendorSub']
		let navimeth = ['getGamepads', 'getMediaDevices', 'getStorageUpdates', 'javaEnabled', 'registerProtocolHandler', 'vibrate']
		call map(navimeth, 'v:val."("')
		let navis = naviprop + navimeth

		let screprop = ['availHeight', 'availLeft', 'availTop', 'availWidth', 'colorDepth', 'height', 'pixelDepth', 'width']
		let scres = screprop

		let stylprop = ['parentRule', 'length', 'cssText', 'alignContent', 'alignItems', 'alignSelf', 'alignmentBaseline', 'backfaceVisibility', 'background', 'backgroundAttachment', 'backgroundBlendMode', 'backgroundClip', 'backgroundColor', 'backgroundImage', 'backgroundOrigin', 'backgroundPosition', 'backgroundPositionX', 'backgroundPositionY', 'backgroundRepeat', 'backgroundRepeatX', 'backgroundRepeatY', 'backgroundSize', 'baselineShift', 'border', 'borderBottom', 'borderBottomColor', 'borderBottomLeftRadius', 'borderBottomRightRadius', 'borderBottomStyle', 'borderBottomWidth', 'borderCollapse', 'borderColor', 'borderImage', 'borderImageOutset', 'borderImageRepeat', 'borderImageSlice', 'borderImageSource', 'borderImageWidth', 'borderLeft', 'borderLeftColor', 'borderLeftStyle', 'borderLeftWidth', 'borderRadius', 'borderRight', 'borderRightColor', 'borderRightStyle', 'borderRightWidth', 'borderSpacing', 'borderStyle', 'borderTop', 'borderTopColor', 'borderTopLeftRadius', 'borderTopRightRadius', 'borderTopStyle', 'borderTopWidth', 'borderWidth', 'bottom', 'boxShadow', 'boxSizing', 'bufferedRendering', 'captionSide', 'clear', 'clip', 'clipPath', 'clipRule', 'color', 'colorInterpolation', 'colorInterpolationFilters', 'colorRendering', 'content', 'counterIncrement', 'counterReset', 'cursor', 'direction', 'display', 'dominantBaseline', 'emptyCells', 'enableBackground', 'fill', 'fillOpacity', 'fillRule', 'filter', 'flex', 'flexBasis', 'flexDirection', 'flexFlow', 'flexGrow', 'flexShrink', 'flexWrap', 'float', 'floodColor', 'floodOpacity', 'font', 'fontFamily', 'fontKerning', 'fontSize', 'fontStretch', 'fontStyle', 'fontVariant', 'fontVariantLigatures', 'fontWeight', 'glyphOrientationHorizontal', 'glyphOrientationVertical', 'height', 'imageRendering', 'justifyContent', 'left', 'letterSpacing', 'lightingColor', 'lineHeight', 'listStyle', 'listStyleImage', 'listStylePosition', 'listStyleType', 'margin', 'marginBottom', 'marginLeft', 'marginRight', 'marginTop', 'marker', 'markerEnd', 'markerMid', 'markerStart', 'mask', 'maskType', 'maxHeight', 'maxWidth', 'maxZoom', 'minHeight', 'minWidth', 'minZoom', 'objectFit', 'objectPosition', 'opacity', 'order', 'orientation', 'orphans', 'outline', 'outlineColor', 'outlineOffset', 'outlineStyle', 'outlineWidth', 'overflow', 'overflowWrap', 'overflowX', 'overflowY', 'padding', 'paddingBottom', 'paddingLeft', 'paddingRight', 'paddingTop', 'page', 'pageBreakAfter', 'pageBreakBefore', 'pageBreakInside', 'paintOrder', 'perspective', 'perspectiveOrigin', 'pointerEvents', 'position', 'quotes', 'resize', 'right', 'shapeImageThreshold', 'shapeMargin', 'shapeOutside', 'shapeRendering', 'size', 'speak', 'src', 'stopColor', 'stopOpacity', 'stroke', 'strokeDasharray', 'strokeDashoffset', 'strokeLinecap', 'strokeLinejoin', 'strokeMiterlimit', 'strokeOpacity', 'strokeWidth', 'tabSize', 'tableLayout', 'textAlign', 'textAnchor', 'textDecoration', 'textIndent', 'textLineThroughColor', 'textLineThroughMode', 'textLineThroughStyle', 'textLineThroughWidth', 'textOverflow', 'textOverlineColor', 'textOverlineMode', 'textOverlineStyle', 'textOverlineWidth', 'textRendering', 'textShadow', 'textTransform', 'textUnderlineColor', 'textUnderlineMode', 'textUnderlineStyle', 'textUnderlineWidth', 'top', 'touchAction', 'transform', 'transformOrigin', 'transformStyle', 'transition', 'transitionDelay', 'transitionDuration', 'transitionProperty', 'transitionTimingFunction', 'unicodeBidi', 'unicodeRange', 'userZoom', 'vectorEffect', 'verticalAlign', 'visibility', 'webkitAnimation', 'webkitAnimationDelay', 'webkitAnimationDirection', 'webkitAnimationDuration', 'webkitAnimationFillMode', 'webkitAnimationIterationCount', 'webkitAnimationName', 'webkitAnimationPlayState', 'webkitAnimationTimingFunction', 'webkitAppRegion', 'webkitAppearance', 'webkitAspectRatio', 'webkitBackfaceVisibility', 'webkitBackgroundClip', 'webkitBackgroundComposite', 'webkitBackgroundOrigin', 'webkitBackgroundSize', 'webkitBorderAfter', 'webkitBorderAfterColor', 'webkitBorderAfterStyle', 'webkitBorderAfterWidth', 'webkitBorderBefore', 'webkitBorderBeforeColor', 'webkitBorderBeforeStyle', 'webkitBorderBeforeWidth', 'webkitBorderEnd', 'webkitBorderEndColor', 'webkitBorderEndStyle', 'webkitBorderEndWidth', 'webkitBorderFit', 'webkitBorderHorizontalSpacing', 'webkitBorderImage', 'webkitBorderRadius', 'webkitBorderStart', 'webkitBorderStartColor', 'webkitBorderStartStyle', 'webkitBorderStartWidth', 'webkitBorderVerticalSpacing', 'webkitBoxAlign', 'webkitBoxDecorationBreak', 'webkitBoxDirection', 'webkitBoxFlex', 'webkitBoxFlexGroup', 'webkitBoxLines', 'webkitBoxOrdinalGroup', 'webkitBoxOrient', 'webkitBoxPack', 'webkitBoxReflect', 'webkitBoxShadow', 'webkitClipPath', 'webkitColumnBreakAfter', 'webkitColumnBreakBefore', 'webkitColumnBreakInside', 'webkitColumnCount', 'webkitColumnGap', 'webkitColumnRule', 'webkitColumnRuleColor', 'webkitColumnRuleStyle', 'webkitColumnRuleWidth', 'webkitColumnSpan', 'webkitColumnWidth', 'webkitColumns', 'webkitFilter', 'webkitFontFeatureSettings', 'webkitFontSizeDelta', 'webkitFontSmoothing', 'webkitHighlight', 'webkitHyphenateCharacter', 'webkitLineBoxContain', 'webkitLineBreak', 'webkitLineClamp', 'webkitLocale', 'webkitLogicalHeight', 'webkitLogicalWidth', 'webkitMarginAfter', 'webkitMarginAfterCollapse', 'webkitMarginBefore', 'webkitMarginBeforeCollapse', 'webkitMarginBottomCollapse', 'webkitMarginCollapse', 'webkitMarginEnd', 'webkitMarginStart', 'webkitMarginTopCollapse', 'webkitMask', 'webkitMaskBoxImage', 'webkitMaskBoxImageOutset', 'webkitMaskBoxImageRepeat', 'webkitMaskBoxImageSlice', 'webkitMaskBoxImageSource', 'webkitMaskBoxImageWidth', 'webkitMaskClip', 'webkitMaskComposite', 'webkitMaskImage', 'webkitMaskOrigin', 'webkitMaskPosition', 'webkitMaskPositionX', 'webkitMaskPositionY', 'webkitMaskRepeat', 'webkitMaskRepeatX', 'webkitMaskRepeatY', 'webkitMaskSize', 'webkitMaxLogicalHeight', 'webkitMaxLogicalWidth', 'webkitMinLogicalHeight', 'webkitMinLogicalWidth', 'webkitPaddingAfter', 'webkitPaddingBefore', 'webkitPaddingEnd', 'webkitPaddingStart', 'webkitPerspective', 'webkitPerspectiveOrigin', 'webkitPerspectiveOriginX', 'webkitPerspectiveOriginY', 'webkitPrintColorAdjust', 'webkitRtlOrdering', 'webkitRubyPosition', 'webkitTapHighlightColor', 'webkitTextCombine', 'webkitTextDecorationsInEffect', 'webkitTextEmphasis', 'webkitTextEmphasisColor', 'webkitTextEmphasisPosition', 'webkitTextEmphasisStyle', 'webkitTextFillColor', 'webkitTextOrientation', 'webkitTextSecurity', 'webkitTextStroke', 'webkitTextStrokeColor', 'webkitTextStrokeWidth', 'webkitTransform', 'webkitTransformOrigin', 'webkitTransformOriginX', 'webkitTransformOriginY', 'webkitTransformOriginZ', 'webkitTransformStyle', 'webkitTransition', 'webkitTransitionDelay', 'webkitTransitionDuration', 'webkitTransitionProperty', 'webkitTransitionTimingFunction', 'webkitUserDrag', 'webkitUserModify', 'webkitUserSelect', 'webkitWritingMode', 'whiteSpace', 'widows', 'width', 'willChange', 'wordBreak', 'wordSpacing', 'wordWrap', 'writingMode', 'zIndex', 'zoom']
		let styls = stylprop

    let niterprop = ['expandEntityReferences', 'filter', 'pointerBeforeReferenceNode', 'referenceNode', 'root', 'whatToShow']
    let nitermeth = ['detach', 'nextNode', 'previousNode']
    call map(nitermeth, 'v:val."("')
    let niters = niterprop + nitermeth
    let nfilter = ['FILTER_ACCEPT', 'FILTER_REJECT', 'FILTER_SKIP', 'SHOW_ALL', 'SHOW_ATTRIBUTE', 'SHOW_CDATA_SECTION', 'SHOW_COMMENT', 'SHOW_DOCUMENT', 'SHOW_DOCUMENT_FRAGMENT', 'SHOW_DOCUMENT_TYPE', 'SHOW_ELEMENT', 'SHOW_ENTITY', 'SHOW_ENTITY_REFERENCE', 'SHOW_NOTATION', 'SHOW_PROCESSING_INSTRUCTION', 'SHOW_TEXT', 'arguments', 'caller', 'length', 'name', 'prototype']

    let twalkerprop = ['currentNode', 'expandEntityReferences', 'filter', 'root', 'whatToShow']
    let twalkermeth = ['firstChild', 'lastChild', 'nextNode', 'nextSibling', 'parentNode', 'previousNode', 'previousSibling']
    call map(twalkermeth, 'v:val."("')
    let twalkers = twalkerprop + twalkermeth

    let console = ['log', 'clear', 'time', 'trace', 'assert', 'count', 'debug', 'dir', 'dirxml', 'error', 'group', 'groupCollapsed', 'groupEnd', 'info', 'markTimeline', 'profile', 'profileEnd', 'table', 'timeEnd', 'timeStamp', 'timeline', 'timelineEnd', 'warn']

		let windprop =  ['applicationCache', 'clientInformation', 'closed', 'console', 'crypto', 'decodeURI', 'decodeURIComponent', 'defaultStatus', 'defaultstatus', 'devicePixelRatio', 'document', 'encodeURI', 'encodeURIComponent', 'escape', 'eval', 'event', 'external', 'frameElement', 'frames', 'history', 'indexedDB', 'innerHeight', 'innerWidth', 'isFinite', 'isNaN', 'length', 'localStorage', 'location', 'locationbar', 'menubar', 'name', 'navigator', 'offscreenBuffering', 'opener', 'outerHeight', 'outerWidth', 'pageXOffset', 'pageYOffset', 'parent', 'parseFloat', 'parseInt', 'performance', 'personalbar', 'screen', 'screenLeft', 'screenTop', 'screenX', 'screenY', 'scrollX', 'scrollY', 'scrollbars', 'self', 'sessionStorage', 'speechSynthesis', 'status', 'statusbar', 'styleMedia', 'toolbar', 'top', 'undefined', 'unescape', 'window']
		let windmeth = ['addEventListener', 'alert', 'atob', 'blur', 'btoa', 'cancelAnimationFrame', 'captureEvents', 'clearInterval', 'clearTimeout', 'close', 'confirm', 'dispatchEvent', 'find', 'focus', 'getComputedStyle', 'getMatchedCSSRules', 'getSelection', 'matchMedia', 'moveBy', 'moveTo', 'open', 'openDatabase', 'postMessage', 'print', 'prompt', 'releaseEvents', 'removeEventListener', 'requestAnimationFrame', 'resizeBy', 'resizeTo', 'scroll', 'scrollBy', 'scrollTo', 'setInterval', 'setTimeout', 'showModalDialog', 'stop']
		call map(windmeth, 'v:val."("')
		let winds = windprop + windmeth

		let xmlhprop = ['onabort', 'onerror', 'onload', 'onloadend', 'onloadstart', 'onprogress', 'onreadystatechange', 'ontimeout', 'readyState', 'response', 'responseText', 'responseType', 'responseURL', 'responseXML', 'status', 'statusText', 'timeout', 'upload', 'withCredentials']
		let xmlhmeth = ['abort', 'addEventListener', 'dispatchEvent', 'getAllResponseHeaders', 'getResponseHeader', 'open', 'overrideMimeType', 'removeEventListener', 'send', 'setRequestHeader']
		call map(xmlhmeth, 'v:val."("')
		let xmlhs = xmlhprop + xmlhmeth

		" Find object type declaration to reduce number of suggestions. {{{
		" 1. Get object name
		" 2. Find object declaration line
		" 3. General declaration follows "= new Type" syntax, additional else
		"    for regexp "= /re/"
		" 4. Make correction for Microsoft.XMLHTTP ActiveXObject
		" 5. Repeat for external files
		let object = matchstr(shortcontext, '\zs\k\+\ze\(\[.\{-}\]\)\?\.$')
		if len(object) > 0
			let decl_line = search(object.'.\{-}=\s*new\s*', 'bn')
			if decl_line > 0
				let object_type = matchstr(getline(decl_line), object.'.\{-}=\s*new\s*\zs\k\+\ze')
				if object_type == 'ActiveXObject' && matchstr(getline(decl_line), object.'.\{-}=\s*new\s*ActiveXObject\s*(.Microsoft\.XMLHTTP.)') != ''
						let object_type = 'XMLHttpRequest'
				endif
      else
				if search(object.'\s*=\s*\/', 'bn') > 0
					let object_type = 'RegExp'
        elseif search(object.'\s*=\s*{', 'bn') > 0
          let object_type = 'Object'
        elseif search(object.'\s*=\s*\(true\|false\|!\)', 'bn') > 0
          let object_type = 'Boolean'
        elseif search(object.'\s*=\s*\[', 'bn') > 0
          let object_type = 'Array'
        elseif search(object.'\s*=\s*\(["'."'".']\|String(\)', 'bn') > 0
          let object_type = 'String'
        elseif search(object.'\s*=\s*document\.createTreeWalker(', 'bn') > 0
          let object_type = 'TreeWalker'
        elseif search(object.'\s*=\s*[a-zA-Z_$]\+\.getContext(', 'bn') > 0
          let object_type = 'CanvasRenderingContext2D'
        elseif search(object.'\s*=\s*document\.createNodeIterator(', 'bn') > 0
          let object_type = 'NodeIterator'
        endif
			endif
			" We didn't find var declaration in current file but we may have
			" something in external files.
			if decl_line == 0 && exists("b:js_extfiles")
				let dext_line = filter(copy(b:js_extfiles), 'v:val =~ "'.object.'.\\{-}=\\s*new\\s*"')
				if len(dext_line) > 0
					let object_type = matchstr(dext_line[-1], object.'.\{-}=\s*new\s*\zs\k\+\ze')
					if object_type == 'ActiveXObject' && matchstr(dext_line[-1], object.'.\{-}=\s*new\s*ActiveXObject\s*(.Microsoft\.XMLHTTP.)') != ''
							let object_type = 'XMLHttpRequest'
					endif
				else
					let dext_line = filter(copy(b:js_extfiles), 'v:val =~ "var\s*'.object.'\\s*=\\s*\\/"')
					if len(dext_line) > 0
						let object_type = 'RegExp'
					endif
				endif
			endif
		endif
		" }}}

		if !exists('object_type')
			let object_type = ''
		endif

		if object_type == 'Date'
			let values = dates
		elseif object_type == 'Image'
			let values = imags
		elseif object_type == 'Array'
			let values = arrays
    elseif object_type == 'Object'
      let values = objes
		elseif object_type == 'Boolean'
			let values = ['arguments', 'caller', 'length', 'name', 'prototype', 'constructor', 'toString', 'valueOf']
		elseif object_type == 'XMLHttpRequest'
			let values = xmlhs
		elseif object_type == 'String'
			let values = stris
		elseif object_type == 'RegExp'
			let values = reges
		elseif object_type == 'Math'
			let values = maths
    elseif object_type == 'CanvasRenderingContext2D'
      let values = ctxs
    elseif object_type == 'NodeIterator'
      let values = niters
    elseif object_type == 'TreeWalker'
      let values = twalkers
		endif

		if !exists('values')
		if shortcontext =~ 'Math\.$'
			let values = maths
		elseif shortcontext =~ 'area\.$'
			let values = areas
		elseif shortcontext =~ 'base\.$'
			let values = bases
		elseif shortcontext =~ 'body\.$'
			let values = bodys
		elseif shortcontext =~ 'document\.$'
			let values = docus
		elseif shortcontext =~ 'history\.$'
			let values = hists
    elseif shortcontext =~ '\(local\|session\)Storage\.$'
      let values = storage
    elseif shortcontext =~ 'NodeFilter\.$'
      let values = nfilter
    elseif shortcontext =~ '\/.*\(\\\/\)\@!\/\.$'
      let values = reges
		elseif shortcontext =~ 'iframe\.$'
			let values = ifras
		elseif shortcontext =~ 'images\(\[.\{-}\]\)\?\.$'
			let values = imags
		elseif shortcontext =~ 'links\(\[.\{-}\]\)\?\.$'
			let values = links
		elseif shortcontext =~ 'location\.$'
			let values = locas
		elseif shortcontext =~ 'navigator\.$'
			let values = navis
    elseif shortcontext =~ 'console\.$'
      let values = console
    elseif shortcontext =~ '\]\.$'
      let values = arrays
		elseif shortcontext =~ '\(}\|object\)\.$'
			let values = objes
		elseif shortcontext =~ 'screen\.$'
			let values = scres
		elseif shortcontext =~ 'style\.$'
			let values = styls
		elseif shortcontext =~ '\(top\|self\|window\)\.$'
			let values = winds
		else
			let values = user_props + bodys + arrays + dates + funcs + numbs + reges + stris
			let values += doms + areas + bases + docus
			let values += ifras + imags + links + locas + navis + objes + scres + winds
		endif
		endif

		for m in values
			if m =~? '^'.a:base
				call add(res, m)
			elseif m =~? a:base
				call add(res2, m)
			endif
		endfor

		unlet! values
		return res + res2

	endif

	" Get variables data.
	let variables = filter(copy(file), 'v:val =~ "var\\s"')
	call map(variables, 'matchstr(v:val, ".\\{-}var\\s\\+\\zs.*\\ze")')
	call map(variables, 'substitute(v:val, ";\\|$", ",", "g")')
	let vars = []
	" This loop (and next one) is necessary to get variable names from
	" constructs like: var var1, var2, var3 = "something";
	for i in range(len(variables))
		let comma_separated = split(variables[i], ',\s*')
		call map(comma_separated, 'matchstr(v:val, "\\k\\+")')
		let vars += comma_separated
	endfor

	let variables = sort(vars)
	unlet! vars

	" Add "no var" variables.
	let undeclared_variables = filter(copy(file), 'v:val =~ "^\\s*\\k\\+\\s*="')
	let u_vars = []
	for i in range(len(undeclared_variables))
		let  split_equal = split(undeclared_variables[i], '\s*=')
		call map(split_equal, 'matchstr(v:val, "\\k\\+$")')
		let u_vars += split_equal
	endfor

	let variables += sort(u_vars)
	unlet! u_vars

	" Get functions
	let functions = filter(copy(file), 'v:val =~ "^\\s*function\\s"')
	let arguments = copy(functions)
	call map(functions, 'matchstr(v:val, "^\\s*function\\s\\+\\zs\\k\\+")')
	call map(functions, 'v:val."("')
	let functions = sort(functions)

	" Create table to keep arguments for additional 'menu' info
	let b:js_menuinfo = {}
	for i in arguments
		let g:ia = i
		let f_elements = matchlist(i, 'function\s\+\(\k\+\)\s*(\(.\{-}\))')
		if len(f_elements) == 3
			let b:js_menuinfo[f_elements[1].'('] = f_elements[2]
		endif
	endfor

	" Get functions arguments
	call map(arguments, 'matchstr(v:val, "function.\\{-}(\\zs.\\{-}\\ze)")')
	let jargs = join(arguments, ',')
	let jargs = substitute(jargs, '\s', '', 'g')
	let arguments = split(jargs, ',')
	let arguments = sort(arguments)

	" Built-in functions
	let builtin = ['addEventListener(', 'alert(', 'atob(', 'blur(', 'btoa(', 'cancelAnimationFrame(', 'captureEvents(', 'clearInterval(', 'clearTimeout(', 'close(', 'confirm(', 'dispatchEvent(', 'find(', 'focus(', 'getComputedStyle(', 'getMatchedCSSRules(', 'getSelection(', 'matchMedia(', 'moveBy(', 'moveTo(', 'open(', 'openDatabase(', 'postMessage(', 'print(', 'prompt(', 'releaseEvents(', 'removeEventListener(', 'requestAnimationFrame(', 'resizeBy(', 'resizeTo(', 'scroll(', 'scrollBy(', 'scrollTo(', 'setInterval(', 'setTimeout(', 'showModalDialog(', 'stop(', 'localStorage', 'sessionStorage']

	" Top-level HTML DOM objects
	let htmldom = ['CSS', 'Infinity', 'Intl', 'JSON', 'Math', 'NaN', 'applicationCache', 'chrome', 'clientInformation', 'closed', 'console', 'crypto', 'defaultStatus', 'defaultstatus', 'devicePixelRatio', 'document', 'event', 'external', 'frameElement', 'frames', 'history', 'indexedDB', 'innerHeight', 'innerWidth', 'length', 'localStorage', 'location', 'locationbar', 'menubar', 'name', 'navigator', 'offscreenBuffering', 'opener', 'outerHeight', 'outerWidth', 'pageXOffset', 'pageYOffset', 'parent', 'performance', 'personalbar', 'screen', 'screenLeft', 'screenTop', 'screenX', 'screenY', 'scrollX', 'scrollY', 'scrollbars', 'self', 'sessionStorage', 'speechSynthesis', 'status', 'statusbar', 'styleMedia', 'toolbar', 'top', 'undefined', 'webkitIndexedDB', 'webkitStorageInfo', 'window']

	" Top-level properties
	let properties = ['decodeURI', 'decodeURIComponent', 'encodeURI', 'encodeURIComponent',
				\ 'eval', 'Infinity', 'isFinite', 'isNaN', 'NaN', 'Number', 'parseFloat',
				\ 'parseInt', 'String', 'undefined', 'escape', 'unescape']

	" Keywords
  let keywords = ['AnalyserNode', 'ApplicationCache', 'ApplicationCacheErrorEvent', 'Array', 'ArrayBuffer', 'Attr', 'Audio', 'AudioBuffer', 'AudioBufferSourceNode', 'AudioContext', 'AudioDestinationNode', 'AudioListener', 'AudioNode', 'AudioParam', 'AudioProcessingEvent', 'AutocompleteErrorEvent', 'BarProp', 'BeforeUnloadEvent', 'BiquadFilterNode', 'Blob', 'Boolean', 'CDATASection', 'CSSCharsetRule', 'CSSFontFaceRule', 'CSSImportRule', 'CSSKeyframeRule', 'CSSKeyframesRule', 'CSSMediaRule', 'CSSPageRule', 'CSSPrimitiveValue', 'CSSRule', 'CSSRuleList', 'CSSStyleDeclaration', 'CSSStyleRule', 'CSSStyleSheet', 'CSSUnknownRule', 'CSSValue', 'CSSValueList', 'CSSViewportRule', 'CanvasGradient', 'CanvasPattern', 'CanvasRenderingContext2D', 'ChannelMergerNode', 'ChannelSplitterNode', 'CharacterData', 'ClientRect', 'ClientRectList', 'CloseEvent', 'Comment', 'CompositionEvent', 'ConvolverNode', 'Counter', 'CustomEvent', 'DOMError', 'DOMException', 'DOMImplementation', 'DOMParser', 'DOMSettableTokenList', 'DOMStringList', 'DOMStringMap', 'DOMTokenList', 'DataTransfer', 'DataTransferItemList', 'DataView', 'Date', 'DelayNode', 'DeviceMotionEvent', 'DeviceOrientationEvent', 'Document', 'DocumentFragment', 'DocumentType', 'DynamicsCompressorNode', 'Element', 'Error', 'ErrorEvent', 'EvalError', 'Event', 'EventSource', 'EventTarget', 'File', 'FileError', 'FileList', 'FileReader', 'Float32Array', 'Float64Array', 'FocusEvent', 'FontFace', 'FormData', 'Function', 'GainNode', 'Gamepad', 'GamepadEvent', 'HTMLAllCollection', 'HTMLAnchorElement', 'HTMLAppletElement', 'HTMLAreaElement', 'HTMLAudioElement', 'HTMLBRElement', 'HTMLBaseElement', 'HTMLBodyElement', 'HTMLButtonElement', 'HTMLCanvasElement', 'HTMLCollection', 'HTMLContentElement', 'HTMLDListElement', 'HTMLDataListElement', 'HTMLDialogElement', 'HTMLDirectoryElement', 'HTMLDivElement', 'HTMLDocument', 'HTMLElement', 'HTMLEmbedElement', 'HTMLFieldSetElement', 'HTMLFontElement', 'HTMLFormControlsCollection', 'HTMLFormElement', 'HTMLFrameElement', 'HTMLFrameSetElement', 'HTMLHRElement', 'HTMLHeadElement', 'HTMLHeadingElement', 'HTMLHtmlElement', 'HTMLIFrameElement', 'HTMLImageElement', 'HTMLInputElement', 'HTMLKeygenElement', 'HTMLLIElement', 'HTMLLabelElement', 'HTMLLegendElement', 'HTMLLinkElement', 'HTMLMapElement', 'HTMLMarqueeElement', 'HTMLMediaElement', 'HTMLMenuElement', 'HTMLMetaElement', 'HTMLMeterElement', 'HTMLModElement', 'HTMLOListElement', 'HTMLObjectElement', 'HTMLOptGroupElement', 'HTMLOptionElement', 'HTMLOptionsCollection', 'HTMLOutputElement', 'HTMLParagraphElement', 'HTMLParamElement', 'HTMLPreElement', 'HTMLProgressElement', 'HTMLQuoteElement', 'HTMLScriptElement', 'HTMLSelectElement', 'HTMLShadowElement', 'HTMLSourceElement', 'HTMLSpanElement', 'HTMLStyleElement', 'HTMLTableCaptionElement', 'HTMLTableCellElement', 'HTMLTableColElement', 'HTMLTableElement', 'HTMLTableRowElement', 'HTMLTableSectionElement', 'HTMLTemplateElement', 'HTMLTextAreaElement', 'HTMLTitleElement', 'HTMLTrackElement', 'HTMLUListElement', 'HTMLUnknownElement', 'HTMLVideoElement', 'HashChangeEvent', 'History', 'IDBCursor', 'IDBCursorWithValue', 'IDBDatabase', 'IDBFactory', 'IDBIndex', 'IDBKeyRange', 'IDBObjectStore', 'IDBOpenDBRequest', 'IDBRequest', 'IDBTransaction', 'IDBVersionChangeEvent', 'Image', 'ImageBitmap', 'ImageData', 'InputMethodContext', 'Int16Array', 'Int32Array', 'Int8Array', 'KeyboardEvent', 'Location', 'MediaElementAudioSourceNode', 'MediaError', 'MediaKeyError', 'MediaKeyEvent', 'MediaList', 'MediaSource', 'MediaStreamAudioDestinationNode', 'MediaStreamAudioSourceNode', 'MediaStreamEvent', 'MediaStreamTrack', 'MessageChannel', 'MessageEvent', 'MessagePort', 'MimeType', 'MimeTypeArray', 'MouseEvent', 'MutationEvent', 'MutationObserver', 'MutationRecord', 'NamedNodeMap', 'Navigator', 'Node', 'NodeFilter', 'NodeIterator', 'NodeList', 'Notation', 'Notification', 'Number', 'Object', 'OfflineAudioCompletionEvent', 'OfflineAudioContext', 'Option', 'OscillatorNode', 'OverflowEvent', 'PageTransitionEvent', 'Path2D', 'Performance', 'PerformanceEntry', 'PerformanceMark', 'PerformanceMeasure', 'PerformanceNavigation', 'PerformanceResourceTiming', 'PerformanceTiming', 'PeriodicWave', 'Plugin', 'PluginArray', 'PopStateEvent', 'ProcessingInstruction', 'ProgressEvent', 'Promise', 'RGBColor', 'RTCIceCandidate', 'RTCSessionDescription', 'Range', 'RangeError', 'Rect', 'ReferenceError', 'RegExp', 'SVGAElement', 'SVGAltGlyphDefElement', 'SVGAltGlyphElement', 'SVGAltGlyphItemElement', 'SVGAngle', 'SVGAnimateElement', 'SVGAnimateMotionElement', 'SVGAnimateTransformElement', 'SVGAnimatedAngle', 'SVGAnimatedBoolean', 'SVGAnimatedEnumeration', 'SVGAnimatedInteger', 'SVGAnimatedLength', 'SVGAnimatedLengthList', 'SVGAnimatedNumber', 'SVGAnimatedNumberList', 'SVGAnimatedPreserveAspectRatio', 'SVGAnimatedRect', 'SVGAnimatedString', 'SVGAnimatedTransformList', 'SVGAnimationElement', 'SVGCircleElement', 'SVGClipPathElement', 'SVGComponentTransferFunctionElement', 'SVGCursorElement', 'SVGDefsElement', 'SVGDescElement', 'SVGDiscardElement', 'SVGElement', 'SVGEllipseElement', 'SVGFEBlendElement', 'SVGFEColorMatrixElement', 'SVGFEComponentTransferElement', 'SVGFECompositeElement', 'SVGFEConvolveMatrixElement', 'SVGFEDiffuseLightingElement', 'SVGFEDisplacementMapElement', 'SVGFEDistantLightElement', 'SVGFEDropShadowElement', 'SVGFEFloodElement', 'SVGFEFuncAElement', 'SVGFEFuncBElement', 'SVGFEFuncGElement', 'SVGFEFuncRElement', 'SVGFEGaussianBlurElement', 'SVGFEImageElement', 'SVGFEMergeElement', 'SVGFEMergeNodeElement', 'SVGFEMorphologyElement', 'SVGFEOffsetElement', 'SVGFEPointLightElement', 'SVGFESpecularLightingElement', 'SVGFESpotLightElement', 'SVGFETileElement', 'SVGFETurbulenceElement', 'SVGFilterElement', 'SVGFontElement', 'SVGFontFaceElement', 'SVGFontFaceFormatElement', 'SVGFontFaceNameElement', 'SVGFontFaceSrcElement', 'SVGFontFaceUriElement', 'SVGForeignObjectElement', 'SVGGElement', 'SVGGeometryElement', 'SVGGlyphElement', 'SVGGlyphRefElement', 'SVGGradientElement', 'SVGGraphicsElement', 'SVGHKernElement', 'SVGImageElement', 'SVGLength', 'SVGLengthList', 'SVGLineElement', 'SVGLinearGradientElement', 'SVGMPathElement', 'SVGMarkerElement', 'SVGMaskElement', 'SVGMatrix', 'SVGMetadataElement', 'SVGMissingGlyphElement', 'SVGNumber', 'SVGNumberList', 'SVGPathElement', 'SVGPathSeg', 'SVGPathSegArcAbs', 'SVGPathSegArcRel', 'SVGPathSegClosePath', 'SVGPathSegCurvetoCubicAbs', 'SVGPathSegCurvetoCubicRel', 'SVGPathSegCurvetoCubicSmoothAbs', 'SVGPathSegCurvetoCubicSmoothRel', 'SVGPathSegCurvetoQuadraticAbs', 'SVGPathSegCurvetoQuadraticRel', 'SVGPathSegCurvetoQuadraticSmoothAbs', 'SVGPathSegCurvetoQuadraticSmoothRel', 'SVGPathSegLinetoAbs', 'SVGPathSegLinetoHorizontalAbs', 'SVGPathSegLinetoHorizontalRel', 'SVGPathSegLinetoRel', 'SVGPathSegLinetoVerticalAbs', 'SVGPathSegLinetoVerticalRel', 'SVGPathSegList', 'SVGPathSegMovetoAbs', 'SVGPathSegMovetoRel', 'SVGPatternElement', 'SVGPoint', 'SVGPointList', 'SVGPolygonElement', 'SVGPolylineElement', 'SVGPreserveAspectRatio', 'SVGRadialGradientElement', 'SVGRect', 'SVGRectElement', 'SVGRenderingIntent', 'SVGSVGElement', 'SVGScriptElement', 'SVGSetElement', 'SVGStopElement', 'SVGStringList', 'SVGStyleElement', 'SVGSwitchElement', 'SVGSymbolElement', 'SVGTSpanElement', 'SVGTextContentElement', 'SVGTextElement', 'SVGTextPathElement', 'SVGTextPositioningElement', 'SVGTitleElement', 'SVGTransform', 'SVGTransformList', 'SVGUnitTypes', 'SVGUseElement', 'SVGVKernElement', 'SVGViewElement', 'SVGViewSpec', 'SVGZoomEvent', 'Screen', 'ScriptProcessorNode', 'Selection', 'ShadowRoot', 'SharedWorker', 'SpeechSynthesisEvent', 'SpeechSynthesisUtterance', 'Storage', 'StorageEvent', 'String', 'StyleSheet', 'StyleSheetList', 'SyntaxError', 'Text', 'TextEvent', 'TextMetrics', 'TextTrack', 'TextTrackCue', 'TextTrackCueList', 'TextTrackList', 'TimeRanges', 'Touch', 'TouchEvent', 'TouchList', 'TrackEvent', 'TransitionEvent', 'TreeWalker', 'TypeError', 'UIEvent', 'URIError', 'URL', 'Uint16Array', 'Uint32Array', 'Uint8Array', 'Uint8ClampedArray', 'VTTCue', 'ValidityState', 'WaveShaperNode', 'WeakMap', 'WeakSet', 'WebGLActiveInfo', 'WebGLBuffer', 'WebGLContextEvent', 'WebGLFramebuffer', 'WebGLProgram', 'WebGLRenderbuffer', 'WebGLRenderingContext', 'WebGLShader', 'WebGLShaderPrecisionFormat', 'WebGLTexture', 'WebGLUniformLocation', 'WebKitAnimationEvent', 'WebKitCSSFilterRule', 'WebKitCSSFilterValue', 'WebKitCSSMatrix', 'WebKitCSSTransformValue', 'WebKitGamepad', 'WebKitMutationObserver', 'WebKitPoint', 'WebKitTransitionEvent', 'WebSocket', 'WheelEvent', 'Window', 'Worker', 'XMLDocument', 'XMLHttpRequest', 'XMLHttpRequestProgressEvent', 'XMLHttpRequestUpload', 'XMLSerializer', 'XPathEvaluator', 'XPathExpression', 'XPathResult', 'XSLTProcessor', 'abstract', 'boolean', 'break', 'byte', 'case', 'catch', 'char', 'class', 'continue', 'debugger', 'default', 'delete', 'do', 'double ', 'else', 'enum', 'export', 'extends', 'false', 'final', 'finally', 'float', 'for', 'function', 'goto', 'if', 'implements', 'import', 'in ', 'instanceof', 'int', 'interface', 'long', 'native', 'new', 'null', 'package', 'private', 'protected', 'public', 'return', 'short', 'static', 'super ', 'switch', 'synchronized', 'this', 'throw', 'throws', 'transient', 'true', 'try', 'typeof', 'var', 'void', 'volatile', 'while', 'with', 'console']

	let values = variables + builtin + functions + htmldom + arguments + properties + keywords

	for m in values
		if m =~? '^'.a:base
			call add(res, m)
		elseif m =~? a:base
			call add(res2, m)
		endif
	endfor

	let menu = res + res2
	let final_menu = []
	for i in range(len(menu))
		let item = menu[i]
		if item =~ '($'
			let kind = 'f'
			if has_key(b:js_menuinfo, item)
				let m_info = b:js_menuinfo[item]
			else
				let m_info = ''
			endif
		else
			let kind = 'v'
			let m_info = ''
		endif
		let final_menu += [{'word':item, 'menu':m_info, 'kind':kind}]
	endfor
	let g:fm = final_menu
	return final_menu

endfunction
