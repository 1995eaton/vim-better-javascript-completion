" (A more up-to-date) Vim completion script
" Language:  JavaScript
" Maintainer:  Jake Eaton (1995eaton@gmail.com)
" Last Change:  2014 Jun 23
" Original Maintainer: Mikolaj Machowski ( mikmach AT wp DOT pl )

let s:winds = ['top', 'undefined', 'Math', 'NaN', 'location', 'JSON', 'document', 'Intl', 'external', 'Infinity', 'window', 'speechSynthesis', 'localStorage', 'sessionStorage', 'applicationCache', 'webkitStorageInfo', 'indexedDB', 'webkitIndexedDB', 'crypto', 'CSS', 'performance', 'console', 'devicePixelRatio', 'styleMedia', 'parent', 'opener', 'frames', 'self', 'defaultstatus', 'defaultStatus', 'status', 'name', 'length', 'closed', 'pageYOffset', 'pageXOffset', 'scrollY', 'scrollX', 'screenTop', 'screenLeft', 'screenY', 'screenX', 'innerWidth', 'innerHeight', 'outerWidth', 'outerHeight', 'offscreenBuffering', 'frameElement', 'event', 'clientInformation', 'navigator', 'toolbar', 'statusbar', 'scrollbars', 'personalbar', 'menubar', 'locationbar', 'history', 'screen', 'onautocompleteerror', 'onautocomplete', 'ondeviceorientation', 'ondevicemotion', 'onunload', 'onstorage', 'onpopstate', 'onpageshow', 'onpagehide', 'ononline', 'onoffline', 'onmessage', 'onlanguagechange', 'onhashchange', 'onbeforeunload', 'onwaiting', 'onvolumechange', 'ontoggle', 'ontimeupdate', 'onsuspend', 'onsubmit', 'onstalled', 'onshow', 'onselect', 'onseeking', 'onseeked', 'onscroll', 'onresize', 'onreset', 'onratechange', 'onprogress', 'onplaying', 'onplay', 'onpause', 'onmousewheel', 'onmouseup', 'onmouseover', 'onmouseout', 'onmousemove', 'onmouseleave', 'onmouseenter', 'onmousedown', 'onloadstart', 'onloadedmetadata', 'onloadeddata', 'onload', 'onkeyup', 'onkeypress', 'onkeydown', 'oninvalid', 'oninput', 'onfocus', 'onerror', 'onended', 'onemptied', 'ondurationchange', 'ondrop', 'ondragstart', 'ondragover', 'ondragleave', 'ondragenter', 'ondragend', 'ondrag', 'ondblclick', 'oncuechange', 'oncontextmenu', 'onclose', 'onclick', 'onchange', 'oncanplaythrough', 'oncanplay', 'oncancel', 'onblur', 'onabort', 'onwheel', 'onwebkittransitionend', 'onwebkitanimationstart', 'onwebkitanimationiteration', 'onwebkitanimationend', 'ontransitionend', 'onsearch', 'TEMPORARY', 'PERSISTENT',
      \ 'EvalError(', 'ReferenceError(', 'Object(', 'Int32Array(', 'RegExp(', 'Uint32Array(', 'parseFloat(', 'decodeURI(', 'TypeError(', 'Int16Array(', 'RangeError(', 'escape(', 'Array(', 'WeakMap(', 'encodeURIComponent(', 'Promise(', 'decodeURIComponent(', 'URIError(', 'WeakSet(', 'Uint8Array(', 'Function(', 'SyntaxError(', 'Uint8ClampedArray(', 'Date(', 'Error(', 'parseInt(', 'unescape(', 'Float32Array(', 'encodeURI(', 'Int8Array(', 'Boolean(', 'ArrayBuffer(', 'Float64Array(', 'isFinite(', 'eval(', 'DataView(', 'String(', 'Uint16Array(', 'Number(', 'isNaN(', 'webkitOfflineAudioContext(', 'webkitAudioContext(', 'OfflineAudioContext(', 'AudioContext(', 'webkitSpeechRecognitionEvent(', 'webkitSpeechRecognitionError(', 'webkitSpeechRecognition(', 'webkitSpeechGrammarList(', 'webkitSpeechGrammar(', 'webkitRTCPeerConnection(', 'webkitMediaStream(', 'SpeechSynthesisUtterance(', 'SpeechSynthesisEvent(', 'Notification(', 'MediaSource(', 'XSLTProcessor(', 'SharedWorker(', 'MediaKeyEvent(', 'Path2D(', 'TimeRanges(', 'MediaError(', 'HTMLVideoElement(', 'HTMLSourceElement(', 'HTMLMediaElement(', 'Audio(', 'HTMLAudioElement(', 'FontFace(', 'MediaKeyError(', 'HTMLDialogElement(', 'webkitIDBTransaction(', 'webkitIDBRequest(', 'webkitIDBObjectStore(', 'webkitIDBKeyRange(', 'webkitIDBIndex(', 'webkitIDBFactory(', 'webkitIDBDatabase(', 'webkitIDBCursor(', 'WebSocket(', 'WebKitGamepad(', 'RTCSessionDescription(', 'RTCIceCandidate(', 'MediaStreamTrack(', 'MediaStreamEvent(', 'IDBVersionChangeEvent(', 'IDBTransaction(', 'IDBRequest(', 'IDBOpenDBRequest(', 'IDBObjectStore(', 'IDBKeyRange(', 'IDBIndex(', 'IDBFactory(', 'IDBDatabase(', 'IDBCursorWithValue(', 'IDBCursor(', 'GamepadEvent(', 'Gamepad(', 'DeviceOrientationEvent(', 'DeviceMotionEvent(', 'CloseEvent(', 'WaveShaperNode(', 'ScriptProcessorNode(', 'PeriodicWave(', 'OscillatorNode(', 'OfflineAudioCompletionEvent(', 'MediaStreamAudioSourceNode(', 'MediaStreamAudioDestinationNode(', 'MediaElementAudioSourceNode(', 'GainNode(', 'DynamicsCompressorNode(', 'DelayNode(', 'ConvolverNode(', 'ChannelSplitterNode(', 'ChannelMergerNode(', 'BiquadFilterNode(', 'AudioProcessingEvent(', 'AudioParam(', 'AudioNode(', 'AudioListener(', 'AudioDestinationNode(', 'AudioBufferSourceNode(', 'AudioBuffer(', 'AnalyserNode(', 'XPathResult(', 'XPathExpression(', 'XPathEvaluator(', 'XMLSerializer(', 'XMLHttpRequestUpload(', 'XMLHttpRequestProgressEvent(', 'XMLHttpRequest(', 'XMLDocument(', 'Worker(', 'Window(', 'WheelEvent(', 'WebKitPoint(', 'WebKitCSSTransformValue(', 'WebKitCSSMatrix(', 'WebKitCSSFilterValue(', 'WebKitCSSFilterRule(', 'WebKitAnimationEvent(', 'WebGLUniformLocation(', 'WebGLTexture(', 'WebGLShaderPrecisionFormat(', 'WebGLShader(', 'WebGLRenderingContext(', 'WebGLRenderbuffer(', 'WebGLProgram(', 'WebGLFramebuffer(', 'WebGLContextEvent(', 'WebGLBuffer(', 'WebGLActiveInfo(', 'ValidityState(', 'VTTCue(', 'URL(', 'UIEvent(', 'TreeWalker(', 'TransitionEvent(', 'TrackEvent(', 'TouchList(', 'TouchEvent(', 'Touch(', 'TextTrackList(', 'TextTrackCueList(', 'TextTrackCue(', 'TextTrack(', 'TextMetrics(', 'TextEvent(', 'Text(', 'StyleSheetList(', 'StyleSheet(', 'StorageEvent(', 'Storage(', 'ShadowRoot(', 'Selection(', 'Screen(', 'SVGZoomEvent(', 'SVGViewSpec(', 'SVGViewElement(', 'SVGUseElement(', 'SVGUnitTypes(', 'SVGTransformList(', 'SVGTransform(', 'SVGTitleElement(', 'SVGTextPositioningElement(', 'SVGTextPathElement(', 'SVGTextElement(', 'SVGTextContentElement(', 'SVGTSpanElement(', 'SVGSymbolElement(', 'SVGSwitchElement(', 'SVGStyleElement(', 'SVGStringList(', 'SVGStopElement(', 'SVGSetElement(', 'SVGScriptElement(', 'SVGSVGElement(', 'SVGRenderingIntent(', 'SVGRectElement(', 'SVGRect(', 'SVGRadialGradientElement(', 'SVGPreserveAspectRatio(', 'SVGPolylineElement(', 'SVGPolygonElement(', 'SVGPointList(', 'SVGPoint(', 'SVGPatternElement(', 'SVGPathSegMovetoRel(', 'SVGPathSegMovetoAbs(', 'SVGPathSegList(', 'SVGPathSegLinetoVerticalRel(', 'SVGPathSegLinetoVerticalAbs(', 'SVGPathSegLinetoRel(', 'SVGPathSegLinetoHorizontalRel(', 'SVGPathSegLinetoHorizontalAbs(', 'SVGPathSegLinetoAbs(', 'SVGPathSegCurvetoQuadraticSmoothRel(', 'SVGPathSegCurvetoQuadraticSmoothAbs(', 'SVGPathSegCurvetoQuadraticRel(', 'SVGPathSegCurvetoQuadraticAbs(', 'SVGPathSegCurvetoCubicSmoothRel(', 'SVGPathSegCurvetoCubicSmoothAbs(', 'SVGPathSegCurvetoCubicRel(', 'SVGPathSegCurvetoCubicAbs(', 'SVGPathSeg(', 'SVGPathSegClosePath(', 'SVGPathSegArcRel(', 'SVGPathSegArcAbs(', 'SVGPathElement(', 'SVGNumberList(', 'SVGNumber(', 'SVGMetadataElement(', 'SVGMatrix(', 'SVGMaskElement(', 'SVGMarkerElement(', 'SVGMPathElement(', 'SVGLinearGradientElement(', 'SVGLineElement(', 'SVGLengthList(', 'SVGLength(', 'SVGImageElement(', 'SVGGraphicsElement(', 'SVGGradientElement(', 'SVGGeometryElement(', 'SVGGElement(', 'SVGForeignObjectElement(', 'SVGFilterElement(', 'SVGFETurbulenceElement(', 'SVGFETileElement(', 'SVGFESpotLightElement(', 'SVGFESpecularLightingElement(', 'SVGFEPointLightElement(', 'SVGFEOffsetElement(', 'SVGFEMorphologyElement(', 'SVGFEMergeNodeElement(', 'SVGFEMergeElement(', 'SVGFEImageElement(', 'SVGFEGaussianBlurElement(', 'SVGFEFuncRElement(', 'SVGFEFuncGElement(', 'SVGFEFuncBElement(', 'SVGFEFuncAElement(', 'SVGFEFloodElement(', 'SVGFEDropShadowElement(', 'SVGFEDistantLightElement(', 'SVGFEDisplacementMapElement(', 'SVGFEDiffuseLightingElement(', 'SVGFEConvolveMatrixElement(', 'SVGFECompositeElement(', 'SVGFEComponentTransferElement(', 'SVGFEColorMatrixElement(', 'SVGFEBlendElement(', 'SVGEllipseElement(', 'SVGElement(', 'SVGDiscardElement(', 'SVGDescElement(', 'SVGDefsElement(', 'SVGCursorElement(', 'SVGComponentTransferFunctionElement(', 'SVGClipPathElement(', 'SVGCircleElement(', 'SVGAnimationElement(', 'SVGAnimatedTransformList(', 'SVGAnimatedString(', 'SVGAnimatedRect(', 'SVGAnimatedPreserveAspectRatio(', 'SVGAnimatedNumberList(', 'SVGAnimatedNumber(', 'SVGAnimatedLengthList(', 'SVGAnimatedLength(', 'SVGAnimatedInteger(', 'SVGAnimatedEnumeration(', 'SVGAnimatedBoolean(', 'SVGAnimatedAngle(', 'SVGAnimateTransformElement(', 'SVGAnimateMotionElement(', 'SVGAnimateElement(', 'SVGAngle(', 'SVGAElement(', 'Rect(', 'Range(', 'RGBColor(', 'ProgressEvent(', 'ProcessingInstruction(', 'PopStateEvent(', 'Plugin(', 'PluginArray(', 'PerformanceTiming(', 'PerformanceResourceTiming(', 'PerformanceNavigation(', 'PerformanceMeasure(', 'PerformanceMark(', 'PerformanceEntry(', 'Performance(', 'PageTransitionEvent(', 'OverflowEvent(', 'Notation(', 'NodeList(', 'NodeIterator(', 'NodeFilter', 'Node(', 'Navigator(', 'NamedNodeMap(', 'MutationRecord(', 'MutationObserver(', 'MutationEvent(', 'MouseEvent(', 'MimeType(', 'MimeTypeArray(', 'MessagePort(', 'MessageEvent(', 'MessageChannel(', 'MediaList(', 'Location(', 'KeyboardEvent(', 'InputMethodContext(', 'ImageData(', 'ImageBitmap(', 'History(', 'HashChangeEvent(', 'HTMLUnknownElement(', 'HTMLUListElement(', 'HTMLTrackElement(', 'HTMLTitleElement(', 'HTMLTextAreaElement(', 'HTMLTemplateElement(', 'HTMLTableSectionElement(', 'HTMLTableRowElement(', 'HTMLTableElement(', 'HTMLTableColElement(', 'HTMLTableCellElement(', 'HTMLTableCaptionElement(', 'HTMLStyleElement(', 'HTMLSpanElement(', 'HTMLShadowElement(', 'HTMLSelectElement(', 'HTMLScriptElement(', 'HTMLQuoteElement(', 'HTMLProgressElement(', 'HTMLPreElement(', 'HTMLParamElement(', 'HTMLParagraphElement(', 'HTMLOutputElement(', 'HTMLOptionsCollection(', 'Option(', 'HTMLOptionElement(', 'HTMLOptGroupElement(', 'HTMLObjectElement(', 'HTMLOListElement(', 'HTMLModElement(', 'HTMLMeterElement(', 'HTMLMetaElement(', 'HTMLMenuElement(', 'HTMLMarqueeElement(', 'HTMLMapElement(', 'HTMLLinkElement(', 'HTMLLegendElement(', 'HTMLLabelElement(', 'HTMLLIElement(', 'HTMLKeygenElement(', 'HTMLInputElement(', 'Image(', 'HTMLImageElement(', 'HTMLIFrameElement(', 'HTMLHtmlElement(', 'HTMLHeadingElement(', 'HTMLHeadElement(', 'HTMLHRElement(', 'HTMLFrameSetElement(', 'HTMLFrameElement(', 'HTMLFormElement(', 'HTMLFormControlsCollection(', 'HTMLFontElement(', 'HTMLFieldSetElement(', 'HTMLEmbedElement(', 'HTMLElement(', 'HTMLDocument(', 'HTMLDivElement(', 'HTMLDirectoryElement(', 'HTMLDataListElement(', 'HTMLDListElement(', 'HTMLContentElement(', 'HTMLCollection(', 'HTMLCanvasElement(', 'HTMLButtonElement(', 'HTMLBodyElement(', 'HTMLBaseElement(', 'HTMLBRElement(', 'HTMLAreaElement(', 'HTMLAppletElement(', 'HTMLAnchorElement(', 'HTMLAllCollection(', 'FormData(', 'FocusEvent(', 'FileReader(', 'FileList(', 'FileError(', 'File(', 'EventTarget(', 'EventSource(', 'Event(', 'ErrorEvent(', 'Element(', 'DocumentType(', 'DocumentFragment(', 'Document(', 'DataTransferItemList(', 'DataTransfer(', 'DOMTokenList(', 'DOMStringMap(', 'DOMStringList(', 'DOMSettableTokenList(', 'DOMParser(', 'DOMImplementation(', 'DOMException(', 'DOMError(', 'CustomEvent(', 'Counter(', 'CompositionEvent(', 'Comment(', 'ClientRectList(', 'ClientRect(', 'CharacterData(', 'CanvasRenderingContext2D(', 'CanvasPattern(', 'CanvasGradient(', 'CSSViewportRule(', 'CSSValueList(', 'CSSValue(', 'CSSUnknownRule(', 'CSSStyleSheet(', 'CSSStyleRule(', 'CSSStyleDeclaration(', 'CSSRuleList(', 'CSSRule(', 'CSSPrimitiveValue(', 'CSSPageRule(', 'CSSMediaRule(', 'CSSKeyframesRule(', 'CSSKeyframeRule(', 'CSSImportRule(', 'CSSFontFaceRule(', 'CSSCharsetRule(', 'CDATASection(', 'Blob(', 'BeforeUnloadEvent(', 'BarProp(', 'AutocompleteErrorEvent(', 'Attr(', 'ApplicationCacheErrorEvent(', 'ApplicationCache(', 'SVGVKernElement(', 'SVGMissingGlyphElement(', 'SVGHKernElement(', 'SVGGlyphRefElement(', 'SVGGlyphElement(', 'SVGFontFaceUriElement(', 'SVGFontFaceSrcElement(', 'SVGFontFaceNameElement(', 'SVGFontFaceFormatElement(', 'SVGFontFaceElement(', 'SVGFontElement(', 'SVGAltGlyphItemElement(', 'SVGAltGlyphElement(', 'SVGAltGlyphDefElement(', 'WebKitMutationObserver(', 'webkitURL(', 'WebKitTransitionEvent(', 'postMessage(', 'close(', 'blur(', 'focus(', 'getSelection(', 'print(', 'stop(', 'open(', 'alert(', 'confirm(', 'prompt(', 'find(', 'scrollBy(', 'scrollTo(', 'scroll(', 'moveBy(', 'moveTo(', 'resizeBy(', 'resizeTo(', 'matchMedia(', 'getComputedStyle(', 'getMatchedCSSRules(', 'webkitConvertPointFromPageToNode(', 'webkitConvertPointFromNodeToPage(', 'requestAnimationFrame(', 'cancelAnimationFrame(', 'webkitRequestAnimationFrame(', 'webkitCancelAnimationFrame(', 'webkitCancelRequestAnimationFrame(', 'captureEvents(', 'releaseEvents(', 'btoa(', 'atob(', 'setTimeout(', 'clearTimeout(', 'setInterval(', 'clearInterval(', 'showModalDialog(', 'webkitRequestFileSystem(', 'webkitResolveLocalFileSystemURL(', 'openDatabase(', 'addEventListener(', 'removeEventListener(', 'dispatchEvent(']

