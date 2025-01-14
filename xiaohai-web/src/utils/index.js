/**
 * 将时间解析为字符串
 * @param {(Object|string|number)} time
 * @param {string} cFormat
 * @returns {string | null}
 */
export function parseTime(time, cFormat) {
  if (arguments.length === 0 || !time) {
    return null
  }
  const format = cFormat || '{y}-{m}-{d} {h}:{i}:{s}'
  let date
  if (typeof time === 'object') {
    date = time
  } else {
    if ((typeof time === 'string')) {
      if ((/^[0-9]+$/.test(time))) {
        // support "1548221490638"
        time = parseInt(time)
      } else {
        // support safari
        // https://stackoverflow.com/questions/4310953/invalid-date-in-safari
        time = time.replace(new RegExp(/-/gm), '/')
      }
    }

    if ((typeof time === 'number') && (time.toString().length === 10)) {
      time = time * 1000
    }
    date = new Date(time)
  }
  const formatObj = {
    y: date.getFullYear(),
    m: date.getMonth() + 1,
    d: date.getDate(),
    h: date.getHours(),
    i: date.getMinutes(),
    s: date.getSeconds(),
    a: date.getDay()
  }
  const time_str = format.replace(/{([ymdhisa])+}/g, (result, key) => {
    const value = formatObj[key]
    // Note: getDay() returns 0 on Sunday
    if (key === 'a') {
      return ['日', '一', '二', '三', '四', '五', '六'][value]
    }
    return value.toString().padStart(2, '0')
  })
  return time_str
}

/**
 * @param {number} time
 * @param {string} option
 * @returns {string}
 */
export function formatTime(time, option) {
  if (('' + time).length === 10) {
    time = parseInt(time) * 1000
  } else {
    time = +time
  }
  const d = new Date(time)
  const now = Date.now()

  const diff = (now - d) / 1000

  if (diff < 30) {
    return '刚刚'
  } else if (diff < 3600) {
    // less 1 hour
    return Math.ceil(diff / 60) + '分钟前'
  } else if (diff < 3600 * 24) {
    return Math.ceil(diff / 3600) + '小时前'
  } else if (diff < 3600 * 24 * 2) {
    return '1天前'
  }
  if (option) {
    return parseTime(time, option)
  } else {
    return (
      d.getMonth() +
      1 +
      '月' +
      d.getDate() +
      '日' +
      d.getHours() +
      '时' +
      d.getMinutes() +
      '分'
    )
  }
}

/**
 * @param {string} url
 * @returns {Object}
 */
export function param2Obj(url) {
  const search = decodeURIComponent(url.split('?')[1]).replace(/\+/g, ' ')
  if (!search) {
    return {}
  }
  const obj = {}
  const searchArr = search.split('&')
  searchArr.forEach(v => {
    const index = v.indexOf('=')
    if (index !== -1) {
      const name = v.substring(0, index)
      const val = v.substring(index + 1, v.length)
      obj[name] = val
    }
  })
  return obj
}

/**
 * Check if an element has a class
 * @param {HTMLElement} elm
 * @param {string} cls
 * @returns {boolean}
 */
export function hasClass(ele, cls) {
  return !!ele.className.match(new RegExp('(\\s|^)' + cls + '(\\s|$)'))
}

/**
 * Add class to element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function addClass(ele, cls) {
  if (!hasClass(ele, cls)) ele.className += ' ' + cls
}

/**
 * Remove class from element
 * @param {HTMLElement} elm
 * @param {string} cls
 */
export function removeClass(ele, cls) {
  if (hasClass(ele, cls)) {
    const reg = new RegExp('(\\s|^)' + cls + '(\\s|$)')
    ele.className = ele.className.replace(reg, ' ')
  }
}
// 设置全局md编写图片路径
export function markdownImageFile(name) {
  return '../files'.replace(name, '')
}

// 获取路径中最后一个斜杠后面的数据
export function getLastSegment(input) {
  const lastSlashIndex = input.lastIndexOf('/')

  // 检查是否找到了 "/"
  if (lastSlashIndex !== -1) {
    // 使用substring获取最后一个 "/" 后面的数据
    return input.substring(lastSlashIndex + 1)
  } else {
    // 如果没有找到 "/", 返回整个输入字符串
    return input
  }
}

// 查找模板中已存在图片的名字和地址，返回的格式为[{text:'xxx',url: 'xxx.png'}]
export function findImg(str) {
  const regex = /!\[(.*?)\]\((.*?)\)/g
  const matches = []
  let match
  while ((match = regex.exec(str)) !== null) {
    const [, text, url] = match
    matches.push({ text, url })
  }
  return matches
}
// 字符截取长度，如果超过长度返回原数据
export function truncateString(str, maxLength) {
  if (str.length <= maxLength) {
    return str
  } else {
    return str.substring(0, maxLength)
  }
}
// 存储容量 封装
export function formatFileSize(fileSize) {
  const df = new Intl.NumberFormat(undefined, { maximumFractionDigits: 2 })

  let value = 0
  let unit = ''
  if (fileSize === undefined) {
    value = 0
    unit = 'B'
  } else if (fileSize < 1024) {
    value = fileSize
    unit = 'B'
  } else if (fileSize < 1048576) {
    value = fileSize / 1024
    unit = 'KB'
  } else if (fileSize < 1073741824) {
    value = fileSize / 1048576
    unit = 'MB'
  } else if (fileSize < 1099511627776) {
    value = fileSize / 1073741824
    unit = 'GB'
  } else {
    value = fileSize / 1099511627776
    unit = 'TB'
  }

  return { value: df.format(value), unit }
}
// 存储容量 还原
export function parseFileSize(formattedSize) {
  const unitMultiplier = {
    B: 1,
    KB: 1024,
    MB: 1048576,
    GB: 1073741824,
    TB: 1099511627776
  }

  const { value, unit } = formattedSize
  const numericValue = parseFloat(value)

  if (!isNaN(numericValue) && unitMultiplier.hasOwnProperty(unit)) {
    return numericValue * unitMultiplier[unit]
  } else {
    console.error('Invalid formatted size')
    return null
  }
}
