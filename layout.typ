#import "style.typ": ziti, zihao
#import "@preview/numbly:0.1.0": numbly

#let no-numbering-page-header(body) = {
  set page(header: context {
    set text(font: ziti.songti, size: zihao.xiaowu)
    set par(leading: 12pt)

    // 获取当前标题内容
    let headingTitle = ""
    let headingNumber = ""

    // 对章节第一页做特殊处理，因为制作章节第一页的页眉时，当前章节标题还没出现
    // 所以 query 中使用 after(here())
    // 同时要 filter 出当前页的，不能把后面章节标题弄进来了
    let elems = query(selector(heading.where(level: 1)).after(here())).filter(it => (
      it.location().page() == here().page()
    ))

    if elems.len() != 0 {
      // 如果 filter 出来的结果非空，意味着我们就在章节首页
      // 在制作页眉时当前章节标题还没出现，因此章节编号要加上 1
      headingTitle = elems.last().body
    } else {
      // 如果 filter 出来的结果为空，意味着我们就在章节中间
      // 重新使用 before(here()) 进行 query 来查询章节标题
      elems = query(selector(heading.where(level: 1)).before(here()))
      headingTitle = elems.last().body
    }

    "上海交通大学硕士学位论文"
    h(1fr)
    headingTitle

    // 奇数页和偶数页的页眉是对称的
    // if calc.odd(counter(page).get().first()) {
    //   // 奇数页左边是论文名称，右边是章节标题
    //   "上海交通大学硕士学位论文"
    //   h(1fr)
    //   headingTitle
    // } else {
    //   // 偶数页对称过来
    //   headingTitle
    //   h(1fr)
    //   "上海交通大学硕士学位论文"
    // }

    // 画出页眉的两条线，一粗一细
    v(-10pt)
    line(length: 100%, stroke: 2.2416pt)
    v(-13pt)
    line(length: 100%, stroke: 0.7472pt)
  })
  body
}

#let main-text-page-header(body) = {
  set page(header: context {
    set text(font: ziti.songti, size: zihao.xiaowu)
    set par(leading: 12pt)

    // 获取当前标题内容
    let headingTitle = ""
    let headingNumber = ""

    // 对章节第一页做特殊处理，因为制作章节第一页的页眉时，当前章节标题还没出现
    // 所以 query 中使用 after(here())
    // 同时要 filter 出当前页的，不能把后面章节标题弄进来了
    let elems = query(selector(heading.where(level: 1)).after(here())).filter(it => (
      it.location().page() == here().page()
    ))

    if elems.len() != 0 {
      // 如果 filter 出来的结果非空，意味着我们就在章节首页
      // 在制作页眉时当前章节标题还没出现，因此章节编号要加上 1
      headingTitle = elems.last().body
      headingNumber = "第" + str(counter(heading).get().first() + 1) + "章"
    } else {
      // 如果 filter 出来的结果为空，意味着我们就在章节中间
      // 重新使用 before(here()) 进行 query 来查询章节标题
      elems = query(selector(heading.where(level: 1)).before(here()))
      headingTitle = elems.last().body
      headingNumber = "第" + str(counter(heading).get().first()) + "章"
    }

    "上海交通大学硕士学位论文"
    h(1fr)
    headingNumber
    h(1em)
    headingTitle

    // 奇数页和偶数页的页眉是对称的
    // if calc.odd(counter(page).get().first()) {
    //   // 奇数页左边是论文名称，右边是章节标题
    //   "上海交通大学硕士学位论文"
    //   h(1fr)
    //   headingNumber
    //   h(1em)
    //   headingTitle
    // } else {
    //   // 偶数页对称过来
    //   headingNumber
    //   h(1em)
    //   headingTitle
    //   h(1fr)
    //   "上海交通大学硕士学位论文"
    // }

    // 画出页眉的两条线，一粗一细
    v(-10pt)
    line(length: 100%, stroke: 2.2416pt)
    v(-13pt)
    line(length: 100%, stroke: 0.7472pt)
  })
  body
}