let s:arrays = ['constructor', 'index', 'input', 'length', 'prototype', 
      \ 'constructor(', 'toString(', 'toLocaleString(', 'join(', 'pop(', 'push(', 'concat(', 'reverse(', 'shift(', 'unshift(', 'slice(', 'splice(', 'sort(', 'filter(', 'forEach(', 'some(', 'every(', 'map(', 'indexOf(', 'lastIndexOf(', 'reduce(', 'reduceRight']

let s:dates = ['constructor(', 'toString(', 'toDateString(', 'toTimeString(', 'toLocaleString(', 'toLocaleDateString(', 'toLocaleTimeString(', 'valueOf(', 'getTime(', 'getFullYear(', 'getUTCFullYear(', 'getMonth(', 'getUTCMonth(', 'getDate(', 'getUTCDate(', 'getDay(', 'getUTCDay(', 'getHours(', 'getUTCHours(', 'getMinutes(', 'getUTCMinutes(', 'getSeconds(', 'getUTCSeconds(', 'getMilliseconds(', 'getUTCMilliseconds(', 'getTimezoneOffset(', 'setTime(', 'setMilliseconds(', 'setUTCMilliseconds(', 'setSeconds(', 'setUTCSeconds(', 'setMinutes(', 'setUTCMinutes(', 'setHours(', 'setUTCHours(', 'setDate(', 'setUTCDate(', 'setMonth(', 'setUTCMonth(', 'setFullYear(', 'setUTCFullYear(', 'toGMTString(', 'toUTCString(', 'getYear(', 'setYear(', 'toISOString(', 'toJSON(']

let s:funcs = ['length', 'name', 'arguments', 'caller',
      \ 'constructor(', 'bind(', 'toString(', 'call(', 'apply(']

let s:maths = ['E', 'LN10', 'LN2', 'LOG2E', 'LOG10E', 'PI', 'SQRT1_2', 'SQRT2',
      \ 'random(', 'abs(', 'acos(', 'asin(', 'atan(', 'ceil(', 'cos(', 'exp(', 'floor(', 'log(', 'round(', 'sin(', 'sqrt(', 'tan(', 'atan2(', 'pow(', 'max(', 'min(', 'imul(', 'sign(', 'trunc(', 'sinh(', 'cosh(', 'tanh(', 'asinh(', 'acosh(', 'atanh(', 'log10(', 'log2(', 'hypot(', 'fround(', 'clz32(', 'cbrt(', 'log1p(', 'expm1(']

let s:numbs = ['length', 'name', 'arguments', 'caller', 'prototype', 'MAX_VALUE', 'MIN_VALUE', 'NaN', 'NEGATIVE_INFINITY', 'POSITIVE_INFINITY', 'MAX_SAFE_INTEGER', 'MIN_SAFE_INTEGER', 'EPSILON', 'toFixed', 'toExponential', 'toPrecision',
      \ 'isFinite(', 'isInteger(', 'isNaN(', 'isSafeInteger(', 'parseInt(', 'parseFloat(']