#let appendix-page-header(body) = {
  set page(header: context {
    set text(font: ziti.songti, size: zihao.xiaowu)
    set par(leading: 12pt)

    // 获取当前标题内容
    let headingTitle = ""
    let headingNumber = ""

    // 对章节第一页做特殊处理，因为制作章节第一页的页眉时，当前章节标题还没出现
    // 所以 query 中使用 after(here())
    // 同时要 filter 出当前页的，不能把后面章节标题弄进来了
    let elems = query(selector(heading.where(level: 1)).after(here())).filter(it => (
      it.location().page() == here().page()
    ))

    if elems.len() != 0 {
      // 如果 filter 出来的结果非空，意味着我们就在章节首页
      // 在制作页眉时当前章节标题还没出现，因此章节编号要加上 1
      headingTitle = elems.last().body
      headingNumber = "附录" + str.from-unicode("A".to-unicode() + counter(heading).get().first())
    } else {
      // 如果 filter 出来的结果为空，意味着我们就在章节中间
      // 重新使用 before(here()) 进行 query 来查询章节标题
      elems = query(selector(heading.where(level: 1)).before(here()))
      headingTitle = elems.last().body
      headingNumber = "附录" + str.from-unicode("A".to-unicode() + counter(heading).get().first() - 1)
    }

    "上海交通大学硕士学位论文"
    h(1fr)
    headingNumber
    h(1em)
    headingTitle

    // 奇数页和偶数页的页眉是对称的
    // if calc.odd(counter(page).get().first()) {
    //   // 奇数页左边是论文名称，右边是章节标题
    //   "上海交通大学硕士学位论文"
    //   h(1fr)
    //   headingNumber
    //   h(1em)
    //   headingTitle
    // } else {
    //   // 偶数页对称过来
    //   headingNumber
    //   h(1em)
    //   headingTitle
    //   h(1fr)
    //   "上海交通大学硕士学位论文"
    // }

    // 画出页眉的两条线，一粗一细
    v(-10pt)
    line(length: 100%, stroke: 2.2416pt)
    v(-13pt)
    line(length: 100%, stroke: 0.7472pt)
  })
  body
}

#let no-numbering-first-heading(body) = {
  show heading.where(level: 1): set align(center)
  set heading(numbering: none)
  show heading.where(level: 1): it => {
    set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sanhao
  )
    set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
    //前后间距分别为24磅和6磅
    pagebreak()
    v(24pt)
    it.body
    v(18pt)
  }
  body
}

#let main-text-first-heading(body) = {
  show heading.where(level: 1): set align(center)
  set heading(
    numbering: numbly(
      "第{1}章 ",
      "{1}.{2} ",
      "{1}.{2}.{3} ",
      "{1}.{2}.{3}.{4} ",
    ),
  )
  show heading.where(level: 1): it => {
    set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sanhao
  )
    set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
    //前后间距分别为24磅和6磅
    pagebreak()
    v(24pt)
    counter(heading).display() + h(1em) + it.body
    v(18pt)
  }
  body
}

#let appendix-first-heading(body) = {
  show heading.where(level: 1): set align(center)
  set heading(
    numbering: numbly(
      "附录{1:A} ",
      "{1:A}.{2} ",
      "{1:A}.{2}.{3} ",
      "{1:A}.{2}.{3}.{4} ",
    ),
  )
  counter(heading).update(0)
  show heading.where(level: 1): it => {
    set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sanhao
  )
    set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
    //前后间距分别为24磅和6磅
    pagebreak()
    v(24pt)
    counter(heading).display() + h(1em) + it.body
    v(18pt)
  }
  body
}

#let other-heading(body) = {
  show heading.where(level: 2): it => {
    set text(
    // 数字用 Times Roman，中文用黑体，均为四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.sihao
  )
    set par(
    // 无缩进，行距18磅
    first-line-indent: 0em,
    leading: 18pt
  )
    //前后间距分别为24磅和6磅
    v(24pt)
    counter(heading).display() + h(1em) + it.body
    v(6pt)
  }


  // 设置三级标题
  show heading.where(level: 3): it => {
    set text(
    // 数字用 Times Roman，中文用黑体，均为小四号字，加粗
    font: ziti.heiti,
    weight: "bold",
    size: zihao.xiaosi
  )
    set par(
    // 无缩进，行距16磅
    first-line-indent: 0em,
    leading: 16pt
  )
    //前后间距分别为12磅和6磅
    v(12pt)
    counter(heading).display() + h(1em) + it.body
    v(6pt)
  }

  // 设置四级标题
  show heading.where(level: 4): it => {
    set text(
    // 小四号字，不加粗，字体与正文一致
    weight: "regular",
    size: zihao.xiaosi
  )
    set par(
    // 无缩进，行距16磅
    first-line-indent: 0em,
    leading: 16pt
  )
    //前后间距分别为6磅和6磅
    v(6pt)
    counter(heading).display() + h(1em) + it.body
    v(6pt)
  }
  body
}