let s:locas = ['ancestorOrigins', 'origin', 'hash', 'search', 'pathname', 'port', 'hostname', 'host', 'protocol', 'href',
      \ 'replace(', 'assign(', 'reload(', 'toString(', 'valueOf(']

let s:objes = ['length', 'name', 'arguments', 'caller', 'prototype',
      \ 'keys(', 'create(', 'defineProperty(', 'defineProperties(', 'freeze(', 'getPrototypeOf(', 'setPrototypeOf(', 'getOwnPropertyDescriptor(', 'getOwnPropertyNames(', 'is(', 'isExtensible(', 'isFrozen(', 'isSealed(', 'preventExtensions(', 'seal(', 'deliverChangeRecords(', 'getNotifier(', 'observe(', 'unobserve(', 'getOwnPropertySymbols(']

let s:reges = ['length', 'name', 'arguments', 'caller', 'prototype', 'input', 'multiline', 'lastMatch', 'lastParen', 'leftContext', 'rightContext',
      \ 'constructor(', 'exec(', 'test(', 'toString(', 'compile(']

let s:stris = ['length', 'name', 'arguments', 'caller', 'prototype', 'charAt', 'charCodeAt', 'concat', 'indexOf', 'lastIndexOf', 'localeCompare', 'match', 'normalize', 'replace', 'search', 'slice', 'split', 'substring', 'substr', 'toLowerCase', 'toLocaleLowerCase', 'toUpperCase', 'toLocaleUpperCase', 'trim', 'trimLeft', 'trimRight', 'link', 'anchor', 'fontcolor', 'fontsize', 'big', 'blink', 'bold', 'fixed', 'italics', 'small', 'strike', 'sub', 'sup', 'repeat', 'startsWith', 'endsWith', 'contains',
      \ 'fromCharCode(']


let s:ctxs = ['textBaseline', 'textAlign', 'font', 'lineDashOffset', 'miterLimit', 'lineJoin', 'lineCap', 'lineWidth', 'shadowColor', 'shadowBlur', 'shadowOffsetY', 'shadowOffsetX', 'fillStyle', 'strokeStyle', 'imageSmoothingEnabled', 'webkitImageSmoothingEnabled', 'globalCompositeOperation', 'globalAlpha', 'canvas',
      \ 'save(', 'restore(', 'scale(', 'rotate(', 'translate(', 'transform(', 'setTransform(', 'resetTransform(', 'createLinearGradient(', 'createRadialGradient(', 'createPattern(', 'clearRect(', 'fillRect(', 'strokeRect(', 'beginPath(', 'fill(', 'stroke(', 'drawFocusIfNeeded(', 'clip(', 'isPointInPath(', 'isPointInStroke(', 'fillText(', 'strokeText(', 'measureText(', 'drawImage(', 'createImageData(', 'getImageData(', 'putImageData(', 'getContextAttributes(', 'setLineDash(', 'getLineDash(', 'setAlpha(', 'setCompositeOperation(', 'setLineWidth(', 'setLineCap(', 'setLineJoin(', 'setMiterLimit(', 'clearShadow(', 'setStrokeColor(', 'setFillColor(', 'drawImageFromRect(', 'setShadow(', 'closePath(', 'moveTo(', 'lineTo(', 'quadraticCurveTo(', 'bezierCurveTo(', 'arcTo(', 'rect(', 'arc(', 'ellipse(']

let s:storage = ['clear(', 'constructor(', 'getItem(', 'key(', 'removeItem(', 'setItem(', 'length']

let s:bodys = ['onunload', 'onstorage', 'onpopstate', 'onpageshow', 'onpagehide', 'ononline', 'onoffline', 'onmessage', 'onlanguagechange', 'onhashchange', 'onbeforeunload', 'onscroll', 'onresize', 'onload', 'onfocus', 'onerror', 'onblur', 'vLink', 'text', 'link', 'bgColor', 'background', 'aLink', 'onautocompleteerror', 'onautocomplete', 'onwaiting', 'onvolumechange', 'ontoggle', 'ontimeupdate', 'onsuspend', 'onsubmit', 'onstalled', 'onshow', 'onselect', 'onseeking', 'onseeked', 'onreset', 'onratechange', 'onprogress', 'onplaying', 'onplay', 'onpause', 'onmousewheel', 'onmouseup', 'onmouseover', 'onmouseout', 'onmousemove', 'onmouseleave', 'onmouseenter', 'onmousedown', 'onloadstart', 'onloadedmetadata', 'onloadeddata', 'onkeyup', 'onkeypress', 'onkeydown', 'oninvalid', 'oninput', 'onended', 'onemptied', 'ondurationchange', 'ondrop', 'ondragstart', 'ondragover', 'ondragleave', 'ondragenter', 'ondragend', 'ondrag', 'ondblclick', 'oncuechange', 'oncontextmenu', 'onclose', 'onclick', 'onchange', 'oncanplaythrough', 'oncanplay', 'oncancel', 'onabort', 'spellcheck', 'isContentEditable', 'contentEditable', 'outerText', 'innerText', 'accessKey', 'hidden', 'webkitdropzone', 'draggable', 'tabIndex', 'dir', 'translate', 'lang', 'title', 'childElementCount', 'lastElementChild', 'firstElementChild', 'children', 'nextElementSibling', 'previousElementSibling', 'onwheel', 'onwebkitfullscreenerror', 'onwebkitfullscreenchange', 'onselectstart', 'onsearch', 'onpaste', 'oncut', 'oncopy', 'onbeforepaste', 'onbeforecut', 'onbeforecopy', 'shadowRoot', 'dataset', 'classList', 'className', 'outerHTML', 'innerHTML', 'scrollHeight', 'scrollWidth', 'scrollTop', 'scrollLeft', 'clientHeight', 'clientWidth', 'clientTop', 'clientLeft', 'offsetParent', 'offsetHeight', 'offsetWidth', 'offsetTop', 'offsetLeft', 'localName', 'prefix', 'namespaceURI', 'id', 'style', 'attributes', 'tagName', 'parentElement', 'textContent', 'baseURI', 'ownerDocument', 'nextSibling', 'previousSibling', 'lastChild', 'firstChild', 'childNodes', 'parentNode', 'nodeType', 'nodeValue', 'nodeName',
      \ 'click(', 'getAttribute(', 'setAttribute(', 'removeAttribute(', 'getAttributeNode(', 'setAttributeNode(', 'removeAttributeNode(', 'getElementsByTagName(', 'hasAttributes(', 'getAttributeNS(', 'setAttributeNS(', 'removeAttributeNS(', 'getElementsByTagNameNS(', 'getAttributeNodeNS(', 'setAttributeNodeNS(', 'hasAttribute(', 'hasAttributeNS(', 'matches(', 'focus(', 'blur(', 'scrollIntoView(', 'scrollIntoViewIfNeeded(', 'scrollByLines(', 'scrollByPages(', 'getElementsByClassName(', 'insertAdjacentElement(', 'insertAdjacentText(', 'insertAdjacentHTML(', 'webkitMatchesSelector(', 'createShadowRoot(', 'getDestinationInsertionPoints(', 'getClientRects(', 'getBoundingClientRect(', 'webkitRequestFullScreen(', 'webkitRequestFullscreen(', 'webkitRequestPointerLock(', 'requestPointerLock(', 'animate(', 'remove(', 'querySelector(', 'querySelectorAll(', 'insertBefore(', 'replaceChild(', 'removeChild(', 'appendChild(', 'hasChildNodes(', 'cloneNode(', 'normalize(', 'isSameNode(', 'isEqualNode(', 'lookupPrefix(', 'isDefaultNamespace(', 'lookupNamespaceURI(', 'compareDocumentPosition(', 'contains(', 'addEventListener(', 'removeEventListener(', 'dispatchEvent(']

let s:docus = ['vlinkColor', 'linkColor', 'alinkColor', 'fgColor', 'bgColor', 'compatMode', 'all', 'onautocompleteerror', 'onautocomplete', 'fonts', 'rootElement', 'childElementCount', 'lastElementChild', 'firstElementChild', 'children', 'onwaiting', 'onvolumechange', 'ontoggle', 'ontimeupdate', 'onsuspend', 'onsubmit', 'onstalled', 'onshow', 'onselect', 'onseeking', 'onseeked', 'onscroll', 'onresize', 'onreset', 'onratechange', 'onprogress', 'onplaying', 'onplay', 'onpause', 'onmousewheel', 'onmouseup', 'onmouseover', 'onmouseout', 'onmousemove', 'onmouseleave', 'onmouseenter', 'onmousedown', 'onloadstart', 'onloadedmetadata', 'onloadeddata', 'onload', 'onkeyup', 'onkeypress', 'onkeydown', 'oninvalid', 'oninput', 'onfocus', 'onerror', 'onended', 'onemptied', 'ondurationchange', 'ondrop', 'ondragstart', 'ondragover', 'ondragleave', 'ondragenter', 'ondragend', 'ondrag', 'ondblclick', 'oncuechange', 'oncontextmenu', 'onclose', 'onclick', 'onchange', 'oncanplaythrough', 'oncanplay', 'oncancel', 'onblur', 'onabort', 'webkitFullscreenElement', 'webkitFullscreenEnabled', 'webkitCurrentFullScreenElement', 'webkitFullScreenKeyboardInputAllowed', 'webkitIsFullScreen', 'currentScript', 'webkitHidden', 'webkitVisibilityState', 'hidden', 'visibilityState', 'onwheel', 'onwebkitpointerlockerror', 'onwebkitpointerlockchange', 'onwebkitfullscreenerror', 'onwebkitfullscreenchange', 'onselectstart', 'onselectionchange', 'onsearch', 'onreadystatechange', 'onpointerlockerror', 'onpointerlockchange', 'onpaste', 'oncut', 'oncopy', 'onbeforepaste', 'onbeforecut', 'onbeforecopy', 'webkitPointerLockElement', 'pointerLockElement', 'activeElement', 'selectedStylesheetSet', 'preferredStylesheetSet', 'characterSet', 'readyState', 'defaultCharset', 'charset', 'location', 'lastModified', 'anchors', 'scripts', 'forms', 'links', 'plugins', 'embeds', 'applets', 'images', 'head', 'body', 'cookie', 'URL', 'domain', 'referrer', 'title', 'designMode', 'dir', 'contentType', 'styleSheets', 'defaultView', 'documentURI', 'xmlStandalone', 'xmlVersion', 'xmlEncoding', 'inputEncoding', 'documentElement', 'implementation', 'doctype', 'parentElement', 'textContent', 'baseURI', 'localName', 'namespaceURI', 'ownerDocument', 'nextSibling', 'previousSibling', 'lastChild', 'firstChild', 'childNodes', 'parentNode', 'nodeType', 'nodeValue', 'nodeName',
      \ 'open(', 'close(', 'write(', 'writeln(', 'clear(', 'captureEvents(', 'releaseEvents(', 'createDocumentFragment(', 'createTextNode(', 'createComment(', 'createCDATASection(', 'createProcessingInstruction(', 'createAttribute(', 'getElementsByTagName(', 'importNode(', 'createAttributeNS(', 'getElementsByTagNameNS(', 'getElementById(', 'adoptNode(', 'createEvent(', 'createRange(', 'createNodeIterator(', 'createTreeWalker(', 'getOverrideStyle(', 'execCommand(', 'queryCommandEnabled(', 'queryCommandIndeterm(', 'queryCommandState(', 'queryCommandSupported(', 'queryCommandValue(', 'getElementsByName(', 'elementFromPoint(', 'caretRangeFromPoint(', 'getSelection(', 'getCSSCanvasContext(', 'getElementsByClassName(', 'hasFocus(', 'exitPointerLock(', 'webkitExitPointerLock(', 'registerElement(', 'createElement(', 'createElementNS(', 'webkitCancelFullScreen(', 'webkitExitFullscreen(', 'querySelector(', 'querySelectorAll(', 'createExpression(', 'createNSResolver(', 'evaluate(', 'insertBefore(', 'replaceChild(', 'removeChild(', 'appendChild(', 'hasChildNodes(', 'cloneNode(', 'normalize(', 'isSameNode(', 'isEqualNode(', 'lookupPrefix(', 'isDefaultNamespace(', 'lookupNamespaceURI(', 'compareDocumentPosition(', 'contains(', 'addEventListener(', 'removeEventListener(', 'dispatchEvent(']

let s:hists = ['state', 'length',
      \ 'back(', 'forward(', 'go(', 'pushState(', 'replaceState(']

let s:imags = ['y', 'x', 'width', 'vspace', 'useMap', 'srcset', 'src', 'naturalWidth', 'naturalHeight', 'name', 'lowsrc', 'longDesc', 'isMap', 'hspace', 'height', 'crossOrigin', 'complete', 'border', 'alt', 'align', 'onautocompleteerror', 'onautocomplete', 'onwaiting', 'onvolumechange', 'ontoggle', 'ontimeupdate', 'onsuspend', 'onsubmit', 'onstalled', 'onshow', 'onselect', 'onseeking', 'onseeked', 'onscroll', 'onresize', 'onreset', 'onratechange', 'onprogress', 'onplaying', 'onplay', 'onpause', 'onmousewheel', 'onmouseup', 'onmouseover', 'onmouseout', 'onmousemove', 'onmouseleave', 'onmouseenter', 'onmousedown', 'onloadstart', 'onloadedmetadata', 'onloadeddata', 'onload', 'onkeyup', 'onkeypress', 'onkeydown', 'oninvalid', 'oninput', 'onfocus', 'onerror', 'onended', 'onemptied', 'ondurationchange', 'ondrop', 'ondragstart', 'ondragover', 'ondragleave', 'ondragenter', 'ondragend', 'ondrag', 'ondblclick', 'oncuechange', 'oncontextmenu', 'onclose', 'onclick', 'onchange', 'oncanplaythrough', 'oncanplay', 'oncancel', 'onblur', 'onabort', 'spellcheck', 'isContentEditable', 'contentEditable', 'outerText', 'innerText', 'accessKey', 'hidden', 'webkitdropzone', 'draggable', 'tabIndex', 'dir', 'translate', 'lang', 'title', 'childElementCount', 'lastElementChild', 'firstElementChild', 'children', 'nextElementSibling', 'previousElementSibling', 'onwheel', 'onwebkitfullscreenerror', 'onwebkitfullscreenchange', 'onselectstart', 'onsearch', 'onpaste', 'oncut', 'oncopy', 'onbeforepaste', 'onbeforecut', 'onbeforecopy', 'shadowRoot', 'dataset', 'classList', 'className', 'outerHTML', 'innerHTML', 'scrollHeight', 'scrollWidth', 'scrollTop', 'scrollLeft', 'clientHeight', 'clientWidth', 'clientTop', 'clientLeft', 'offsetParent', 'offsetHeight', 'offsetWidth', 'offsetTop', 'offsetLeft', 'localName', 'prefix', 'namespaceURI', 'id', 'style', 'attributes', 'tagName', 'parentElement', 'textContent', 'baseURI', 'ownerDocument', 'nextSibling', 'previousSibling', 'lastChild', 'firstChild', 'childNodes', 'parentNode', 'nodeType', 'nodeValue', 'nodeName',
      \ 'click(', 'getAttribute(', 'setAttribute(', 'removeAttribute(', 'getAttributeNode(', 'setAttributeNode(', 'removeAttributeNode(', 'getElementsByTagName(', 'hasAttributes(', 'getAttributeNS(', 'setAttributeNS(', 'removeAttributeNS(', 'getElementsByTagNameNS(', 'getAttributeNodeNS(', 'setAttributeNodeNS(', 'hasAttribute(', 'hasAttributeNS(', 'matches(', 'focus(', 'blur(', 'scrollIntoView(', 'scrollIntoViewIfNeeded(', 'scrollByLines(', 'scrollByPages(', 'getElementsByClassName(', 'insertAdjacentElement(', 'insertAdjacentText(', 'insertAdjacentHTML(', 'webkitMatchesSelector(', 'createShadowRoot(', 'getDestinationInsertionPoints(', 'getClientRects(', 'getBoundingClientRect(', 'webkitRequestFullScreen(', 'webkitRequestFullscreen(', 'webkitRequestPointerLock(', 'requestPointerLock(', 'animate(', 'remove(', 'querySelector(', 'querySelectorAll(', 'insertBefore(', 'replaceChild(', 'removeChild(', 'appendChild(', 'hasChildNodes(', 'cloneNode(', 'normalize(', 'isSameNode(', 'isEqualNode(', 'lookupPrefix(', 'isDefaultNamespace(', 'lookupNamespaceURI(', 'compareDocumentPosition(', 'contains(', 'addEventListener(', 'removeEventListener(', 'dispatchEvent(']

let s:navis = ['webkitPersistentStorage', 'webkitTemporaryStorage', 'geolocation', 'doNotTrack', 'onLine', 'languages', 'language', 'userAgent', 'product', 'platform', 'appVersion', 'appName', 'appCodeName', 'hardwareConcurrency', 'maxTouchPoints', 'vendorSub', 'vendor', 'productSub', 'cookieEnabled', 'mimeTypes', 'plugins',
      \ 'javaEnabled(', 'getStorageUpdates(', 'vibrate(', 'webkitGetGamepads(', 'getGamepads(', 'webkitGetUserMedia(', 'getMediaDevices(', 'registerProtocolHandler(']

let s:scres = ['availWidth', 'availHeight', 'availTop', 'availLeft', 'pixelDepth', 'colorDepth', 'width', 'height']

let s:styls = ['parentRule', 'length', 'cssText', 'alignContent', 'alignItems', 'alignSelf', 'alignmentBaseline', 'all', 'backfaceVisibility', 'background', 'backgroundAttachment', 'backgroundBlendMode', 'backgroundClip', 'backgroundColor', 'backgroundImage', 'backgroundOrigin', 'backgroundPosition', 'backgroundPositionX', 'backgroundPositionY', 'backgroundRepeat', 'backgroundRepeatX', 'backgroundRepeatY', 'backgroundSize', 'baselineShift', 'border', 'borderBottom', 'borderBottomColor', 'borderBottomLeftRadius', 'borderBottomRightRadius', 'borderBottomStyle', 'borderBottomWidth', 'borderCollapse', 'borderColor', 'borderImage', 'borderImageOutset', 'borderImageRepeat', 'borderImageSlice', 'borderImageSource', 'borderImageWidth', 'borderLeft', 'borderLeftColor', 'borderLeftStyle', 'borderLeftWidth', 'borderRadius', 'borderRight', 'borderRightColor', 'borderRightStyle', 'borderRightWidth', 'borderSpacing', 'borderStyle', 'borderTop', 'borderTopColor', 'borderTopLeftRadius', 'borderTopRightRadius', 'borderTopStyle', 'borderTopWidth', 'borderWidth', 'bottom', 'boxShadow', 'boxSizing', 'bufferedRendering', 'captionSide', 'clear', 'clip', 'clipPath', 'clipRule', 'color', 'colorInterpolation', 'colorInterpolationFilters', 'colorRendering', 'content', 'counterIncrement', 'counterReset', 'cursor', 'direction', 'display', 'dominantBaseline', 'emptyCells', 'enableBackground', 'fill', 'fillOpacity', 'fillRule', 'filter', 'flex', 'flexBasis', 'flexDirection', 'flexFlow', 'flexGrow', 'flexShrink', 'flexWrap', 'float', 'floodColor', 'floodOpacity', 'font', 'fontFamily', 'fontKerning', 'fontSize', 'fontStretch', 'fontStyle', 'fontVariant', 'fontVariantLigatures', 'fontWeight', 'glyphOrientationHorizontal', 'glyphOrientationVertical', 'height', 'imageRendering', 'justifyContent', 'left', 'letterSpacing', 'lightingColor', 'lineHeight', 'listStyle', 'listStyleImage', 'listStylePosition', 'listStyleType', 'margin', 'marginBottom', 'marginLeft', 'marginRight', 'marginTop', 'marker', 'markerEnd', 'markerMid', 'markerStart', 'mask', 'maskType', 'maxHeight', 'maxWidth', 'maxZoom', 'minHeight', 'minWidth', 'minZoom', 'objectFit', 'objectPosition', 'opacity', 'order', 'orientation', 'orphans', 'outline', 'outlineColor', 'outlineOffset', 'outlineStyle', 'outlineWidth', 'overflow', 'overflowWrap', 'overflowX', 'overflowY', 'padding', 'paddingBottom', 'paddingLeft', 'paddingRight', 'paddingTop', 'page', 'pageBreakAfter', 'pageBreakBefore', 'pageBreakInside', 'paintOrder', 'perspective', 'perspectiveOrigin', 'pointerEvents', 'position', 'quotes', 'resize', 'right', 'shapeImageThreshold', 'shapeMargin', 'shapeOutside', 'shapeRendering', 'size', 'speak', 'src', 'stopColor', 'stopOpacity', 'stroke', 'strokeDasharray', 'strokeDashoffset', 'strokeLinecap', 'strokeLinejoin', 'strokeMiterlimit', 'strokeOpacity', 'strokeWidth', 'tabSize', 'tableLayout', 'textAlign', 'textAnchor', 'textDecoration', 'textIndent', 'textLineThroughColor', 'textLineThroughMode', 'textLineThroughStyle', 'textLineThroughWidth', 'textOverflow', 'textOverlineColor', 'textOverlineMode', 'textOverlineStyle', 'textOverlineWidth', 'textRendering', 'textShadow', 'textTransform', 'textUnderlineColor', 'textUnderlineMode', 'textUnderlineStyle', 'textUnderlineWidth', 'top', 'touchAction', 'transform', 'transformOrigin', 'transformStyle', 'transition', 'transitionDelay', 'transitionDuration', 'transitionProperty', 'transitionTimingFunction', 'unicodeBidi', 'unicodeRange', 'userZoom', 'vectorEffect', 'verticalAlign', 'visibility', 'webkitAnimation', 'webkitAnimationDelay', 'webkitAnimationDirection', 'webkitAnimationDuration', 'webkitAnimationFillMode', 'webkitAnimationIterationCount', 'webkitAnimationName', 'webkitAnimationPlayState', 'webkitAnimationTimingFunction', 'webkitAppRegion', 'webkitAppearance', 'webkitAspectRatio', 'webkitBackfaceVisibility', 'webkitBackgroundClip', 'webkitBackgroundComposite', 'webkitBackgroundOrigin', 'webkitBackgroundSize', 'webkitBorderAfter', 'webkitBorderAfterColor', 'webkitBorderAfterStyle', 'webkitBorderAfterWidth', 'webkitBorderBefore', 'webkitBorderBeforeColor', 'webkitBorderBeforeStyle', 'webkitBorderBeforeWidth', 'webkitBorderEnd', 'webkitBorderEndColor', 'webkitBorderEndStyle', 'webkitBorderEndWidth', 'webkitBorderFit', 'webkitBorderHorizontalSpacing', 'webkitBorderImage', 'webkitBorderRadius', 'webkitBorderStart', 'webkitBorderStartColor', 'webkitBorderStartStyle', 'webkitBorderStartWidth', 'webkitBorderVerticalSpacing', 'webkitBoxAlign', 'webkitBoxDecorationBreak', 'webkitBoxDirection', 'webkitBoxFlex', 'webkitBoxFlexGroup', 'webkitBoxLines', 'webkitBoxOrdinalGroup', 'webkitBoxOrient', 'webkitBoxPack', 'webkitBoxReflect', 'webkitBoxShadow', 'webkitClipPath', 'webkitColumnBreakAfter', 'webkitColumnBreakBefore', 'webkitColumnBreakInside', 'webkitColumnCount', 'webkitColumnGap', 'webkitColumnRule', 'webkitColumnRuleColor', 'webkitColumnRuleStyle', 'webkitColumnRuleWidth', 'webkitColumnSpan', 'webkitColumnWidth', 'webkitColumns', 'webkitFilter', 'webkitFontFeatureSettings', 'webkitFontSizeDelta', 'webkitFontSmoothing', 'webkitHighlight', 'webkitHyphenateCharacter', 'webkitLineBoxContain', 'webkitLineBreak', 'webkitLineClamp', 'webkitLocale', 'webkitLogicalHeight', 'webkitLogicalWidth', 'webkitMarginAfter', 'webkitMarginAfterCollapse', 'webkitMarginBefore', 'webkitMarginBeforeCollapse', 'webkitMarginBottomCollapse', 'webkitMarginCollapse', 'webkitMarginEnd', 'webkitMarginStart', 'webkitMarginTopCollapse', 'webkitMask', 'webkitMaskBoxImage', 'webkitMaskBoxImageOutset', 'webkitMaskBoxImageRepeat', 'webkitMaskBoxImageSlice', 'webkitMaskBoxImageSource', 'webkitMaskBoxImageWidth', 'webkitMaskClip', 'webkitMaskComposite', 'webkitMaskImage', 'webkitMaskOrigin', 'webkitMaskPosition', 'webkitMaskPositionX', 'webkitMaskPositionY', 'webkitMaskRepeat', 'webkitMaskRepeatX', 'webkitMaskRepeatY', 'webkitMaskSize', 'webkitMaxLogicalHeight', 'webkitMaxLogicalWidth', 'webkitMinLogicalHeight', 'webkitMinLogicalWidth', 'webkitPaddingAfter', 'webkitPaddingBefore', 'webkitPaddingEnd', 'webkitPaddingStart', 'webkitPerspective', 'webkitPerspectiveOrigin', 'webkitPerspectiveOriginX', 'webkitPerspectiveOriginY', 'webkitPrintColorAdjust', 'webkitRtlOrdering', 'webkitRubyPosition', 'webkitTapHighlightColor', 'webkitTextCombine', 'webkitTextDecorationsInEffect', 'webkitTextEmphasis', 'webkitTextEmphasisColor', 'webkitTextEmphasisPosition', 'webkitTextEmphasisStyle', 'webkitTextFillColor', 'webkitTextOrientation', 'webkitTextSecurity', 'webkitTextStroke', 'webkitTextStrokeColor', 'webkitTextStrokeWidth', 'webkitTransform', 'webkitTransformOrigin', 'webkitTransformOriginX', 'webkitTransformOriginY', 'webkitTransformOriginZ', 'webkitTransformStyle', 'webkitTransition', 'webkitTransitionDelay', 'webkitTransitionDuration', 'webkitTransitionProperty', 'webkitTransitionTimingFunction', 'webkitUserDrag', 'webkitUserModify', 'webkitUserSelect', 'webkitWritingMode', 'whiteSpace', 'widows', 'width', 'willChange', 'wordBreak', 'wordSpacing', 'wordWrap', 'writingMode', 'zIndex', 'zoom',
      \ 'getPropertyValue(', 'removeProperty(', 'getPropertyPriority(', 'setProperty(', 'item(', 'getPropertyCSSValue(']

let s:niters = ['pointerBeforeReferenceNode', 'referenceNode', 'expandEntityReferences', 'filter', 'whatToShow', 'root',
      \ 'nextNode(', 'previousNode(', 'detach(']

let s:nfilter = ['FILTER_REJECT', 'SHOW_ENTITY_REFERENCE', 'SHOW_PROCESSING_INSTRUCTION', 'arguments', 'SHOW_DOCUMENT', 'SHOW_CDATA_SECTION', 'SHOW_DOCUMENT_FRAGMENT', 'length', 'prototype', 'FILTER_ACCEPT', 'SHOW_NOTATION', 'SHOW_ATTRIBUTE', 'SHOW_ALL', 'name', 'SHOW_COMMENT', 'SHOW_DOCUMENT_TYPE', 'SHOW_ENTITY', 'caller', 'SHOW_ELEMENT', 'FILTER_SKIP', 'SHOW_TEXT', 'acceptNode',
      \ 'toString(']

let s:twalkers = ['currentNode', 'expandEntityReferences', 'filter', 'whatToShow', 'root',
      \ 'parentNode(', 'firstChild(', 'lastChild(', 'previousSibling(', 'nextSibling(', 'previousNode(', 'nextNode(']

let s:console = ['memory',
      \ 'debug(', 'error(', 'info(', 'log(', 'warn(', 'dir(', 'dirxml(', 'table(', 'trace(', 'assert(', 'count(', 'markTimeline(', 'profile(', 'profileEnd(', 'time(', 'timeEnd(', 'timeStamp(', 'timeline(', 'timelineEnd(', 'group(', 'groupCollapsed(', 'groupEnd(', 'clear(']

let s:xmlhs = ['statusText', 'status', 'responseURL', 'response', 'responseType', 'responseXML', 'responseText', 'upload', 'withCredentials', 'readyState', 'timeout', 'onreadystatechange', 'ontimeout', 'onprogress', 'onloadstart', 'onloadend', 'onload', 'onerror', 'onabort',
      \ 'open(', 'setRequestHeader(', 'send(', 'abort(', 'getAllResponseHeaders(', 'getResponseHeader(', 'overrideMimeType(', 'addEventListener(', 'removeEventListener(', 'dispatchEvent(']

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

      if !exists('object_type')
        let object_type = ''
      endif

      if object_type == 'Date'
        let values = s:dates
      elseif object_type == 'Image'
        let values = s:imags
      elseif object_type == 'Array'
        let values = s:arrays
      elseif object_type == 'Object'
        let values = s:objes
      elseif object_type == 'Boolean'
        let values = ['arguments', 'caller', 'length', 'name', 'prototype', 'constructor', 'toString', 'valueOf']
      elseif object_type == 'XMLHttpRequest'
        let values = s:xmlhs
      elseif object_type == 'String'
        let values = s:stris
      elseif object_type == 'RegExp'
        let values = s:reges
      elseif object_type == 'Math'
        let values = s:maths
      elseif object_type == 'CanvasRenderingContext2D'
        let values = s:ctxs
      elseif object_type == 'NodeIterator'
        let values = s:niters
      elseif object_type == 'TreeWalker'
        let values = s:twalkers
      endif

      if !exists('values')
        if shortcontext =~ 'Math\.$'
          let values = s:maths
        elseif shortcontext =~ 'body\.$'
          let values = s:bodys
        elseif shortcontext =~ 'document\.$'
          let values = s:docus
        elseif shortcontext =~ 'history\.$'
          let values = s:hists
        elseif shortcontext =~ 'JSON\.$'
          let values = ['parse(', 'stringify(']
        elseif shortcontext =~ '\(local\|session\)Storage\.$'
          let values = s:storage
        elseif shortcontext =~ 'NodeFilter\.$'
          let values = s:nfilter
        elseif shortcontext =~ '\/.*\(\\\/\)\@!\/\.$'
          let values = s:reges
        elseif shortcontext =~ 'images\(\[.\{-}\]\)\?\.$'
          let values = s:imags
        elseif shortcontext =~ 'location\.$'
          let values = s:locas
        elseif shortcontext =~ 'navigator\.$'
          let values = s:navis
        elseif shortcontext =~ 'console\.$'
          let values = s:console
        elseif shortcontext =~ '\]\.$'
          let values = s:arrays
        elseif shortcontext =~ '\(}\|object\)\.$'
          let values = s:objes
        elseif shortcontext =~ 'screen\.$'
          let values = s:scres
        elseif shortcontext =~ 'style\.$'
          let values = s:styls
        elseif shortcontext =~ '\(top\|self\|window\)\.$'
          let values = s:winds
        else
          let values = user_props + s:bodys + s:arrays + s:dates +
                \ s:funcs + s:numbs + s:reges + s:stris + s:docus +
                \ s:imags + s:locas + s:navis + s:objes + s:scres + s:winds
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

    call map(arguments, 'matchstr(v:val, "function.\\{-}(\\zs.\\{-}\\ze)")')
    let jargs = join(arguments, ',')
    let jargs = substitute(jargs, '\s', '', 'g')
    let arguments = split(jargs, ',')
    let arguments = sort(arguments)


    let keywords = ['abstract', 'boolean', 'break', 'byte', 'case', 'catch', 'char', 'class', 'continue', 'debugger', 'default', 'delete', 'do', 'double ', 'else', 'enum', 'export', 'extends', 'false', 'final', 'finally', 'float', 'for', 'function', 'goto', 'if', 'implements', 'import', 'in ', 'instanceof', 'int', 'interface', 'long', 'native', 'new', 'null', 'package', 'private', 'protected', 'public', 'return', 'short', 'static', 'super ', 'switch', 'synchronized', 'this', 'throw', 'throws', 'transient', 'true', 'try', 'typeof', 'var', 'void', 'volatile', 'while', 'with', 'console']

    let values = variables + functions + arguments + keywords + s:winds

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
        let kind = '[F]'
        if has_key(b:js_menuinfo, item)
          let m_info = b:js_menuinfo[item]
        else
          let m_info = ''
        endif
      else
        let kind = '[V]'
        let m_info = ''
      endif
      let final_menu += [{'word':item, 'menu':m_info, 'kind':kind}]
    endfor
    let g:fm = final_menu
    return final_menu

endfunction
